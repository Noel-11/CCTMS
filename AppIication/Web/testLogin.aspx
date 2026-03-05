<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testLogin.aspx.vb" Inherits="testLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>City College Training System - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <link href="Scripts/PwVal/pwVal.css" rel="stylesheet" />

    <script src="Scripts/PwVal/pwVal.js"></script>

    <style>
        body {
            background: linear-gradient(135deg, #0d6efd, #198754);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            border-radius: 20px;
            overflow: hidden;
        }

        .login-left {
            background: #f8f9fa;
            padding: 2rem;
            text-align: center;
        }

            .login-left img {
                max-width: 100%;
                height: auto;
            }

        .login-right {
            padding: 3rem;
        }

        .btn-login {
            border-radius: 50px;
            padding: 10px;
            font-weight: 600;
            transition: 0.3s;
        }

            .btn-login:hover {
                transform: scale(1.03);
            }
    </style>
</head>

<body>
    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 col-md-12">
                    <div class="card shadow-lg border-0 login-card">

                        <div class="row g-0">

                            <!-- LEFT SIDE (Branding / Image) -->
                            <div class="col-md-6 login-left d-none d-md-flex flex-column justify-content-center">
                                <img src="your-banner-image.jpg" alt="City College Logo">
                                <h4 class="mt-3 fw-bold text-success">City College Training Management System
                                </h4>
                                <p class="text-muted small">
                                    Lifelong Learning and Professional Development
                                </p>
                            </div>

                            <!-- RIGHT SIDE (Login Form) -->
                            <div class="col-md-6 login-right">

                                <h3 class="fw-bold mb-4 text-center">Welcome Back 👋</h3>

                                <form>

                                    <!-- Username -->
                                    <div class="form-floating mb-3">
                                        <asp:TextBox ID="txtUsername" runat="server"
                                            CssClass="form-control"
                                            placeholder="Username"></asp:TextBox>
                                        <label>Username</label>
                                    </div>

                                    <!-- Password -->
                                    <div class="form-floating mb-4">
                                        <asp:TextBox ID="txtPassword" runat="server"
                                            CssClass="form-control"
                                            TextMode="Password"
                                            placeholder="Password"></asp:TextBox>
                                        <label>Password</label>
                                    </div>

                                    <!-- Login Button -->
                                    <div class="d-grid">
                                        <asp:Button ID="btnLogin" runat="server"
                                            Text="Login"
                                            CssClass="btn btn-success btn-login" />
                                    </div>

                                </form>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>


        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-6">

                            <label class="form-label">Password</label>
                            <div class="input-group mb-2">
                                <span class="input-group-text">🔒</span>
                                <input type="password" id="password" class="form-control" onkeyup="validatePassword()">
                            </div>

                            <!-- Validation Box -->
                            <div class="card p-3 password-box">
                                <p id="length" class="invalid">❌ Must be at least 8 characters</p>
                                <p id="uppercase" class="invalid">❌ Must contain at least 1 uppercase letter</p>
                                <p id="number" class="invalid">❌ Must contain at least 1 number</p>
                                <p id="special" class="invalid">❌ Must contain at least 1 special character</p>
                            </div>

                        </div>
                    </div>
                </div>


            </ContentTemplate>
        </asp:UpdatePanel>


    </form>


</body>
</html>
