<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Parkbook</title>
    <link rel="stylesheet" href="/static/style.css">
    <!--For better view-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- -->
    <!-- Turbolink-->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js'></script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script defer src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

    <style>

        .turbolinks-progress-bar{
            height: 5px;
            background-color: dodgerblue;
        }
        body {
            font-family: Verdana,sans-serif;
            font-size: 0.9em;
            background-image: url("http://eskipaper.com/images/parking-lot-wallpapers-1.jpg");
            color:white;


        }

         footer {
            padding: 10px;
             margin-top: 39.5%;
            color: white;
            background-image: url("https://szftlgs.com/wp-content/uploads/data/2018/1/8/grey-wallpaper-PIC-WSW1077665.jpg");
        }



    </style>
</head>
<body>
<#include "navbar.ftl">
<div class="container mt-5">
<#nested>
 </div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


</body>
</html>
</#macro>
