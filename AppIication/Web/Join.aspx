<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Join.aspx.vb" Inherits="_Join" Theme="Skins" %>

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


        <section class="page_join mb-5">
            <div class="container">
                <div class="join"><b>WHY JOIN OUR
                    <br>
                    PROGRAMS?</b></div>
            </div>
        </section>


        <section class="pb-5">
            <div class="container">
                <p class="mb-4">
                    By registering your interest, you get early access to high-quality training tailored to the needs of the Kagay-anon community and beyond:


                </p>

                <p class="mb-5">
                    <ul>
                        <li class="mb-3"><b>PRC-Accredited CPD Units:</b> Earn the required units for professional license renewal in various fields.</li>
                        <li class="mb-3"><b>Industry-Relevant Skills:</b> Gain practical knowledge in technology, pedagogy, leadership, and management.</li>
                        <li class="mb-3"><b>Expert Mentorship:</b> Learn from seasoned practitioners and academic leaders.</li>
                        <li class="mb-3"><b>Networking Opportunities:</b> Connect with a diverse community of professionals and experts in your field.</li>
                    </ul>
                </p>


            </div>
        </section>


        <asp:UpdatePanel runat="server" ID="upUpdate">
            <ContentTemplate>

                <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>


</body>
</html>
