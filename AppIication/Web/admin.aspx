<%@ Page Language="VB" AutoEventWireup="false" EnableEventValidation="false" CodeFile="admin.aspx.vb" Inherits="_admin" Theme="Skins" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE html>
<%@ Register Src="~/Include/sFooter.ascx" TagName="sFooter" TagPrefix="uc3" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="Shortcut Icon" href="~/Images/favicon.ico" type="image/x-icon" />
    <title>CITY COLLEGE</title>

    <link href="Scripts/Bootstrap5/css/bootstrap.css" rel="stylesheet" />
    <link href="Scripts/Bootstrap5/css/bootstrap.min.css" rel="stylesheet" />

    <script src="Scripts/Bootstrap5/js/bootstrap.min.js"></script>

    <script src="Scripts/Bootstrap5/js/bootstrap.bundle.js"></script>

    <link href="Scripts/NiceAdmin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />


    <!-- Font Awesome icons (free version)-->
    <%--<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>--%>

    <style type="text/css">
        .auto-style1 {
            width: 202px;
        }

        .auto-style4 {
            width: 533px;
        }

        #imgWaterMark {
            opacity: 0.4;
            z-index: -1;
            /* For IE8 and earlier */
        }

            #imgWaterMark:hover {
                opacity: 1;
                filter: alpha(opacity=100);
                position: absolute;
                z-index: -1;
                /*For IE8 and earlier*/
            }

        .divider:after,
        .divider:before {
            content: "";
            flex: 1;
            height: 1px;
            background: #eee;
        }

        .h-custom {
            height: calc(100% - 73px);
        }

        @media (max-width: 450px) {
            .h-custom {
                height: 100%;
            }
        }

        .footer {
            /*position: fixed;*/
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: #333;
            color: white;
            /*text-align: center;*/
        }
    </style>

    <!-- Google tag (gtag.js) -->
    <%--    <script async src="https://www.googletagmanager.com/gtag/js?id=G-BTES5DW7T1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'G-BTES5DW7T1');
    </script>--%>
