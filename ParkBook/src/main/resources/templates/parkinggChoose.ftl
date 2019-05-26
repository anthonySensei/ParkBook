<#import "parts/common.ftl" as c>

<@c.page>
    <style>
        .button {
            height: 40px;
            width: 70px;
            background-color: white;
            color: black;
            border: 3px solid #ccc;
            border-radius: 4px;
        }
        .button:hover {
            border: 3px solid dodgerblue;
        }
    </style>
    <div class="jumbotron" style="width: 500px; height: 530px; margin-left: 330px; margin-top: 120px;
background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')">
    <font size="4" style="margin-left: 115px">Choose some option</font>
    <br>
    <a class="btn btn-primary" data-toggle="collapse" href="#ParkingInfo" role="button" aria-expanded="false" aria-controls="collapseExample"
       style="margin-left: 90px">
        Parking info
    </a>
        <a class="btn btn-primary" data-toggle="collapse" href="#BookParking" role="button" aria-expanded="false" aria-controls="collapseExample"
       >
            Book parking
        </a>
        <div  class="collapse <#if !parkingPlace??>show</#if>" id="ParkingInfo">
            <table style="margin-left: 10px">
                <tr>
                    <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left; width: 170px;
"><font style="color: black">Company</font></th>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left; width: 250px"><font style="color: black">${parkingPlace.companyName}</font></td>
                </tr>
                <tr>
                    <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;
"><font style="color: black">Company address</font></th>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;">
                        <a href="https://maps.google.com/?q=${parkingPlace.companyId} ${parkingPlace.companyAddress}" data-toggle="tooltip"
                           title="Click to go to Google Maps">
                            <font style="color: black">${parkingPlace.companyAddress}</font>
                        </a>
                    </td>
                </tr>
                <tr>
                    <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;
"><font style="color: black">Parking address</font></th>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;">
                        <a href="https://maps.google.com/?q=${parkingPlace.companyId} ${parkingPlace.address}" data-toggle="tooltip"
                           title="Click to go to Google Maps">
                            <font style="color: black">${parkingPlace.address}</font>
                        </a>
                    </td>
                </tr>
                <tr>
                    <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;
"><font style="color: black">Free places</font></th>
                    <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black">${parkingPlace.freePlaces}</font></td>
                </tr>
            </table>
        </div>
        <br>
    <form action="/parking"  method="get">
        <br>
        <div class="collapse <#if !parkingPlace??>show</#if>" id="BookParking">
        <font size="4">Choose the time of parking your car: </font>

        <table>
            <tr>
                <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;
"><font style="color: black">Start time</font></th>
                <th style="border: 1px solid black;background-color: dodgerblue;
   padding: 10px;
  text-align: left;
"><font style="color: black">End time</font></th>
            </tr>
            <tr>
                <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black"><input type="datetime-local" name="start_time"
                                                       max="2020-06-01T08:30"
                                                       style="width: 210px;" value="2019-05-01T08:30"

                        ></font></td>
                <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black"><input type="datetime-local" name="end_time"
                                                       max="2020-06-01T08:30" value="2019-05-01T08:30"
                                                       style="width: 210px;"></font></td>
            </tr>

        </table>
            <input type="hidden" value="${parkingPlace.id}" name="parkingPlaceId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
        <br>
        <button type="submit" class="button">Book</button>
    </form>
    </div>
    </div>
</@c.page>