import com.petrodata.converters.marshaller.json.TableDomainClassMarshaller
import com.petrodata.pms.core.*
import com.petrodata.pms.equipment.Equipment
import com.petrodata.pms.equipment.EquipmentRunningInfo
import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.SecurityFilterPosition
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils;

class BootStrap {

    def init = { servletContext ->
        SpringSecurityUtils.clientRegisterFilter('concurrencyFilter', SecurityFilterPosition.CONCURRENT_SESSION_FILTER)
        JSON.registerObjectMarshaller(new TableDomainClassMarshaller(false,true,10));

        if(BaseUser.count()==0){
            createRole()
            createDefaultRoles()
            createDefaultDepartment();
            createDefaultUsers()
            createRequestMap()
        }
        synchronizeEquipment();

    }
    def destroy = {
    }
    private synchronizeEquipment(){
        Equipment.list().each{equipment->
            if(EquipmentRunningInfo.countByEquipment(equipment)==0){
                new EquipmentRunningInfo(equipment: equipment).save(flush: true);
            }
        }
    }
    private createRole(){
        def roles=['IS_AUTHENTICATED_ANONYMOUSLY','IS_AUTHENTICATED_FULLY','IS_AUTHENTICATED_REMEMBERED']
        roles.each{
            if (!BaseRole.findByAuthority(it)) {
                def role=new BaseRole(id:it,name:it,authority:it,description:it)
                role.id=role.name;
                role.save(flush: true)
            }
        }
    }
    private createDefaultRoles() {
        if (!BaseRole.findByAuthority('ROLE_ADMIN')){
            def role=new BaseRole(id:'ROLE_ADMIN',name:'ROLE_ADMIN',authority:'ROLE_ADMIN',description:"超级管理角色")
            role.id=role.name;
            role.save(flush: true)
        }
        if (!BaseRole.findByAuthority('ROLE_MANAGER')){
            def role=new BaseRole(id:'ROLE_MANAGER',name:'ROLE_MANAGER',authority:'ROLE_MANAGER',description:"设备管理处角色")
            role.id=role.name;
            role.save(flush: true)
        }
        if (!BaseRole.findByAuthority('ROLE_PROJECT')){
            def role=new BaseRole(id:'ROLE_PROJECT',name:'ROLE_PROJECT',authority:'ROLE_PROJECT',description:"项目部角色")
            role.id=role.name;
            role.save(flush: true)
        }
        if (!BaseRole.findByAuthority('ROLE_CAPTAIN')){
            def role=new BaseRole(id:'ROLE_CAPTAIN',name:'ROLE_CAPTAIN',authority:'ROLE_CAPTAIN',description:"小队队长角色")
            role.id=role.name;
            role.save(flush: true)
        }
        if (!BaseRole.findByAuthority('ROLE_MEMBER')){
            def role=new BaseRole(id:'ROLE_MEMBER',name:'ROLE_MEMBER',authority:'ROLE_MEMBER',description:"小队队员角色")
            role.id=role.name;
            role.save(flush: true)
        }
    }
    private createDefaultDepartment(){
        if (BaseDepartment.count==0){
            def d1=new BaseDepartment(name:'A设备公司',type: '公司节点');
            d1.save(flush: true);
            def d2=new BaseDepartment(name:'总部',parent: d1,type: '');
            d2.save(flush: true);
            def d21=new BaseDepartment(name:'设备管理处',parent: d2,type: '设备处节点');
            d21.save(flush: true);
            def d3=new BaseDepartment(name:'项目部1',parent: d1,type: '项目部节点');
            d3.save(flush: true);
            def d4=new BaseDepartment(name:'第一小队',parent: d3,type: '小队节点' );
            d4.save(flush: true);
            def d5=new BaseDepartment(name:'第二小队',parent: d3,type: '小队节点');
            d5.save(flush: true);
        }
    }
    private def createDefaultUsers() {

        def admin = BaseUser.findByUsername('admin')
        if (!admin) {
            admin = new BaseUser(username:'admin',userRealName:'管理员', password : 'admin',firstName:'admin' ,lastName: '1',
                    baseDepartment: BaseDepartment.list()[0],email:'admin@petrodata.com',enabled:true)
            admin.save(flush: true)
        }
        def manager = BaseUser.findByUsername('manager')
        if (manager == null) {
            manager = new BaseUser(username:'manager',userRealName:'设备管理处工作人员', password : 'manager',firstName:'manager' ,lastName: '1',
                    baseDepartment: BaseDepartment.findByName('设备管理处'),email:'manager@petrodata.com',enabled:true)
            manager.save(flush: true)
        }
        def project1 = BaseUser.findByUsername('project')
        if (project1 == null) {
            project1 = new BaseUser(username:'project',userRealName:'项目部工作人员', password : 'project',firstName:'project' ,lastName: '1',
                    baseDepartment: BaseDepartment.findByName('项目部1'),email:'project@petrodata.com',enabled:true)
            project1.save(flush: true)
        }
        def user1 = BaseUser.findByUsername('captain')
        if (user1 == null) {
            user1 = new BaseUser(username:'captain',userRealName:'小队队长', password : 'captain',firstName:'captain' ,lastName: '1',
                    baseDepartment: BaseDepartment.findByName('第一小队'),email:'captain@petrodata.com',enabled:true)
            user1.save(flush: true)
        }
        def user2 = BaseUser.findByUsername('member')
        if (user2 == null) {
            user2 = new BaseUser(username:'member',userRealName:'小队队员', password : 'member',firstName:'member' ,lastName: '1',
                    baseDepartment: BaseDepartment.findByName('第一小队'),email:'member@petrodata.com',enabled:true)
            user2.save(flush: true)
        }

        try{
            BaseUserBaseRole.create(admin,BaseRole.findByAuthority('ROLE_ADMIN'),true);
            BaseUserBaseRole.create(manager,BaseRole.findByAuthority('ROLE_MANAGER'),true);
            BaseUserBaseRole.create(project1,BaseRole.findByAuthority('ROLE_PROJECT'),true);
            BaseUserBaseRole.create(user1,BaseRole.findByAuthority('ROLE_CAPTAIN'),true);
            BaseUserBaseRole.create(user2,BaseRole.findByAuthority('ROLE_MEMBER'),true);
        }catch(e){
            println e.message
        }

    }

    private def createRequestMap() {
        new Requestmap(url: '/static/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/js/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/images/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/plugins/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/css/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/logout/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/favicon.ico', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/images/favicon.ico', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/register/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/j_spring_security_check', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()

        //spring security plugin
        new Requestmap(url: '/abstractS2Ui/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/aclClass/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/aclEntry/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/aclObjectIdentity/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/aclSid/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/persistentLogin/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/register/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/registrationCode/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/role/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/user/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/securityInfo/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()

        //application
        new Requestmap(url: '/baseUser/**', configAttribute: 'ROLE_ADMIN,ROLE_MANAGER,ROLE_PROJECT,ROLE_CAPTAIN').save()
        new Requestmap(url: '/baseRole/**', configAttribute: 'ROLE_ADMIN').save()
        new Requestmap(url: '/baseUserBaseRole/**', configAttribute: 'ROLE_ADMIN').save()
        new Requestmap(url: '/requestmap/**', configAttribute: 'ROLE_ADMIN').save()

        new Requestmap(url: '/searchable/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
        new Requestmap(url: '/license/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()

        //controller
        new Requestmap(url: '/process/**', configAttribute: 'ROLE_ADMIN').save()
        new Requestmap(url: '/task/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()

        new Requestmap(url: '/', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()

    }
}
