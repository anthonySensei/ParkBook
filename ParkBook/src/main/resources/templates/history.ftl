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

    <div class="jumbotron" style="width: 1200px;margin-left: -50px;
background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')"
    >


        <a class="btn btn-primary" data-toggle="collapse" href="#findByUsername" role="button" aria-expanded="false" aria-controls="collapseExample">
            Find by username
        </a>
        <br>
        <div class="collapse <#if history??>show</#if>" id="findByUsername">
            <form method="get" action="/history">
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
 "><font style="color: black">Username</font></th>
                <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;width: 250px;
"><font style="color: black">Book time</font></th>
                <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;width: 250px;
"><font style="color: black">Start time of parking</font></th>
                <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;width: 250px;
"><font style="color: black">Finish time of parking</font></th>
                <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;width: 250px;
"><font style="color: black">Parking address</font></th>
                <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;width: 60px;
"><font style="color: black">Ticket number</font></th>
            </tr>
            <#list page.content as history >
                <tr>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black"> <a href="mailto:${history.userEmail}"> <font style="color: black">${history.username}</font></a></font></td>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black">${history.bookTime}</font></td>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black">${history.startParkingTime}</font></td>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black">${history.finishParkingTime}</font></td>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;">
                        <a href="https://maps.google.com/?q=${history.ticketNumber} ${history.parkingAddress}" data-toggle="tooltip"
                           title="Click to go to Google Maps">
                            <font style="color: black">${history.parkingAddress}</font>
                        </a>
                    </td>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black">${history.ticketNumber}</font></td>
                </tr>
            <#else>

            </#list>
        </table>
        <div style="margin-right: 715px">
            <@p.pager url page />
        </div>
    </div>
</@c.page>
