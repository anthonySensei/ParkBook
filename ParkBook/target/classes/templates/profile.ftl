<!-- Для зміни власних даних на своєму акаунті-->
<#import "parts/common.ftl" as c>
<@c.page>
    <style>

        input[type=email] {
            width: 220px;
            padding: 6px 10px;
            box-sizing: border-box;
            border: 3px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
            border-radius: 4px;
        }

        input[type=email]:focus {
            border: 3px solid dodgerblue;
        }
        input[type=password] {
            width: 220px;
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

        input[type=text] {
            height: 45px;
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
        input[type=tel]:focus {
            border: 3px solid dodgerblue;
        }
        input[type=tel] {
            height: 45px;
            box-sizing: border-box;
            border: 3px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
            border-radius: 4px;
        }


    </style>
    <div class="jumbotron" style="width: 500px; margin-left: 320px;
    background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg');
     margin-top: 120px">
    <h5 style="margin-left: 45px">Personal information</h5>
        <#if somemessage??>
            <h5 style="margin-left: 45px"><font color="green">${somemessage}</font></h5>
        </#if>

    <form  method="post" action="/user/profile">
        <div class="container" style="margin-left: 30px; margin-top: 10px">
                <div class="row">
                    <div class="col-sm">
                        <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                               class="form-control ${(usernameError??)?string('is-invalid', '')}"
                               placeholder="User name"
                               style="width: 350px"
                               data-toggle="tooltip"
                               title="Change your username and input at this field"
                        />
                        <#if usernameError??>
                            <div class="invalid-feedback">
                                ${usernameError}
                            </div>
                        </#if>
                    </div>
                </div>
            <!-- Name -->
            <div class="row mt-2">
                <div class="col-sm">
                    <input type="text" name="name" value="<#if user??>${user.name}</#if>"
                           class="form-control ${(nameError??)?string('is-invalid', '')}"
                           style="width: 170px;"
                           placeholder="Name"   data-toggle="tooltip"
                           title="input your name at this field"/>

                    <#if nameError??>
                        <div class="invalid-feedback">
                            ${nameError}
                        </div>
                    </#if>

                </div>

                <!-- Surname -->
                <div class="col-sm">
                    <input type="text" name="surname" value="<#if user??>${user.surname}</#if>"
                           class="form-control ${(surnameError??)?string('is-invalid', '')}"
                           placeholder="Surname"  data-toggle="tooltip"
                           style="width: 171px; margin-left: -40px"
                           title="input your surname at this field"/>
                    <#if surnameError??>
                        <div class="invalid-feedback" style="margin-left: -40px" >
                            ${surnameError}
                        </div>
                    </#if>

                </div>
            </div>

            <!-- Phone number -->

            <div class="row  mt-2">
                <div class="col-sm">
                    <input type="tel" name="phoneNumber" value="<#if user??>${user.phoneNumber}</#if>"
                           class="form-control ${(phoneNumberError??)?string('is-invalid', '')}"
                           placeholder="XXX-XXX-XXXX"
                           style="width: 350px; "
                           pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                           required data-toggle="tooltip"
                           title="Input your phone number(XXX-XXX-XXXX) at this field."
                    />
                    <#if phoneNumberError??>
                        <div class="invalid-feedback" >
                            ${phoneNumberError}
                        </div>
                    </#if>
                </div>
            </div>


            <!--Email -->
            <div class="row  mt-2">
                <div class="col-sm">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid', '')}"
                           placeholder="some@some.com"  data-toggle="tooltip"
                           style="width: 350px; "
                           title="input your email(some@.some) at this field"/>
                    <#if emailError??>
                        <div class="invalid-feedback" >
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>



            <div class="container" >
                <div class="row">
                    <div class="col-sm mt-3">
                        <a href="/user/cngPassword" style="margin-left: -10px">Change password</a>
                    </div>
                    <div class="col-sm mt-1">
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <button class="btn btn-primary" type="submit"  style="margin-left: -80px">Save</button>
                    </div>
                </div>
            </div>
    </form>
    </div>
</div>
</@c.page>
