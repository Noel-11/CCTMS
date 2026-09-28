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

    <link href="Scripts/Bootstrap5/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Scripts/NiceAdmin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <script src="Scripts/Bootstrap5/js/bootstrap.bundle.min.js"></script>

    <style type="text/css">
        :root {
            --primary-base: #2e8b5a;
            --primary-dark: #246e47;
            --border-soft: #d3dfd8;
        }

        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f4f8fb;
        }

        /* Full layout wrapper with subtle split / gradient background inspired by reference */
        .login-wrapper {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #a6d8eb 0%, #bde3f3 48%, #eef7fb 52%, #cbe9f7 100%);
        }

        @media (max-width: 991.98px) {
            .login-wrapper {
                background: linear-gradient(180deg, #a6d8eb 0%, #daf0f8 40%, #ffffff 100%);
            }
        }

        .login-main {
            flex: 1 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 3rem 1.5rem 2rem;
        }

        /* Left graphic panel */
        .left-illustration-col {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem 2.5rem;
        }

        .left-illustration-img {
            max-width: 85%;
            height: auto;
            max-height: 380px;
            object-fit: contain;
            filter: drop-shadow(0 12px 24px rgba(0, 0, 0, 0.1));
        }

        /* Partner Logos & Subtitle Above Card */
        .partner-logos img {
            height: 48px;
            width: auto;
            object-fit: contain;
            filter: drop-shadow(0 2px 4px rgba(0,0,0,0.06));
        }

        .portal-subtext {
            font-size: 0.82rem;
            color: #3f6854;
            font-weight: 500;
            letter-spacing: 0.02em;
        }

        /* Admin Login Card */
        .login-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 16px 36px rgba(18, 48, 32, 0.12), 0 4px 12px rgba(0, 0, 0, 0.04);
            border: 1px solid rgba(0, 0, 0, 0.06);
            max-width: 420px;
            width: 100%;
            margin: 0 auto;
            overflow: hidden;
        }

        .login-card-header {
            background-color: var(--primary-base);
            color: #ffffff;
            padding: 0.95rem 1.5rem;
            text-align: center;
            font-weight: 600;
            font-size: 1.05rem;
            letter-spacing: 0.02em;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .login-card-body {
            padding: 1.85rem 2rem 1.6rem;
        }

        .form-label-custom {
            font-size: 0.86rem;
            font-weight: 600;
            color: #2b3a32;
            margin-bottom: 0.35rem;
        }

        .input-group-custom {
            border: 1px solid #c9d5cf;
            border-radius: 6px;
            overflow: hidden;
            transition: all 0.2s ease-in-out;
            background-color: #ffffff;
        }

        .input-group-custom:focus-within {
            border-color: var(--primary-base);
            box-shadow: 0 0 0 0.2rem rgba(46, 139, 90, 0.2);
        }

        .input-group-custom .input-group-text {
            background: transparent;
            border: none;
            color: #798d83;
            font-size: 1.05rem;
            padding-left: 0.85rem;
            padding-right: 0.5rem;
        }

        .input-group-custom .form-control {
            border: none;
            box-shadow: none;
            padding: 0.62rem 0.75rem 0.62rem 0.2rem;
            font-size: 0.92rem;
            color: #2b3a32;
        }

        .input-group-custom .form-control::placeholder {
            color: #9cb0a5;
            font-size: 0.88rem;
        }

        .btn-sign-in {
            background-color: var(--primary-base);
            border-color: var(--primary-base);
            color: #ffffff;
            font-weight: 600;
            font-size: 0.95rem;
            padding: 0.65rem 1.25rem;
            border-radius: 6px;
            transition: all 0.25s ease-in-out;
        }

        .btn-sign-in:hover, .btn-sign-in:focus {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
            color: #ffffff;
        }

        .login-card-footer {
            border-top: 1px solid #f0f4f2;
            padding: 0.8rem 1.25rem;
            text-align: center;
            background-color: #ffffff;
            font-size: 0.76rem;
            color: #63776d;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.35rem;
        }

        .footer {
            flex-shrink: 0;
            width: 100%;
            background-color: #333;
            color: white;
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

        <div class="login-wrapper">
            <main class="login-main">
                <div class="container-fluid px-3 px-md-4">
                    <div class="row align-items-center justify-content-center gy-4 gx-lg-5">

                        <%-- LEFT SIDE: Illustration (login.png) --%>
                        <div class="col-12 col-lg-6 col-xl-6 left-illustration-col">
                            <img src="<%=ResolveClientUrl("~/Images/login.png")%>"
                                class="left-illustration-img img-fluid"
                                alt="City College Training Management System" />
                        </div>

                        <%-- RIGHT SIDE: Brand Logos, Subtext & Admin Login Card --%>
                        <div class="col-12 col-md-8 col-lg-5 col-xl-4">

                            <%-- Top partner / system logos and subtitle --%>
                            <div class="text-center mb-3">
                                <div class="d-flex align-items-center justify-content-center gap-3 partner-logos mb-2">
                                    <img src="<%=ResolveClientUrl("~/Images/CCLogo.png")%>" alt="City College Logo" />
                                    <img src="<%=ResolveClientUrl("~/Images/CDOSeal.png")%>" alt="City of Cagayan de Oro Seal" />
                                    <img src="<%=ResolveClientUrl("~/Images/RISE.png")%>" alt="RISE Cagayan de Oro" />
                                </div>
                                <div class="portal-subtext">
                                    Office of the City College — Admin Portal
                                </div>
                            </div>

                            <%-- Login Card --%>
                            <div class="login-card">
                                <%-- Card Header --%>
                                <div class="login-card-header">
                                    <i class="bi bi-shield-lock"></i>
                                    <span>Administrator Login</span>
                                </div>

                                <%-- Card Body --%>
                                <div class="login-card-body">

                                    <%-- User ID --%>
                                    <div class="mb-3 text-start">
                                        <label class="form-label form-label-custom">
                                            User ID <span class="text-danger">*</span>
                                        </label>
                                        <div class="input-group-custom d-flex align-items-center">
                                            <span class="input-group-text">
                                                <i class="bi bi-person"></i>
                                            </span>
                                            <asp:TextBox runat="server" ID="txtUserId"
                                                CssClass="form-control"
                                                placeholder="Enter your user ID"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ControlToValidate="txtUserId" SetFocusOnError="true"
                                            CssClass="text-danger fst-italic mt-1 d-block"
                                            Style="font-size: 11px"
                                            Display="Dynamic" Text="User ID is required"
                                            ValidationGroup="DOC" />
                                    </div>

                                    <%-- Password --%>
                                    <div class="mb-4 text-start">
                                        <label class="form-label form-label-custom">
                                            Password <span class="text-danger">*</span>
                                        </label>
                                        <div class="input-group-custom d-flex align-items-center">
                                            <span class="input-group-text">
                                                <i class="bi bi-lock"></i>
                                            </span>
                                            <input runat="server" type="password" id="txtPassword"
                                                class="form-control"
                                                placeholder="Enter your password" />
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ControlToValidate="txtPassword" SetFocusOnError="true"
                                            CssClass="text-danger fst-italic mt-1 d-block"
                                            Style="font-size: 11px"
                                            Display="Dynamic" Text="Password is required"
                                            ValidationGroup="DOC" />
                                    </div>

                                    <%-- Sign in button --%>
                                    <div class="d-grid mb-2">
                                        <button runat="server" id="btnLogin"
                                            class="btn btn-sign-in"
                                            causesvalidation="false">
                                            Sign in
                                        </button>
                                    </div>

                                    <%-- Register link (hidden by default) --%>
                                    <p class="small fw-bold text-center mb-0 mt-3" runat="server" visible="false">
                                        Don't have an account?
                                        <a href="#!" class="link-danger">Register</a>
                                    </p>
                                </div>

                                <%-- Security notice --%>
                                <div class="login-card-footer">
                                    <i class="bi bi-shield-check" style="color: var(--primary-base);"></i>
                                    <span>Authorized access only. All activity is monitored and logged.</span>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </main>

            <!-- Footer -->
            <div class="footer">
                <uc3:sFooter ID="sFooter1" runat="server" />
            </div>

        </div>


    </form>
</body>
</html>

