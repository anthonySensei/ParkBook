<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<#import "parts/pager.ftl" as p>

<@c.page>

    <style>
        input[type=text] {

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
        .button {
            height: 40px;
            background-color: white;
            color: black;
            border: 3px solid #ccc;
            border-radius: 4px;
        }
        .button:hover {
            border: 3px solid dodgerblue;
        }
    </style>

<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/request" class="form-inline">
        </form>
    </div>
</div>
    <div class="jumbotron" style="
background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')">
<#if isAdmin>
<div class="card-columns">
    <#list page.content as request>
        <div class="card my-3">
            <#if request.filename??>
                <img src="/img/${request.filename}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span><font color="black">Information: <br> ${request.text}</font></span><br/>
                <span><font color="black">Author:</font><a href="mailto:${request.authorEmail}" data-toggle="tooltip"
                                                           title="Click to send email to ${request.authorName}">${request.authorName}</a></span>
            </div>
        </div>
    <#else>
        No request
    </#list>
</div>
    <div style="margin-right: 930px">
    <@p.pager url page />
    </div>
    </div>
<#else >

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Make request
    </a>

    <div class="collapse <#if request??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if request??>${request.text}</#if>" name="text" placeholder = "Input request" />
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile" >Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <input type="hidden" name="id" value="<#if request??>${request.id}</#if>" />
                <div class="form-group">
                    <button type="submit" class="button">Save request</button>
                </div>
            </form>
        </div>
    </div>
</#if>

</@c.page>