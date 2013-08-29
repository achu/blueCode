<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/slideMenu.css" rel="stylesheet" />
    <style>
        body {
            background: #333 url(bg.jpg) repeat top left;
            font-family: Arial;
        }

        span.reference {
            position: fixed;
            left: 10px;
            bottom: 10px;
            font-size: 12px;
        }

            span.reference a {
                color: #aaa;
                text-transform: uppercase;
                text-decoration: none;
                text-shadow: 1px 1px 1px #000;
                margin-right: 30px;
            }

                span.reference a:hover {
                    color: #ddd;
                }

        ul.sdt_menu {
            margin-top: 50px;
        }

        h1.title {
            text-indent: -9000px;
            background: transparent url(images/title.png) no-repeat top left;
            width: 633px;
            height: 69px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <script src="scripts/jquery-1.10.1.js"></script>
        <script src="scripts/jquery.easing.1.3.js"></script>
        <script src="scripts/Home.js"></script>
        <div style="width: 99.8%;">
            <div class="content" style="width: 99%;">
                <h1>Achu samples... begins..
        my various samples..</h1>
                <ul id="sdt_menu" class="sdt_menu">
                    <li>
                        <a href="#">
                            <img src="images/super.jpg" alt="" />
                            <span class="sdt_active"></span>
                            <span class="sdt_wrap">
                                <span class="sdt_link">who am i</span>
                                <span class="sdt_descr">know about me</span>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="images/programming-languages.jpg" alt="" />
                            <span class="sdt_active"></span>
                            <span class="sdt_wrap">
                                <span class="sdt_link">samples</span>
                                <span class="sdt_descr">my work</span>
                            </span>
                        </a>
                        <div class="sdt_box">
                            <a data-url="KamalSample.aspx">jQuery 1</a>
                            <a data-url="LoadTablejQuery.aspx">jQuery 2</a>
                        </div>
                    </li>

                </ul>
            </div>
            <div style="float: right; width: 99.8%;">
                <iframe id="ifMain" width="99%" height="400px" frameborder="0" scrolling="no" ></iframe>
            </div>
        </div>
    </form>
</body>
</html>