</head>
<body class="bg-light">


    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="min-vh-100 d-flex align-items-center justify-content-center py-4 px-3"
            style="background: linear-gradient(135deg,#cdf9df 0%,#8ee8b0 40%,#2e8b5a4d 100%)">

            <div class="w-100" style="max-width: 900px">

                <%-- SYSTEM TITLE --%>
                <div class="text-center mb-4">
                    <h4 class="fw-bold mb-1"
                        style="font-size: clamp(16px,4vw,22px); letter-spacing: .04em; color: #1a4a2e; text-shadow: 0 2px 8px rgba(255,255,255,0.4)">
                        <i class="bi bi-mortarboard-fill me-2"></i>
                        City College Training Management System
                    </h4>
                    <p class="mb-0" style="font-size: 12px; color: #2e6b45">
                        Authorized Personnel Only
                    </p>
                </div>

                <div class="card border-0 overflow-hidden shadow-lg"
                    style="border-radius: 16px">
                    <div class="row g-0">

                        <%-- LEFT: Image panel — hidden on mobile --%>
                        <div class="col-md-5 d-none d-md-flex flex-column align-items-center justify-content-center p-5"
                            style="background: linear-gradient(160deg,#2e8b5a 0%,#1a5c35 100%)">

                            <img src="<%=ResolveClientUrl("~/Images/login.png")%>"
                                class="img-fluid mb-4"
                                style="max-height: 200px; object-fit: contain; filter: drop-shadow(0 8px 24px rgba(0,0,0,0.2))"
                                alt="City College Training Management System" />

                            <div class="text-center">
                                <h5 class="fw-bold text-white mb-2"
                                    style="font-size: 15px; letter-spacing: .03em; line-height: 1.5">City College Training<br />
                                    Management System
                                </h5>
                                <p class="mb-4" style="font-size: 11px; color: rgba(255,255,255,0.75); line-height: 1.6">
                                    Manage training programs, schedules,<br />
                                    and participants in one place.
                                </p>
                                <div class="d-flex justify-content-center gap-3">
                                    <div class="text-center">
                                        <div class="d-flex align-items-center justify-content-center rounded-3 mx-auto mb-1"
                                            style="width: 36px; height: 36px; background: rgba(205,249,223,0.2); font-size: 16px; color: #cdf9df">
                                            <i class="bi bi-people-fill"></i>
                                        </div>
                                        <small style="font-size: 10px; color: rgba(205,249,223,0.85)">Participants</small>
                                    </div>
                                    <div class="text-center">
                                        <div class="d-flex align-items-center justify-content-center rounded-3 mx-auto mb-1"
                                            style="width: 36px; height: 36px; background: rgba(205,249,223,0.2); font-size: 16px; color: #cdf9df">
                                            <i class="bi bi-calendar-check-fill"></i>
                                        </div>
                                        <small style="font-size: 10px; color: rgba(205,249,223,0.85)">Schedules</small>
                                    </div>
                                    <div class="text-center">
                                        <div class="d-flex align-items-center justify-content-center rounded-3 mx-auto mb-1"
                                            style="width: 36px; height: 36px; background: rgba(205,249,223,0.2); font-size: 16px; color: #cdf9df">
                                            <i class="bi bi-award-fill"></i>
                                        </div>
                                        <small style="font-size: 10px; color: rgba(205,249,223,0.85)">Certificates</small>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <%-- RIGHT: Login form --%>
                        <div class="col-12 col-md-7 d-flex flex-column justify-content-center bg-white"
                            style="padding: clamp(1.5rem,5vw,3rem)">

                            <%-- Mobile: logo --%>
                            <div class="text-center mb-4 d-md-none">
                                <img src="<%=ResolveClientUrl("~/Images/login.png")%>"
                                    class="img-fluid mb-3"
                                    style="max-height: 90px; object-fit: contain"
                                    alt="CCTMS" />
                                <p class="text-muted mb-0" style="font-size: 12px">
                                    Sign in to access your account
                                </p>
                            </div>

                            <%-- Form heading --%>
                            <div class="mb-4 d-none d-md-block">
                                <div class="d-flex align-items-center gap-2 mb-1">
                                    <div class="d-flex align-items-center justify-content-center rounded-3 flex-shrink-0"
                                        style="width: 36px; height: 36px; background: #cdf9df; color: #2e8b5a; font-size: 18px">
                                        <i class="bi bi-shield-lock"></i>
                                    </div>
                                    <h5 class="fw-bold mb-0" style="color: #1a4a2e; font-size: 18px">Welcome back
                                    </h5>
                                </div>
                                <p class="text-muted mb-0 ms-1" style="font-size: 13px">
                                    Sign in to continue to CCTMS.
                                </p>
                            </div>

                            <%-- User ID --%>
                            <div class="mb-3">
                                <label class="form-label fw-semibold mb-1"
                                    style="font-size: 13px; color: #1a4a2e">
                                    User ID <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text border-end-0"
                                        style="background: #cdf9df; color: #2e8b5a; border-color: #a8f0c4">
                                        <i class="bi bi-person"></i>
                                    </span>
                                    <asp:TextBox runat="server" ID="txtUserId"
                                        CssClass="form-control border-start-0"
                                        placeholder="Enter your user ID"
                                        Style="font-size: 14px; border-color: #a8f0c4"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="txtUserId" SetFocusOnError="true"
                                    CssClass="text-danger fst-italic mt-1"
                                    Style="font-size: 12px"
                                    Display="Dynamic" Text="User ID is required"
                                    ValidationGroup="DOC" />
                            </div>

                            <%-- Password --%>
                            <div class="mb-4">
                                <label class="form-label fw-semibold mb-1"
                                    style="font-size: 13px; color: #1a4a2e">
                                    Password <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text border-end-0"
                                        style="background: #cdf9df; color: #2e8b5a; border-color: #a8f0c4">
                                        <i class="bi bi-lock"></i>
                                    </span>
                                    <input runat="server" type="password" id="txtPassword"
                                        class="form-control border-start-0"
                                        placeholder="Enter your password"
                                        style="font-size: 14px; border-color: #a8f0c4" />
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtPassword" SetFocusOnError="true"
                                    CssClass="text-danger fst-italic mt-1"
                                    Style="font-size: 12px"
                                    Display="Dynamic" Text="Password is required"
                                    ValidationGroup="DOC" />
                            </div>

                            <%-- Sign in button --%>
                            <div class="d-grid mb-3">
                                <button runat="server" id="btnLogin"
                                    class="btn fw-semibold text-white d-flex align-items-center justify-content-center gap-2"
                                    style="background: #2e8b5a; border-color: #2e8b5a; font-size: 15px; padding: 12px"
                                    causesvalidation="false">
                                    <i class="bi bi-box-arrow-in-right" style="font-size: 17px"></i>
                                    Sign in
                                </button>
                            </div>

                            <%-- Register link (hidden by default) --%>
                            <p class="small fw-bold text-center mb-0" runat="server" visible="false">
                                Don't have an account?
                        <a href="#!" class="link-danger">Register</a>
                            </p>

                            <%-- Security notice --%>
                            <div class="text-center mt-4 pt-3 border-top"
                                style="border-color: #cdf9df !important">
                                <small class="text-muted d-flex align-items-center justify-content-center gap-1"
                                    style="font-size: 11px">
                                    <i class="bi bi-shield-check" style="color: #2e8b5a"></i>
                                    Authorized access only. All activity is monitored.
                                </small>
                            </div>

                        </div>

                    </div>
                </div>

                <%-- Footer --%>
                <div class="text-center mt-3">
                    <small style="font-size: 11px; color: #1a4a2e">&copy; <%=DateTime.Now.Year%> City College Training Management System. All rights reserved.
                    </small>
                </div>

            </div>

        </div>

        <!-- Footer -->
        <div class="footer">
            <uc3:sFooter ID="sFooter1" runat="server" />
        </div>


    </form>
</body>
</html>

