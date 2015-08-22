package com.petrodata.pms

class GenerateTaskService {
      // 废弃，不再使用
    def schedual() {
       // 定时任务 定时启动（20分钟）
         /*扫描小队（isWorking），获取班次 （chargeDailyCheck）获取本小队的（position baseUser）岗位列表（distinct position）
             判断是否到了班次的checkTime，如是：库中有无已生成此班次此岗位工单，如无：
             1.  生成工单
             2. 获取本岗位下本小队的设备，找到关联标准及标准项
                2.1 为 chargeDailyCheck 班次，岗位生成检查周期为B的标准项对应工单项
                2.2 检查周期为1天的标准项生成工单项
                2.3 检查周期为多天的，判断过去多天内有无此设备此标准项的工单，如无，则生成工单项
         * */

    }
    /*
    //初始化任务，目的为生成出工前的全部工单
    def initJobList(){
        //全部检查项
    }
    */
}
