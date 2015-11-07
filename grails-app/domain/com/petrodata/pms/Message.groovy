package com.petrodata.pms

import com.petrodata.pms.core.BaseUser


//交流信息')
class Message {
	transient eventService
	//内容')
	String content
	//是否阅读')
	boolean isread=false
	//发送人')
	BaseUser sender
	//接收人')
	BaseUser receiver
	//@Title(zh_CN='上传资料')
	//byte[] filedata
	//@Title(zh_CN='文件名')
	//String filename
	Date dateCreated
	Date lastUpdated
	String fromip


    static constraints = {
		content(size:0..2000,blank: true,nullable:true)
        //filedata(nullable:true,size: 0..1024*1024*10)
       // filename(size:0..250,blank: true,nullable:true)
		fromip(size:0..200,blank: true,nullable:true)
		isread()
		sender(nullable: false)
		receiver(nullable: false)
    }
	static mapping = {  

	}
	String toString(){
		return content
	}

	def afterInsert() {
		if(!isread){
			Message.withNewSession {session->
				eventService.sendChatMessage([sender:sender.toString(),senderUsername:sender.username,date:dateCreated.format('yyyy-MM-dd HH:mm'),content: content],receiverId);
			}

		}
	}
	def afterUpdate() {
		if(!isread){
			Message.withNewSession {session->
				eventService.sendChatMessage([sender:sender.toString(),senderUsername:sender.username,date:lastUpdated.format('yyyy-MM-dd HH:mm'),content: content],receiverId);
			}
		}
	}
}
