<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="_Login" Theme="Skins" %>

<!DOCTYPE html>

<%@ Register Src="~/Include/MyCaptchaWithIncrease.ascx" TagName="Captcha" TagPrefix="site" %>
<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>CCTMS</title>
    <link rel="icon" type="image/x-icon" href="Scripts/landing/assets/favicon.ico" />
    <link href="Scripts/NiceAdmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com" rel="stylesheet" />

    <link href="Scripts/mycss/landing_page.css" rel="stylesheet" />

    <script src="Scripts/NiceAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <style>
        .login-box {
            max-width: 360px;
            margin: -30px auto 0;
            padding: 25px;
            background: #fff;
        }

            .login-box input {
                text-align: center;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server" autocomplete="off">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <nav class="navbar navbar-expand-lg bg-white">
            <div class="container-fluid">


                <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#mainNavbar"
                    aria-controls="mainNavbar"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>


                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">HOME</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">LOGIN</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">REGISTER</a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>


        <section class="page1">
            <div class="container">
                <div class="college"><b>CITY COLLEGE</b></div>
                <div class="empower">EMPOWER YOUR FUTURE</div>

                <div class="highlight mb-2">SEMINAR</div>
                <div class="cont mb-3"><span style="color: #e5b417;">CONTINUING </span><span>PROFESSIONAL</span> <span style="color: black;">DEVELOPMENT</span></div>
                <div class="sub mb-2">TRAINING</div>
            </div>
        </section>


        <!-- LOGIN -->
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <div class="login-box text-center">
                    <div class="mb-3">
                        <asp:TextBox runat="server" CssClass="form-control" Placeholder="username" ID="txtUserName" />
                    </div>
                    <div class="mb-3">
                        <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" Placeholder="password" ID="txtPassword" />
                    </div>

                    <asp:Button runat="server" Text="LOGIN" class="btn btn-green px-5" ID="btnLogin" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel runat="server" ID="upUpdate">
            <ContentTemplate>

                <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>


</body>
</html>
