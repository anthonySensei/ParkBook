<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')">
    <img src="https://szpress.me/wp-content/uploads/2014/08/parking.png"
         style="width: 28px; height: 28px; margin-top: -11px; ">
<a class="navbar-brand" href="/"  ><font style="color: white">arkBook</font></a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item ">
            <a class="nav-link" href="/"><font style="color: white">Home</font></a>
        </li>
        <#if user??>
        <li class="nav-item ">
            <a class="nav-link" href="/main"><font style="color: white">Companies</font></a>
        </li>
            <li class="nav-item ">
                <a class="nav-link" href="/user/profile"><font style="color: white">Profile</font></a>
            </li>

        <#if isAdmin>
            <li class="nav-item ">
                <a class="nav-link" href="/user?size=5"><font style="color: white">User list</font></a>
            </li>
        <li class="nav-item ">
            <a class="nav-link" href="/request"><font style="color: white">Requests</font></a>
        </li>
            <li class="nav-item ">
                <a class="nav-link" href="/history"><font style="color: white">Book history</font></a>
            </li>
        <#else >
            <li class="nav-item ">
                <a class="nav-link" href="/userhistory"><font style="color: white">Book history</font></a>
            </li>
        </#if>
        </#if>
    </ul>

        <div class="navbar-text mr-3">
            <#if user??>
                <li class="dropdown"><a class="dropdown-toggle"  data-toggle="dropdown" href="#"><font style="color: white">${name} </font>
                            <span class="caret"></span></a>

                    <ul class="dropdown-menu" >
                        <#if isAdmin>
                    <li><a href="/user/profile">Edit</a></li>

                                <li><a href="/request">Make Request</a></li>
                                <li><a href="/user/profile">Edit</a></li>
                        </#if>
                </ul>
            </li>
            <#else>
                <font style="color: white"> Please, login to see all features of the site</font>
            </#if></div>
        <@l.logout />
    </div>
</nav>


