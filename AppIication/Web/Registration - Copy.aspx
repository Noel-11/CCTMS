<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Registration - Copy.aspx.vb" Inherits="_Registration" Theme="Skins" %>

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

    <%--<link href="Scripts/mycss/landing_page.css" rel="stylesheet" />--%>

    <script src="Scripts/NiceAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="Scripts/NiceAdmin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />

</head>
<body style="background-color: #F4F4F4;">
    <form id="form1" runat="server" autocomplete="off">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-4">
                        <button runat="server" id="btnHome" class="btn btn-primary" style="filter: drop-shadow(0 0 2.5px black);"><i class="bi bi-house h4"></i></button>
                    </div>
                    <div class="col-md-4" style="text-align: center;">
                        <h5>CITY COLLEGE ONLINE TRAINING APPLICATION</h5>
                    </div>
                    <div class="col-md-4">
                        <h5><span runat="server" id="spanRefCode" class="badge rounded-pill bg-light text-dark float-end"></span></h5>
                    </div>
                </div>

            </div>
        </div>

        <%-- PERSONAL INFORMATION --%>

        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" Text="PERSONAL INFORMATION" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-body" style="background-color: #F4F4F4;">

                <div class="row  mb-2">
                    <div class="col-lg-4">
                        <div class="input-group">
                            <span class="input-group-text">Last Name</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtLName"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-lg-4">
                        <div class="input-group">
                            <span class="input-group-text">First Name</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtFName"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-lg-2">
                        <div class="input-group">
                            <span class="input-group-text">Middle Name</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtMName"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-2">
                        <div class="input-group">
                            <span class="input-group-text">Suffix</span>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="txtEName"></asp:DropDownList>
                        </div>
                    </div>

                </div>


                <div class="row mb-2">

                    <div class="col-lg-4">
                        <div class="input-group">
                            <span class="input-group-text">Gender</span>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlGender"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="input-group">
                            <span class="input-group-text">Civil Status</span>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlCivilStatus"></asp:DropDownList>
                        </div>
                    </div>

                </div>


                <div class="row mb-2">
                    <div class="col-lg-4">
                        <div class="input-group">
                            <span class="input-group-text">Contact No.</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtContactNo"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-lg-4">
                        <div class="input-group">
                            <span class="input-group-text">Email Address</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtEmailAdd"></asp:TextBox>
                            <span class="input-group-text">I</span>
                        </div>

                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-lg-6">
                        <div class="input-group">
                            <span class="input-group-text">Home Address</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtHomeAddr"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-lg-6">
                        <div class="input-group">
                            <span class="input-group-text">City/Province</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtCityAddr"></asp:TextBox>

                        </div>

                    </div>
                </div>

            </div>
        </div>



        <%-- PROFESSION / OCCUPATION --%>

        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" Text="PROFESSION / OCCUPATION" Font-Bold="true"></asp:Label>
            </div>

            <div class="card-body" style="background-color: #F4F4F4;">

                <div class="row mb-2">
                    <div class="col-lg-6">
                        <div class="input-group">
                            <span class="input-group-text">Profession / Occupation</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtProfession"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-lg-6">
                        <div class="input-group">
                            <span class="input-group-text">Highest Educational Attainment</span>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlEducAttaintment"></asp:DropDownList>
                        </div>

                    </div>

                </div>

                <div class="row mb-2">
                    <div class="col-lg-6">
                        <div class="input-group">
                            <span class="input-group-text">Current Workplace/Affiliation</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtAffiliation"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-lg-6">
                        <div class="input-group">
                            <span class="input-group-text">Position / Job Title</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPosition"></asp:TextBox>
                        </div>

                    </div>

                </div>

                 <div class="row mb-2">
                      <div class="col-lg-6">
                        <div class="input-group">
                            <span class="input-group-text">PRC License Number</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPRCNo"></asp:TextBox>
                             <span class="input-group-text"></span>
                        </div>

                    </div>

                      <div class="col-lg-6">
                        <div class="input-group">
                            <span class="input-group-text">License Expiration Date</span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="dtpExpirationDate" TextMode="Date"></asp:TextBox>
                        </div>

                    </div>
                 </div>


            </div>

        </div>


        <asp:UpdatePanel runat="server" ID="upUpdate">
            <ContentTemplate>
                <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</body>
</html>
