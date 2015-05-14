import org.codehaus.groovy.grails.commons.*;
import com.basic.core.*;
import com.basic.seismic.*;

def classname=[]
classname << com.petrodata.pms.core.BaseUserBaseRole.class
classname << com.petrodata.pms.core.BaseRole.class
classname << com.petrodata.pms.core.BaseUser.class
classname << com.petrodata.pms.core.Requestmap.class
classname << com.petrodata.pms.core.BaseDepartment.class
classname << com.petrodata.pms.equipment.Equipment.class
classname << com.petrodata.pms.equipment.EquipmentCatagory.class
classname << com.petrodata.pms.equipment.EquipmentRunningInfo.class
classname << com.petrodata.pms.equipment.EquipmentStandardHistory.class
classname << com.petrodata.pms.equipment.Standard.class
classname << com.petrodata.pms.equipment.StandardItem.class
classname << com.petrodata.pms.order.JobOrder.class
classname << com.petrodata.pms.team.Position.class
classname << com.petrodata.pms.team.PositionBaseUser.class
classname << com.petrodata.pms.team.Rotation.class
classname.each{c->
    def fooDomain = new DefaultGrailsDomainClass(c )
     println "${fooDomain.propertyName}.label=${fooDomain.name}"
    fooDomain.properties.each{
        if(it.name.toString()!='id' && it.name.toString()!='version'){
            println "${fooDomain.propertyName}.${it.name}.label=${it.name.capitalize()}"
        }
        
    }
    println  ""
}
