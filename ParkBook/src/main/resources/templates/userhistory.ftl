<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#include "parts/security.ftl">
<#import "parts/pager.ftl" as p>

<@c.page>


    <div class="jumbotron" style="width: 950px;margin-left: 60px;
background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')">


        <h3>Your book history</h3>
        <table>
            <tr>
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
        <div style="margin-right: 770px">
            <@p.pager url page />
        </div>
    </div>
</@c.page>
