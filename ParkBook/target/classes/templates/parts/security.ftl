<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    isWorker = user.isWorker()
    isUser = user.isWorker()
    currentUserId = user.getId()

    >
<#else>
    <#assign
    name = "Guest"
    isAdmin = false
    >
</#if>