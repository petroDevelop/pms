<%=packageName ? "package ${packageName}\n\n" : ''%>import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON
<%
    String idType='Long'
    if(domainClass.properties.find {it.name=='id'}.type==java.lang.String){
        idType='String'
    }
%>

class ${className}Controller {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[${propertyName}List: ${className}.list(params), ${propertyName}Total: ${className}.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=${className}.createCriteria().count{
            if(params.search){
                ilike('name',"%\${params.search}%");
            }
        }
        def allList=${className}.createCriteria().list{
            if(params.search){
                ilike('name',"%\${params.search}%");
            }
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:];
        map.total=allCount;
        map.rows=allList;
        render map as JSON;
    }
    def create() {
        [${propertyName}: new ${className}(params)]
    }

    def save() {
        def ${propertyName} = new ${className}(params)
        if (!${propertyName}.save(flush: true)) {
            render(view: "create", model: [${propertyName}: ${propertyName}])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
        redirect(action: "list", id: ${propertyName}.id)
    }

    def show(${idType} id) {
        def ${propertyName} = ${className}.get(id)
        if (!${propertyName}) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            redirect(action: "list")
            return
        }

        [${propertyName}: ${propertyName}]
    }

    def edit(${idType} id) {
        def ${propertyName} = ${className}.get(id)
        if (!${propertyName}) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            redirect(action: "list")
            return
        }

        [${propertyName}: ${propertyName}]
    }

    def update(${idType} id, Long version) {
        def ${propertyName} = ${className}.get(id)
        if (!${propertyName}) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (${propertyName}.version > version) {<% def lowerCaseName = grails.util.GrailsNameUtils.getPropertyName(className) %>
                    ${propertyName}.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: '${domainClass.propertyName}.label', default: '${className}')] as Object[],
                            "Another user has updated this ${className} while you were editing")
                render(view: "edit", model: [${propertyName}: ${propertyName}])
                return
            }
        }

        ${propertyName}.properties = params

        if (!${propertyName}.save(flush: true)) {
            render(view: "edit", model: [${propertyName}: ${propertyName}])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
        redirect(action: "list", id: ${propertyName}.id)
    }

    def delete(${idType} id) {
        def ${propertyName} = ${className}.get(id)
        if (!${propertyName}) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            redirect(action: "list")
            return
        }

        try {
            ${propertyName}.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            <%
            if(idType=='String'){
                %>
                def oneInstance=${className}.get(it);
                <%
            }else{ %>
                def oneInstance=${className}.get(it.toLong());
            <%
            }%>
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.ids])
        map.result=true;
        map.message=flash.message;
        render map as JSON;
    }
    def importExel(){
        def map=[:];
        def file = request.getFile('file');
        if(file ||!file?.empty) {  //file.originalFilename
            try{
                new ExcelReadBuilder(2003,file.bytes).eachLine([sheet:'sheet1',labels:true]) {
                   println "\${it.rowNum},\${cell[0]},\${cell[1]},\${cell[2]},\${cell[3]}......"
                }
                map.result=true;
            }catch(e){
                map.result=false;
                map.message=e.message;
            }
        }else{
            map.result=false;
            map.message="file is empty!";
        }
        render((map as JSON).toString());
    }
}
