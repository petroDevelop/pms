package com.petrodata.pms

import grails.events.Listener;

class EventService {

//Listener注解指明这个方法接受那种消息，namespace不填的话接受所有消息，这里接受名为browser分组的消息
//注意，方法名必须是MessageEvents.groovy中定义的标签名
    @Listener(namespace='browser')
    def toServer(Map data) {
        println "msg from browser msg:$data"
        //发送"msgFromServer"事件
        //@todo 写入 message domain 类，event 发送接收人
        //event('fromServer', [msg: "!this is msg!"], [namespace: 'browser'])

    }
     // 本工程中的chatRoomId为用户的uuid
    void sendChatMessage(Map chatMessage, String chatRoomId) {
        event(namespace: 'browser', topic: "chat-${chatRoomId}", data:chatMessage)
        // send the message to only browsers registered for this chatroom
    }
    void publishEvent(Map eventMap){
        event(topic:'fromServer', data:eventMap, namespace: 'browser')
    }
}
