<g:each in="${messages}" var="message" status="i">
    <div class="item item-visible <g:if test="${message.sender.id==currentUser.id}">in</g:if>">
        <div class="image">
            <img src="${request.contextPath}/images/userAviator.jpg" class="messageSenderImage" alt="${message.sender}">
        </div>
        <div class="text">
            <div class="heading">
                <a href="#">${message.sender}</a>
                <span class="date">${message.dateCreated.format('yyyy-MM-dd HH:mm')}</span>
            </div>
            <p>${message.content}</p>
        </div>
    </div>
</g:each>
<g:if test="${messages.size()==0}">
    <div class="item in" style="">
        <div class="image">
            <img class="messageSenderImage" src="${request.contextPath}/images/userAviator.jpg" alt="">
        </div>
        <div class="text">
            <div class="heading">
                <a href="#"></a>
                <span class="date"></span>
            </div>
            <p></p>
        </div>
    </div>
</g:if>
