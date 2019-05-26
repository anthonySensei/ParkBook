<#macro login path>


    <style>
        input[type=text] {
            height: 45px;
            width: 350px
            padding: 6px 10px;
            box-sizing: border-box;
            border: 3px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
            border-radius: 4px;
        }

        input[type=password]:focus {
            border: 3px solid dodgerblue;
        }
        input[type=password] {
            height: 45px;
            width: 350px
            padding: 6px 10px;
            box-sizing: border-box;
            border: 3px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
            border-radius: 4px;
        }

        input[type=text]:focus {
            border: 3px solid dodgerblue;
        }
    </style>
<div class="jumbotron" style="width: 450px; height: 250px; margin-left: 330px; margin-top: 120px;
background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')">
    <div style="margin-left: 20px">${message?ifExists}</div>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert" style="margin-top: -40px; width:350px; margin-left: 15px ">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
    <form action="${path}" method="post">
        <!--Username -->
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                           class="form-control ${(usernameError??)?string('is-invalid', '')}"
                           placeholder="User name"
                           data-toggle="tooltip"
                                title="Input your username"
                    />
                    <#if usernameError??>
                        <div class="invalid-feedback" >
                            ${usernameError}
                        </div>
                    </#if>
                </div>
            </div>

            <!-- Password -->
            <div class="row  mt-2">
                <div class="col-sm">
                    <input type="password" name="password"
                           class="form-control ${(passwordError??)?string('is-invalid', '')}"
                           placeholder="Password"
                           data-toggle="tooltip"
                                title="Input your password"
                    />
                    <#if passwordError??>
                        <div class="invalid-feedback"
                        <div class="invalid-feedback" >
                        </#if>
                        </div>
                </div>


            <input type="hidden" name="_csrf" value="${_csrf.token}" />

            <!-- Registration/Back -->

            <div class="container" >
                <div class="row mt-2">
                    <div class="col-sm mt-2">
                        <a href="/registration" style="margin-left: -12px" >Registration</a>
                    </div>
                    <div class="col-sm">
                        <button class="btn btn-primary" type="submit" style="margin-left: -35px" >Sign In</button>
                    </div>
                    <div class="col-sm">
                        <a href="/loginGoogle" style="margin-left: -60px"><img src="http://pngimg.com/uploads/google/google_PNG19635.png" style="height:60px; margin-top: -10px"></a>
                    </div>
                </div>
            </div>
                </div>
            </div>
        </div>
    </form>
</div>
</#macro>

<#macro logout>
    <#include "security.ftl" >
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit"><#if user??>Log Out<#else>Log in</#if></button>
    </form>
</#macro>
