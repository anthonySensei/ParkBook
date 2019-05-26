<#import "parts/common.ftl" as c>
<#import "parts/pager.ftl" as p>


<@c.page>
    <div class="jumbotron" style="width: 450px; margin-left: 330px; margin-top: 120px;
background-image: url('https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg')">
    <a href="/user/userFilter"><font size="4">Find user</font></a>
    <table>
        <thead>
        <tr>
            <th style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left;width: 220px"><font style="color: black">Username</font></th>
            <th style="border: 1px solid black;background-color: dodgerblue;padding: 10px;
  text-align: left;width: 125px"><font style="color: black">Role</font></th>
             <th></th>
        </tr>
        </thead>
        <tbody>
    <#list page.content as user>
<tr>
    <td style="border: 1px solid dodgerblue;background-color: white;padding: 10px;
  text-align: left;"><font style="color: black">${user.username}</font></td>
    <td style="border: 1px solid dodgerblue;background-color: white;padding: 10px;
  text-align: left;"><font style="color: black"><#list user.roles as role>${role}<#sep>, </#list></font></td>
    <td ><a href="/user/${user.id}" style="margin-left: 10px">Edit</a> </td>
</tr>

    </#list>
        </tbody>
    </table>
    <div style="margin-right: 70px">
    <@p.pager url page />
    </div>
    </div>
</@c.page>