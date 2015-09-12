package com.petrodata.pms.job

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.equipment.Equipment
import com.petrodata.pms.equipment.EquipmentRuningTime
import com.petrodata.pms.team.Rotation

//保养项及大修项的定时任务
class RuningMonitorJob {
    static triggers = {
        //1小时执行
       cron name: 'oneHourTrigger', cronExpression: "0 59 * * * ?" // "0 0/30 * * * ?"
    }
    def group = "RuningMonitorGroup"
    def description = "检查小队设备运行的执行任务"
    def execute(){
        BaseDepartment.findAllByIsWorkingAndType(true,'小队节点').eachWithIndex{team,i->
            def rotations=Rotation.findAllByBaseDepartment(team);
            if(rotations && rotations.size()>0){
                def rotation=rotations[0];
                //服务器当前时间
                Date serverTime=new Date();
                String rotationDay=serverTime.format('yyyy-MM-dd',TimeZone.getTimeZone(rotation.timeZone));
                Date  localTime=Date.parse('yyyy-MM-dd',rotationDay);
                if(team.jobOrderInitDate==null || team.jobOrderInitDate<=localTime){
                    //获取小队所有设备
                    def equipments=Equipment.findAllByInDepartmentAndServiceState(team,'在用');
                    if(equipments.size()>0){
                        equipments.each{equipment->
                            //40分钟内没有相同的记录
                            if(EquipmentRuningTime.countByEquipmentAndDateCreatedGreaterThanEquals(equipment,new Date(serverTime.time-1000*60*40l))==0){
                               new EquipmentRuningTime(equipment: equipment,hour: 1l).save(flush: true);
                            }
                        }

                    }
                }
            }

        }
    }
}
