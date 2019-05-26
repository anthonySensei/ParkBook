<#import "parts/common.ftl" as c>
<@c.page>
    <style>

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


    </style>
    <div class="jumbotron" style="width: 500px; margin-left: 320px;
    background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg');
     margin-top: 120px">
        <h5 style="margin-left: 45px"></h5>
        <form  method="post" action="/user/cngPassword">
            <div class="container" style="margin-left: 30px; margin-top: 10px">


                <!-- new Password -->
                <div class="row  mt-2">
                    <div class="col-sm">
                        <input type="password" name="password"
                               class="form-control ${(passwordError??)?string('is-invalid', '')}"
                               placeholder="New Password"
                               data-toggle="tooltip"
                               style="width: 350px; "
                               title="Create new password(4 or more characters that are of at least one number, and one uppercase and lowercase letter)
                                 and input at this field"
                        />
                        <#if passwordError??>
                            <div class="invalid-feedback" >
                                ${passwordError}
                            </div>
                        </#if>
                    </div>
                </div>

                    <!-- Password2 -->
                <div class="row  mt-2">
                    <div class="col-sm">
                        <input type="password" name="password2"
                               class="form-control ${(password2Error??)?string('is-invalid', '')}"
                               placeholder="Retype new password"
                               pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,}"
                               required
                               style="width: 350px"
                               data-toggle="tooltip"
                               title="At this field you have to retype your new password"
                        />
                    </div>
                </div>
            </div>
                <div class="container" >
                    <div class="row">
                        <div class="col-sm mt-3">
                            <a href="/user/profile" style="margin-left: 30px">Back</a>
                        </div>
                        <div class="col-sm mt-1">
                            <input type="hidden" name="_csrf" value="${_csrf.token}" />
                            <button class="btn btn-primary" type="submit"  style="margin-left: -145px">Save</button>
                        </div>
                    </div>
                </div>

        </form>
    </div>

</@c.page>