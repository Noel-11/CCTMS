<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DataPrivacy.aspx.vb" Inherits="_DataPrivacy" Theme="Skins" %>

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

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-white">
            <div class="container-fluid">

                <!-- Toggle button (visible on mobile) -->
                <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#mainNavbar"
                    aria-controls="mainNavbar"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Collapsible menu -->
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
                <div class="join">
                    <b>DATA PRIVACY
                    <br>
                        CONSENT</b>
                </div>
            </div>
        </section>


        <section class="pb-5">
            <div class="container">
                <p class="mb-4">
                    The <b>City College of Cagayan de Oro - Office for Lifelong Learning and Professional Development (OLLPD)</b> values your privacy. Before proceeding with your registration, 
          please read and signify your consent regarding the collection and processing of your personal information.
                </p>

                <p class="mb-3"><b>1. Collection of Information</b> </p>
                <p>By filling out this form, we collect the following personal and professional data:</p>
                <p class="mb-3">
                    <ul>
                        <li>Full Name and Contact Details (Email, Mobile Number)</li>
                        <li>Professional Identification (PRC License Number, if applicable)</li>
                        <li>Employment Information (Current position, office/organization)</li>
                        <li>Educational Background and Training Preferences</li>
                    </ul>
                </p>

                <p class="mb-3"><b>2. Purpose of Processing</b></p>
                <p>The information collected shall be used exclusively for: </p>
                <p class="mb-3">
                    <ul>
                        <li>Assessing the demand for specific CPD/training programs.</li>
                        <li>Sending notifications regarding schedules, updates, and enrollment procedures.</li>
                        <li>Generating attendance certificates and reporting CPD units to the Professional Regulation Commission (PRC), where applicable.</li>
                        <li>Institutional research and internal statistical analysis to improve our services.</li>
                    </ul>
                </p>

                <p class="mb-3"><b>3. Data Protection and Retention</b></p>
                <p class="mb-3">
                    City College of Cagayan de Oro implements appropriate organizational, physical, and technical security measures to protect your data. 
            Your information will be stored in our secure database and will only be accessible to authorized personnel of the OLLPD. 
            We will retain your data only for as long as necessary to fulfill the purposes mentioned above or as required by law.
                </p>

                <p class="mb-3"><b>4. Disclosure of Information</b></p>
                <p>Your personal data will not be shared with third parties for commercial purposes. Disclosure will only occur:</p>
                <p class="mb-3">
                    <ul>
                        <li>To the Professional Regulation Commission (PRC) for CPD credit accreditation.</li>
                        <li>When required by government agencies or legal processes.</li>
                    </ul>
                </p>

                <p class="mb-3"><b>5. Your Rights</b></p>
                <p class="mb-3">As a data subject, you have the right to:</p>
                <p>
                    <ul>
                        <li>Access and correct your personal data.</li>
                        <li>Withdraw your consent or request the deletion of your information at any time.</li>
                        <li>Be informed of any breaches regarding your data.
                    
                        </li>
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
