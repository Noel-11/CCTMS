<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AppProfile.aspx.vb" Inherits="Secured_Applicant_AppProfile" Theme="Skins" %>

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
    <link href="../../Scripts/NiceAdmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com" rel="stylesheet" />

    <%--<link href="Scripts/mycss/landing_page.css" rel="stylesheet" />--%>

    <script src="../../Scripts/NiceAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="../../Scripts/NiceAdmin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />

</head>
<body class="bg-light">
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

        <div class="container my-4">
            <div class="card shadow-sm">
                <div class="card-body">

                    <!-- PERSONAL INFORMATION -->
                    <h6 class="border-bottom pb-2 mb-3 fw-bold">PERSONAL INFORMATION</h6>

                    <div class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Last Name</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtLName" />
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">First Name</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtFName" />
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Middle Name</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtMName" />
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Suffix</label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlEName">
                                <asp:ListItem Text="" Value="" />
                                <asp:ListItem Text="Jr." Value="Jr." />
                                <asp:ListItem Text="Sr." Value="Sr." />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row g-3 mt-2">
                        <div class="col-md-3">
                            <label class="form-label">Gender</label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlGender">
                                <asp:ListItem Text="" Value="" />
                                <asp:ListItem Text="Male" Value="Male" />
                                <asp:ListItem Text="Female" Value="Female" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Civil Status</label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlCivilStatus">
                                <asp:ListItem Text="" Value="" />
                                <asp:ListItem Text="Single" Value="Single" />
                                <asp:ListItem Text="Married" Value="Married" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Contact No.</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtContactNo" MaxLength="11" />
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Email Address</label>
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="txtEmail" />
                        </div>
                    </div>

                    <div class="row g-3 mt-2">
                        <div class="col-md-6">
                            <label class="form-label">Home Address</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtHomeAddr" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">City / Province</label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="dllCityAddr">
                                <asp:ListItem Text="CAGAYAN DE ORO CITY" Value="CAGAYAN DE ORO CITY"></asp:ListItem>
                                <asp:ListItem Text="ILIGAN CITY" Value="ILIGAN CITY"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- PROFESSION -->
                    <h6 class="border-bottom pb-2 mt-4 fw-bold">PROFESSION / OCCUPATION</h6>

                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label">Profession / Occupation</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtProfession" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Highest Educational Attainment</label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="dllEducation">
                                <asp:ListItem Text="BACHELOR'S DEGREE" Value="BACHELOR'S DEGREE"></asp:ListItem>
                                <asp:ListItem Text="MASTER'S DEGREE" Value="MASTER'S DEGREE"></asp:ListItem>
                                <asp:ListItem Text="DOCTORAL DEGREE" Value="DOCTORAL DEGREE"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Position / Job Title</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPosition" />
                        </div>
                    </div>

                    <div class="row g-3 mt-2">
                        <div class="col-md-4">
                            <label class="form-label">Current Workplace / Affiliation</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtWorkPlace" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">PRC License Number</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPRCNo" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">License Expiration Date</label>
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpPRCExpiration" />
                        </div>
                    </div>

                    <!-- TRAINING -->
                    <h6 class="border-bottom pb-2 mt-4 fw-bold">TRAINING & SEMINAR PREFERENCES</h6>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Preferred Learning Tracks</label>
                            <asp:DropDownList runat="server" CssClass="form-control" ID="dllPreferredTracks">
                                <asp:ListItem Text="Educational leadership & Pedagogy" Value="LEADERSHIP & PEDAGOGY"></asp:ListItem>
                                <asp:ListItem Text="Digital Transformation & IT Literacy" Value="DIGITAL TRANSFORMATION"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Preferred Learning Mode</label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlPreferredMode">
                                <asp:ListItem Text="Face-to-Face (at city College of CDO)" Value="F2F"></asp:ListItem>
                                <asp:ListItem Text="Fully Online (Zoom/Google Meet)" Value="ONLINE"></asp:ListItem>
                                <asp:ListItem Text="Hybrid (Mix of Online and In-person)" Value="HYBRID"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row g-3 mt-2">
                        <div class="col-md-6">
                            <label class="form-label">Preferred Schedule</label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlPreferredSched">
                                <asp:ListItem Text="Weekdays" Value="WEEKDAYS"></asp:ListItem>
                                <asp:ListItem Text="Weekends" Value="WEEKENDS"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Specific Topic of Interest</label>
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" ID="txtSpecificTopic" />
                        </div>
                    </div>

                    <!-- ADMIN -->
                    <h6 class="border-bottom pb-2 mt-4 fw-bold">ADMINISTRATIVE TRACKING</h6>

                    <div class="mb-3">
                        <label class="form-label">How did you hear about our programs?</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlHear">
                            <asp:ListItem Text="Social Media (Facebook/Linkedln)" Value="WEEKDAYS"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="text-center mt-4">
                        <asp:Button runat="server" Text="Save" CssClass="btn btn-success px-5" ID="btnSaveRegistration" />
                        <asp:Button runat="server" Text="ChangePassword" CssClass="btn btn-success px-5" ID="btnChangePassword" />
                    </div>

                </div>
            </div>
        </div>


        <%-- RETRIEVE --%>
        <div class="modal fade" id="mdlPassword" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content">

                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <div class="modal-header bg-danger text-light" style="text-align: center;">
                                <asp:Label runat="server" ID="Label8" Style="font-size: 20px;" Text="Continue Registration"></asp:Label>
                                <button type="button" id="btnMdlStatusClose" class="btn-close text-light" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <span class="input-group-addon">Current Password </span>
                                        <asp:TextBox runat="server" ID="txtCurrentPassword" CssClass="form-control" Width="30%" data-toggle="tooltip" data-placement="top" title="Current Password" trigger="hover" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <span class="input-group-addon">New Password </span>
                                        <asp:TextBox runat="server" ID="txtNewPassword" CssClass="form-control" Width="30%" data-toggle="tooltip" data-placement="top" title="New Password" trigger="hover" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <span class="input-group-addon">Re-type Password </span>
                                        <asp:TextBox runat="server" ID="txtRetypePassword" CssClass="form-control" Width="30%" data-toggle="tooltip" data-placement="top" title="Re-type Password" trigger="hover" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" runat="server" class="btn btn-success btn-lg mb-2" id="btnSavePassword" validationgroup="SubmitStatus">Save</button>
                                 <button type="button" runat="server" class="btn btn-danger btn-lg mb-2" id="Button1" data-bs-dismiss="modal">Save</button>
                             
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>

        </div>


        <asp:UpdatePanel runat="server" ID="upUpdate">
            <ContentTemplate>
                <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
                <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</body>
</html>
