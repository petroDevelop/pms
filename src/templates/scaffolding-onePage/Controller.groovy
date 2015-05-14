<%=packageName ? "package ${packageName}\n\n" : ''%>
import org.springframework.dao.DataIntegrityViolationException
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
    def serverSave(){
        def map=[:];
        if(!params.version){
            params.version=0l;
        }
        if(!params.id){
            map=this.save();
        }else{
            map=this.update(${(idType=='String')?'params.id':'params.id?.toLong()'},params.version?.toLong()?:0);
        }
        render "\${(map as JSON).toString()}";
    }
    def save() {
        def map=[:]
        def ${propertyName} = new ${className}(params)
        if (!${propertyName}.save(flush: true)) {
            map.result=false;
            //@todo
            map.message=${propertyName}.errors.allErrors.toString();
        }else{
            flash.message = message(code: 'default.created.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
            map.result=true;
            map.message=flash.message;
        }

        return map;
    }
    def update(${idType} id, Long version) {
        def map=[:]
        def ${propertyName} = ${className}.get(id)
        if (!${propertyName}) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            map.result=false;
            map.message=flash.message;
        }
        if (version != null) {
            if (${propertyName}.version > version) {<% def lowerCaseName = grails.util.GrailsNameUtils.getPropertyName(className) %>
                    ${propertyName}.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: '${domainClass.propertyName}.label', default: '${className}')] as Object[],
                            "Another user has updated this ${className} while you were editing")
                map.result=false;
                map.message=${propertyName}.errors.allErrors.toString();
            }
        }
        ${propertyName}.properties = params

        if (!${propertyName}.save(flush: true)) {
            map.result=false;
            map.message=${propertyName}.errors.allErrors.toString();
        }else{
            flash.message = message(code: 'default.updated.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
            map.result=true;
            map.message=flash.message;
        }

        return map;
    }

    def delete(${idType} id) {
        def map=[:]
        def ${propertyName} = ${className}.get(id)
        if (!${propertyName}) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            map.result=false;
            map.message=flash.message;
        }
        try {
            ${propertyName}.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            map.result=true;
            map.message=flash.message;
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), id])
            map.result=false;
            map.message=flash.message;
        }
        render map as JSON;
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
        render "\${(map as JSON).toString()}";
    }
}
