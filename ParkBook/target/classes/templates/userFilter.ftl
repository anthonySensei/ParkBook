<#import "parts/common.ftl" as c>

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
            border-radius: 8px;
        }

        input[type=text]:focus {
            border: 3px solid dodgerblue;
        }
        .button {
            height: 40px;
            width: 70px;
            background-color: white;
            color: black;
            border: 3px solid #ccc;
            border-radius: 8px;
        }
        .button:hover {
            border: 3px solid dodgerblue;
        }
    </style>

    <div class="jumbotron" style="width: 450px; height: 450px; margin-left: 330px; margin-top: 120px;
background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')">
        <div >
    <font size="3">Input username:</font>
    <form method="get" action="/user/userFilter">
        <input type="text" name="filter" value="${filter?ifExists}" style="width: 310px; height: 40px">
        <button  class="button" type="submit" >Find</button>
    </form>

    <br>
    <font size="4">User information:</font>
    <#list users as user>

        <table>
            <thead>
            <tr>
                <th</th>
                <th</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left; width: 10%"><font style="color: black">Username</font></td>
                <td style="border: 1px solid dodgerblue;background-color: white;padding: 10px;
  text-align: left;"><font style="color: black">${user.username}</font></td>
            </tr>
                <tr>
                    <td style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left;"><font style="color: black">Name</font></td>
                    <td style="border: 1px solid dodgerblue;background-color: white;padding: 10px;
  text-align: left;"><font style="color: black">${user.name}</font></td>
                </tr>
                <tr>
                    <td style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left;"><font style="color: black">Surname</font></td>
                    <td style="border: 1px solid dodgerblue;background-color: white;padding: 10px;
  text-align: left;"><font style="color: black">${user.surname}</font></td>
                </tr>
                <tr>
                    <td style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left;"><font style="color: black">Phone</font></td>
                    <td style="border: 1px solid dodgerblue;background-color: white;padding: 10px;
  text-align: left;"><font style="color: black">${user.phoneNumber}</font></td>
                </tr>
                <tr>
                    <td style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left;"><font style="color: black">Email</font></td>
                    <td style="border: 1px solid dodgerblue;background-color: white;padding: 10px;
  text-align: left;"><font style="color: black">${user.email}</font></td>
                </tr>
            </tbody>
        </table>

        <br>

        <div style="margin-left: 120px">
            <a href="mailto:${user.email}">Send email to <font color="white">${user.username}</font></a>
        </div>
    </#list>
        </div>
    </div>
</@c.page>