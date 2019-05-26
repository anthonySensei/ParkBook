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
    <div class="jumbotron" style="width: 450px; height: 450px; margin-left: 330px; margin-top: 120px;
background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')">
    <font size="4" style="margin-left: 35%">User editor</font>

<form action="/user" method="post">
    <br>
    <table>
        <tr>
            <th style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left;width: 240px"><font style="color: black">Username</font></th>
            <th style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left;width: 145px"><font style="color: black">Current role(s)</font></th>
        </tr>
        <tr>
            <td style="border: 1px solid dodgerblue;background-color: white; padding: 10px;
  text-align: left;"><font style="color: black">${user.username}</font></td>
            <td style="border: 1px solid dodgerblue;background-color: white;padding: 10px;
  text-align: left;"><font style="color: black"><#list user.roles as role>${role}<#sep>, </#list></font></td>
        </tr>
    </table>
    <br>
    <br>
    Choose new role(s) of user:
    <table>
        <tr>
            <th colspan="3" style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left;width: 100px;text-align: center"><font style="color: black">Roles</font></th>
        </tr>
        <tr>
    <#list roles as role>
            <td style="border: 1px solid dodgerblue;background-color: white;padding: 10px;
  text-align: left; width: 130px"><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}><font style="color: black">${role}</font></td>
    </#list>
        </tr>
    </table>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <br>
    <a href="/user?size=5" >Back</a>
    <button type="submit" class="button">Save</button>
</form>
    </div>
</@c.page>