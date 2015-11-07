events = {
    //浏览器要接受名为"fromServer"这个通知
    'fromServer' namespace: 'browser', browser:true, browserFilter: { data,request->
        //println "browserFilter after Service"
        //println " browserFilter data: $data"
        return true
    }

    //浏览器发送这个名为toServer的通知
    'toServer' namespace: 'browser', browser:true, filter: { return true}

    'chat-*' namespace: 'browser', browser:true
}