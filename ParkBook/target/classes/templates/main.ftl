<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#include "parts/security.ftl">
<#import "parts/pager.ftl" as p>

<@c.page>
<style>

    input[type=text] {
        width: 220px;
        padding: 6px 10px;
        margin: 8px 0;
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
        background-color: white;
        color: black;
        border: 3px solid #ccc;
        border-radius: 4px;
    }
    .button:hover {
        border: 3px solid dodgerblue;
    }


</style>

<div class="jumbotron" style="width: 900px;margin-left: 100px;
background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')"
>

    <#if isAdmin || isWorker>
        <a class="btn btn-primary" data-toggle="collapse" href="#addParking" role="button" aria-expanded="false" aria-controls="collapseExample">
            Add parking
        </a>
    <div  class="collapse <#if parkingPlace??>show</#if>" id="addParking">
        <form method="post">
            <input type="text" name="text" placeholder="input company"
                   data-toggle="tooltip"
                   pattern="[a-z]{5, }[0-9]{1, }"
                   required
                   style="width: 170px; "
                   title="Input company"/>
            <input type="text" name="address" placeholder="company address"
                   data-toggle="tooltip"
                   pattern="[a-z]{5, }[0-9]{1, }"
                   required
                   style="width: 170px; "
                   title="Input address"
            >
            <br>
            <input type="text" name="freePlaces" placeholder="input freePlaces"
                   data-toggle="tooltip"
                   pattern="[1-9]{1, }"
                   required
                   style="width: 170px; "
                   title="Only numbers"/>
            <input type="text" name="pAddress" placeholder="parking address"
                   data-toggle="tooltip"
                   pattern="[a-z]{5, }[0-9]{1, }"
                   required
                   style="width: 170px; "
                   title="Input address"
            >
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <br>
            <button type="submit" class="button" style="margin-bottom: 10px; margin-top: 10; padding: 6px 10px;">Add parking</button>
        </form>
    </div>

        </#if>
    <a class="btn btn-primary" data-toggle="collapse" href="#findByAddress" role="button" aria-expanded="false" aria-controls="collapseExample">
        Find by parking address
    </a>
    <br>
    <div class="collapse <#if parkingPlace??>show</#if>" id="findByAddress">
    <form method="get" action="/main">
        <input type="text" name="filter" style="width: 220px" value="${filter?ifExists}">
        <button  type="submit" class="button" style="padding: 7px 12px;">Find</button>
    </form>
    </div>
<br>

    <table>
        <tr>
            <th  style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;width: 150px;
 "><font style="color: black">Company</font></th>
            <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;width: 250px;
"><font style="color: black">Company address</font></th>
            <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;width: 250px;
"><font style="color: black">Parking address</font></th>
            <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;width: 120px;
"><font style="color: black">Free places</font></th>
            <th></th>
        </tr>
    <#list page.content as parking >
        <tr>
            <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black">${parking.companyName}</font></td>
            <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;">
                <a href="https://maps.google.com/?q=${parking.companyId} ${parking.companyAddress}" data-toggle="tooltip"
                   title="Click to go to Google Maps">
                <font style="color: black">${parking.companyAddress}</font>
                </a>
            </td>
            <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;">
                <a href="https://maps.google.com/?q=${parking.companyId} ${parking.address}" data-toggle="tooltip"
                   title="Click to go to Google Maps">
                <font style="color: black">${parking.address}</font>
                </a>
            </td>
            <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black">${parking.freePlaces}</font></td>
            <td ><a href="/parking/${parking.id}" style="margin-left: 10px">Choose</a> </td>
        </tr>

    <#else>

    </#list>
    </table>
    <div style="margin-right: 715px">
    <@p.pager url page />
    </div>
</div>
</@c.page>
