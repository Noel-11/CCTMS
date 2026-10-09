<%@ Page Language="VB" AutoEventWireup="false" EnableEventValidation="false" CodeFile="admin.aspx.vb" Inherits="_admin" Theme="Skins" %>
<%@ Register Src="~/Include/sFooter.ascx" TagName="sFooter" TagPrefix="uc3" %>

<!DOCTYPE html>

<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="~/Images/favicon.ico" type="image/x-icon" />
    <title>CITY COLLEGE | Administrator Login</title>

    <link href="Scripts/Bootstrap5/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Scripts/NiceAdmin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />

    <style type="text/css">
        /* Brand tokens: only what Bootstrap utilities cannot express */
        :root {
            --brand: #2e8b5a;
            --brand-dark: #246e47;
            --brand-ring: rgba(46, 139, 90, .25);
        }

        .login-wrapper {
            background: linear-gradient(135deg, #a6d8eb 0%, #bde3f3 48%, #eef7fb 52%, #cbe9f7 100%);
        }

        @media (max-width: 991.98px) {
            .login-wrapper {
                background: linear-gradient(180deg, #a6d8eb 0%, #daf0f8 40%, #ffffff 100%);
            }
        }

        .illustration {
            max-height: 380px;
            filter: drop-shadow(0 12px 24px rgba(0, 0, 0, .10));
        }

        .partner-logo {
            height: 48px;
            width: auto;
        }

        .login-card {
            max-width: 440px;
        }

        .bg-brand {
            background-color: var(--brand);
        }

        .text-brand {
            color: var(--brand);
        }

        /* Focus states in the brand colour */
        .login-card .form-control:focus {
            border-color: var(--brand);
            box-shadow: 0 0 0 .2rem var(--brand-ring);
        }

        .login-card .input-group:focus-within .input-group-text,
        .login-card .input-group:focus-within .btn {
            border-color: var(--brand);
        }

        .login-card .input-group:focus-within .input-group-text {
            color: var(--brand);
        }

        .btn-brand {
            background-color: var(--brand);
            border-color: var(--brand);
            color: #fff;
        }

        .btn-brand:hover,
        .btn-brand:focus-visible {
            background-color: var(--brand-dark);
            border-color: var(--brand-dark);
            color: #fff;
        }

        .btn-brand:focus-visible {
            box-shadow: 0 0 0 .2rem var(--brand-ring);
        }

        .btn-brand:active {
            background-color: #1d5838 !important;
            border-color: #1d5838 !important;
            color: #fff !important;
        }

        /* Validator text: do NOT add d-block here, it overrides the
           display:none that Display="Dynamic" relies on to hide the message. */
        .validator-msg {
            font-size: .8rem;
            font-style: italic;
            color: var(--bs-danger, #dc3545);
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="login-wrapper min-vh-100 d-flex flex-column">

            <main class="flex-grow-1 d-flex align-items-center py-4 py-md-5">
                <div class="container">
                    <div class="row align-items-center justify-content-center g-4 g-xl-5">

                        <%-- LEFT: Illustration (desktop only, so mobile users see the form first) --%>
                        <div class="col-lg-6 col-xl-7 d-none d-lg-flex justify-content-center">
                            <img src="<%=ResolveClientUrl("~/Images/login.png")%>"
                                class="img-fluid illustration"
                                alt="City College Training Management System" />
                        </div>

                        <%-- RIGHT: Branding + Login card --%>
                        <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5">

                            <%-- Partner logos and portal name --%>
                            <div class="text-center mb-3">
                                <div class="d-flex flex-wrap align-items-center justify-content-center gap-3 mb-2">
                                    <img src="<%=ResolveClientUrl("~/Images/CCLogo.png")%>" class="partner-logo" alt="City College Logo" />
                                    <img src="<%=ResolveClientUrl("~/Images/CDOSeal.png")%>" class="partner-logo" alt="City of Cagayan de Oro Seal" />
                                    <img src="<%=ResolveClientUrl("~/Images/RISE.png")%>" class="partner-logo" alt="RISE Cagayan de Oro" />
                                </div>
                                <div class="small fw-medium text-secondary">
                                    Office of the City College &mdash; Admin Portal
                                </div>
                            </div>

                            <%-- Login card --%>
                            <div class="card login-card mx-auto border-0 shadow-lg overflow-hidden">

                                <div class="card-header bg-brand text-white text-center fw-semibold py-3 d-flex align-items-center justify-content-center gap-2">
                                    <i class="bi bi-shield-lock" aria-hidden="true"></i>
                                    <span>Administrator Login</span>
                                </div>

                                <div class="card-body p-4">

                                    <%-- User ID --%>
                                    <div class="mb-3">
                                        <asp:Label runat="server" AssociatedControlID="txtUserId"
                                            CssClass="form-label fw-semibold small mb-1">
                                            User ID <span class="text-danger">*</span>
                                        </asp:Label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white text-secondary">
                                                <i class="bi bi-person" aria-hidden="true"></i>
                                            </span>
                                            <asp:TextBox runat="server" ID="txtUserId"
                                                CssClass="form-control"
                                                autocomplete="username"
                                                placeholder="Enter your user ID"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ControlToValidate="txtUserId" SetFocusOnError="true"
                                            CssClass="validator-msg"
                                            Display="Dynamic" Text="User ID is required"
                                            ValidationGroup="DOC" />
                                    </div>

                                    <%-- Password --%>
                                    <div class="mb-4">
                                        <asp:Label runat="server" AssociatedControlID="txtPassword"
                                            CssClass="form-label fw-semibold small mb-1">
                                            Password <span class="text-danger">*</span>
                                        </asp:Label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white text-secondary">
                                                <i class="bi bi-lock" aria-hidden="true"></i>
                                            </span>
                                            <input runat="server" type="password" id="txtPassword"
                                                class="form-control"
                                                autocomplete="current-password"
                                                placeholder="Enter your password" />
                                            <button type="button" class="btn btn-outline-secondary js-toggle-password"
                                                aria-label="Show password" title="Show password">
                                                <i class="bi bi-eye" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ControlToValidate="txtPassword" SetFocusOnError="true"
                                            CssClass="validator-msg"
                                            Display="Dynamic" Text="Password is required"
                                            ValidationGroup="DOC" />
                                    </div>

                                    <%-- Sign in --%>
                                    <div class="d-grid">
                                        <button runat="server" id="btnLogin" type="submit"
                                            class="btn btn-brand fw-semibold py-2 d-flex align-items-center justify-content-center gap-2"
                                            causesvalidation="true" validationgroup="DOC">
                                            <i class="bi bi-box-arrow-in-right" aria-hidden="true"></i>
                                            <span>Sign in</span>
                                        </button>
                                    </div>

                                    <%-- Register link (hidden by default) --%>
                                    <p class="small fw-bold text-center mb-0 mt-3" runat="server" visible="false">
                                        Don't have an account?
                                        <a href="#!" class="link-danger">Register</a>
                                    </p>
                                </div>

                                <%-- Security notice --%>
                                <div class="card-footer bg-white text-secondary small text-center py-3 d-flex align-items-center justify-content-center gap-2">
                                    <i class="bi bi-shield-check text-brand" aria-hidden="true"></i>
                                    <span>Authorized access only. All activity is monitored and logged.</span>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </main>

            <%-- Footer (existing user control) --%>
            <div class="footer flex-shrink-0 w-100 border-top" style="background-color: #e7e7e7;">
                <uc3:sFooter ID="sFooter1" runat="server" />
            </div>

        </div>
    </form>

    <script src="<%=ResolveClientUrl("~/Scripts/Bootstrap5/js/bootstrap.bundle.min.js")%>"></script>
    <script>
        // Show / hide password
        document.querySelectorAll('.js-toggle-password').forEach(function (btn) {
            btn.addEventListener('click', function () {
                var input = btn.closest('.input-group').querySelector('input');
                var icon = btn.querySelector('i');
                var show = input.type === 'password';
                input.type = show ? 'text' : 'password';
                icon.className = show ? 'bi bi-eye-slash' : 'bi bi-eye';
                btn.setAttribute('aria-label', show ? 'Hide password' : 'Show password');
                btn.title = show ? 'Hide password' : 'Show password';
            });
        });
    </script>
</body>
</html>
