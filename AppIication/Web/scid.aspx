<%@ Page Title="SCID Registration" Language="VB" AutoEventWireup="false" CodeFile="scid.aspx.vb" Inherits="scid" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" type="image/x-icon" href="Scripts/landing/assets/favicon.ico" />

    <link href="Scripts/Bootstrap5/css/bootstrap.css" rel="stylesheet" />
   
    <link href="Scripts/Bootstrap5/css/bootstrap.min.css" rel="stylesheet" />
   
   <%--  <link href="Scripts/Bootstrap5/NavbarTheme/css/styles.css" rel="stylesheet" />--%>

    <script src="Scripts/Bootstrap5/js/bootstrap.min.js"></script>

    <link href="Scripts/mycss/stepsStyle.css" rel="stylesheet" />

     <%--<link href="Scripts/assets/css/style.bundle.css" rel="stylesheet" />--%>

    <link href="Scripts/mycss/mycss.css" rel="stylesheet" />

    <link href="Scripts/NiceAdmin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
   
    <%-- FILE UPLOAD --%>
  
    <link href="Scripts/kartik_bootstrap_fileinput/css/fileinput.css" rel="stylesheet" />
  
    <link href="Scripts/kartik_bootstrap_fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
  

    <script src="Scripts/kartik_bootstrap_fileinput/js/plugins/buffer.min.js"></script>
    <script src="Scripts/kartik_bootstrap_fileinput/js/plugins/filetype.min.js"></script>

    <script src="Scripts/kartik_bootstrap_fileinput/js/plugins/piexif.min.js"></script>

    <script src="Scripts/kartik_bootstrap_fileinput/js/plugins/sortable.min.js"></script>
    <script src="Scripts/Bootstrap5/js/bootstrap.bundle.min.js" integrity="sha384-..." crossorigin="anonymous"></script>
   
    <script src="Scripts/kartik_bootstrap_fileinput/js/fileinput.min.js"></script>

    <script src="Scripts/kartik_bootstrap_fileinput/js/locales/LANG.js"></script>

    <style>
        .modal {
            overflow: auto !important;
        }

        .footer {
            padding-top: 17px;
            /*padding-bottom:5%;*/
            /*position: fixed;*/
            left: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.25);
            /*height: 100px;*/
            width: 100%;
            color: #FFF;
            font-weight: bold;
            font-size: 1.4rem;
            /*line-height: 14px;*/
            z-index: 1;
        }
    </style>

    <script>

        function uploadFile() {
            if (executeFile() == false) return false;
            $.when(executeFile()).then(function () {
                doneUpload();
            })
            //executeFile();
        };

        function executeFile() {

            var fileInput = document.getElementById("fuRequirements");
            var file = fileInput.files[0];

            console.log(file);

            if (file == null) {
                console.log("No files selected.");
                return false;
            } else if (file.type.split("/")[0] != "image") {
                console.log("Not an image file.");
                return false;
            }
            else {
                var formData = new FormData();
                formData.append("file", file);
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "FileUploadHandlerDocument.ashx");
                xhr.send(formData);
            }

        }

        function doneUpload() {
            $('#btnFillGVAttach').click();
        }
    </script>

    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-BTES5DW7T1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'G-BTES5DW7T1');
    </script>

</head>


<body style="background-color: #306a6aab;" class="d-flex flex-column min-vh-100">
    <form id="form1" method="post" runat="server" defaultbutton="btnDoNothing" autocomplete="off">
        <asp:Button ID="btnDoNothing" runat="server" Enabled="false" Style="display: none;" />

        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="Scripts/block/UPBlock.js" />
            </Scripts>
        </asp:ScriptManager>

        <br />

        <div class="container-fluid">

            <!--SC APPLICATION -->

            <div class="card" style="z-index: 5;">

                <div class="card-header bg-success text-light">
                    <div class="row">
                        <div class="col-md-4">
                            <button runat="server" id="btnHome" class="btn btn-primary" style="filter: drop-shadow(0 0 2.5px black);"><i class="bi bi-house h4"></i></button>
                        </div>
                        <div class="col-md-4" style="text-align: center;">
                            <h5>ONLINE SENIOR CITIZEN APPLICATION</h5>
                        </div>
                        <div class="col-md-4">
                            <h5><span runat="server" id="spanRefCode" class="badge rounded-pill bg-light text-dark float-end"></span></h5>
                        </div>
                    </div>

                </div>

                <div class="card-body" style="padding-bottom: 0px; z-index: 9;">

                    <%-- STEPS --%>
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="form">
                                <ul id="progressbar">
                                    <li class="active" id="step1">
                                        <strong>I. IDENTIFYING INFORMATION</strong>
                                    </li>
                                    <li id="step2"><strong>II. FAMILY COMPOSITION</strong></li>
                                    <li id="step3"><strong>III. DEPENDENCY PROFILE</strong></li>
                                    <li id="step4"><strong>IV. EDUCATION / HR PROFILE</strong></li>
                                    <li id="step5"><strong>V. ECONOMIC PROFILE</strong></li>
                                    <li id="step6"><strong>VI. HEALTH PROFILE</strong></li>
                                    <li id="step7"><strong>VII. ATTACHMENTS</strong></li>
                                </ul>

                            </div>
                        </div>
                    </div>

                    <span style="color: #E21C21;"><span style="font-style: italic;">* </span><span style="font-weight: normal;"><span style="font-style: italic;">Items with an asterisk (*) are required.</span></span></span>

                    <%-- CONTENT --%>
                    <div id="form">

                        <%-- STEP 1 --%>
                        <fieldset style="text-align: left;" id="field1" class="container-fluid">
                            <asp:UpdatePanel ID="updatePanel1" runat="server">
                                <ContentTemplate>

                                    <%-- <div class="container-fluid" id="stepField1">--%>
                                    <div class="row">
                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label1">Lastname</asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <asp:TextBox runat="server" ID="txtLastName" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" CssClass="req1" runat="server" ControlToValidate="txtLastName" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />
                                        </div>

                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label5">Firstname</asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <asp:TextBox runat="server" ID="txtFirstName" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="req1" runat="server" ControlToValidate="txtFirstName" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />
                                        </div>

                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label17">Middlename</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtMiddleName" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="req1" runat="server" ControlToValidate="txtMiddleName" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />--%>
                                        </div>

                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label16">Name Ext.</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtExtName" CssClass="input-field form-control" Style="text-transform: uppercase" MaxLength="100" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <hr />

                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label18"><b>2. Address</b></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-8 mb-1">
                                            <asp:Label runat="server" ID="Label19">Street</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtStreet" CssClass="req1 input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label20">Barangay</asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlBarangay">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="req1" runat="server" ControlToValidate="ddlBarangay" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />
                                        </div>
                                    </div>

                                    <hr />

                                    <div class="row">
                                        <div class="col-md-4">
                                            <asp:Label runat="server" ID="Label21"><b>3. Birth Date</b></asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <input type="date" class="form-control" runat="server" id="dtpBdate" autoclose="true" style="z-index: 0; background-color: white;" aria-orientation="horizontal" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="req1" runat="server" ControlToValidate="dtpBdate" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />
                                        </div>

                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="Label22">Birth Place</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtBirthPlace" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label23">Marital Status</asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlCivilStatus">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="req1" runat="server" ControlToValidate="ddlCivilStatus" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />
                                        </div>

                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label24">Religion</asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlReligion">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" CssClass="req1" runat="server" ControlToValidate="ddlReligion" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />
                                        </div>

                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label25">Sex</asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlSex">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" CssClass="req1" runat="server" ControlToValidate="ddlSex" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label2">Contact No.</asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <asp:TextBox runat="server" ID="txtContactNo" MaxLength="11" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="req1" runat="server" ControlToValidate="txtContactNo" SetFocusOnError="true" Font-Italic="true" Font-Bold="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />
                                            <asp:RegularExpressionValidator runat="server" CssClass="req1" ID="RegularExpressionValidator1" ControlToValidate="txtContactNo" Font-Bold="true" Font-Italic="true" Font-Size="10pt" SetFocusOnError="true" ErrorMessage="Only numbers allowed" Display="Dynamic" ValidationExpression="^\d+$" ValidationGroup="DOCAPP1"></asp:RegularExpressionValidator>
                                            <asp:RegularExpressionValidator runat="server" CssClass="req1" ID="RegularExpressionValidator4" ControlToValidate="txtContactNo" Font-Bold="true" Font-Italic="true" Font-Size="10pt" SetFocusOnError="true" ErrorMessage="Invalid Contact no." Display="Dynamic" ValidationExpression="^(?:\d{2}-\d{3}-\d{3}-\d{3}|\d{11})$" ValidationGroup="DOCAPP1"></asp:RegularExpressionValidator>
                                        </div>

                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label3">Email Address</asp:Label>
                                            <%--<span style="color: red; font-size: 20px">*</span>--%>
                                            <asp:TextBox runat="server" ID="txtEmailAdd" CssClass="input-field form-control" Style="text-transform: none;" placeholder=""></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="req1" runat="server" ControlToValidate="txtEmailAdd" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP1" />--%>
                                        </div>

                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label4">Messenger Name</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtMessenger" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>

                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label6">Ethnic-Linguistic Origin</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtEthnic" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label7">Language Spoken</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtLanguage" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>

                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label8">OSCA ID. No.</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtOSCAID" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>

                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label26">GSIS/SSS No.</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtGSISSSS" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>

                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label27">TIN</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtTIN" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>

                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label28">PhilHealth No.</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtPhilhealthNo" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label29">SC Association ID No.</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtSCAssoc" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>

                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label30">Other Gov't ID No.</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtOtherGov" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>

                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label31">Employment/Business</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtEmployment" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>

                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label32">Current Pension</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:TextBox runat="server" ID="txtCurrPension" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>

                                        </div>

                                        <div class="col-md-3 mb-1">
                                            <asp:Label runat="server" ID="Label33">Capability to Travel</asp:Label>
                                            <span style="color: red; font-size: 20px"></span>
                                            <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlCanTravel">
                                                <asp:ListItem Text="YES" Value="Y" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="NO" Value="N"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <%-- </div>--%>

                                    <hr />

                                    <p>
                                        <em><span style="font-weight: 400;">By submitting the data required in this <strong>Senior Citizen Online ID Application</strong></span></em><em><span style="font-weight: 400;">, You CONSENT to the collection, generation, use, processing, storage and retention of your personal information and sensitive personal information by the 
                            <strong>Office of the Senior Citizen's Affairs</strong></span></em><em><span style="font-weight: 400;">&nbsp;for the purpose(s) described in this document. PLEASE ensure that you have completely read and understood&nbsp;
                            </span></em><em><span style="font-weight: 400;"><a runat="server" id="aConsent" href="~/Secured/DPN/DPN.aspx" style="font-weight: bold" target="_blank">the Data Privacy Notice of this data processing system</a></span></em>&nbsp;
                            <em><span style="font-weight: 400;">before submitting. You also authorized the Office to disclose your information to accredited or non-accredited parties.</span></em>

                                    </p>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <asp:CheckBox runat="server" ID="chkdp" Text="&nbsp;I Agree" Style="color: black; font-size: 20px;" AutoPostBack="True" CssClass="badge bg-secondary text-light" />
                                                <button type="button" name="next-step1"
                                                    class="next-step1 btn btn-success" value="Next Step" runat="server" id="btnNextA" validationgroup="DOCAPP1" style="font-weight: bold; font-size: 20px;">
                                                    Next <i class="bi bi-arrow-right-square"></i>
                                                </button>
                                            </div>

                                        </div>
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>



                            <button type="button" name="next-step"
                                class="next-step btn" value="Next Step" runat="server" style="display: none" id="btnNext1">
                            </button>

                            <%-- </div>--%>
                        </fieldset>

                        <%-- STEP 2 --%>
                        <fieldset style="text-align: left;" class="container-fluid" id="field2">
                            <asp:UpdatePanel ID="updatePanel4" runat="server">
                                <ContentTemplate>

                                    <%-- 21. SPOUSE NAME --%>
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label34"><b>21. Name of your spouse</b></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label35">Lastname</asp:Label>
                                            <asp:TextBox runat="server" ID="txtSpouseLName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label36">Firstname</asp:Label>
                                            <asp:TextBox runat="server" ID="txtSpouseFName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label37">Middlename</asp:Label>
                                            <asp:TextBox runat="server" ID="txtSpouseMName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>

                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label38">Name Extension</asp:Label>
                                            <asp:TextBox runat="server" ID="txtSpouseExtName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <%-- 22. FATHER NAME --%>
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label9"><b>22. Name of your Father</b></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label10">Lastname</asp:Label>
                                            <asp:TextBox runat="server" ID="txtFatherLName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label11">Firstname</asp:Label>
                                            <asp:TextBox runat="server" ID="txtFatherFName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label39">Middlename</asp:Label>
                                            <asp:TextBox runat="server" ID="txtFatherMName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>

                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label40">Name Extension</asp:Label>
                                            <asp:TextBox runat="server" ID="txtFatherExtName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <%-- 22. MOTHER NAME --%>
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label41"><b>23. Name of your Mother</b></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label42">Lastname</asp:Label>
                                            <asp:TextBox runat="server" ID="txtMotherLName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-4 mb-1">
                                            <asp:Label runat="server" ID="Label43">Firstname</asp:Label>
                                            <asp:TextBox runat="server" ID="txtMotherFName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label44">Middlename</asp:Label>
                                            <asp:TextBox runat="server" ID="txtMotherMName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>

                                        <div class="col-md-2 mb-1">
                                            <asp:Label runat="server" ID="Label45">Name Extension</asp:Label>
                                            <asp:TextBox runat="server" ID="txtMotherExtName" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <hr />

                                    <%-- 23. CHILDREN NAME --%>
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label46"><b>24. Name of your Child(ren)</b></asp:Label>
                                        </div>
                                    </div>

                                    <div runat="server" id="divChildren" class="container-fluid">

                                        <table class="table" id="tChildren">
                                            <thead>
                                                <tr>
                                                    <th style="width: 30%; text-align: center;">Complete Name</th>
                                                    <th style="width: 20%; text-align: center;">Occupation</th>
                                                    <th style="width: 15%; text-align: center;">Income</th>
                                                    <th style="width: 10%; text-align: center;">Age</th>
                                                    <th style="width: 10%; text-align: center;">Is Working?</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%-- CHILD1 --%>

                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildnamex1" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Child Name"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildoccupationx1" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Occupation"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildincomex1" style="background-color: white;" placeholder="Income" />

                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildagex1" style="background-color: white;" placeholder="Age" />

                                                    </td>

                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="input-field form-select" ID="xchildisworkingx1">
                                                            <%-- <asp:ListItem Text="Select" Value=""></asp:ListItem>--%>
                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                        </asp:DropDownList>

                                                    </td>

                                                </tr>

                                                <%-- CHILD2 --%>

                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildnamex2" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Child Name"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildoccupationx2" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Occupation"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildincomex2" style="background-color: white;" placeholder="Income" />

                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildagex2" style="background-color: white;" placeholder="Age" />

                                                    </td>

                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="input-field form-select" ID="xchildisworkingx2">
                                                            <%-- <asp:ListItem Text="Select" Value=""></asp:ListItem>--%>
                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                        </asp:DropDownList>

                                                    </td>

                                                </tr>


                                                <%-- CHILD3 --%>

                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildnamex3" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Child Name"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildoccupationx3" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Occupation"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildincomex3" style="background-color: white;" placeholder="Income" />

                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildagex3" style="background-color: white;" placeholder="Age" />

                                                    </td>

                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="input-field form-select" ID="xchildisworkingx3">
                                                            <%--   <asp:ListItem Text="Select" Value=""></asp:ListItem>--%>
                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                        </asp:DropDownList>

                                                    </td>

                                                </tr>

                                                <%-- CHILD4 --%>

                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildnamex4" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Child Name"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildoccupationx4" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Occupation"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildincomex4" style="background-color: white;" placeholder="Income" />

                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildagex4" style="background-color: white;" placeholder="Age" />

                                                    </td>

                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="input-field form-select" ID="xchildisworkingx4">
                                                            <%--   <asp:ListItem Text="Select" Value=""></asp:ListItem>--%>
                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                        </asp:DropDownList>

                                                    </td>

                                                </tr>

                                                <%-- CHILD5 --%>

                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildnamex5" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Child Name"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <asp:TextBox runat="server" ID="xchildoccupationx5" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Occupation"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildincomex5" style="background-color: white;" placeholder="Income" />

                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xchildagex5" style="background-color: white;" placeholder="Age" />

                                                    </td>

                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="input-field form-select" ID="xchildisworkingx5">
                                                            <%--<asp:ListItem Text="Select" Value=""></asp:ListItem>--%>
                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                        </asp:DropDownList>

                                                    </td>

                                                </tr>

                                            </tbody>

                                        </table>

                                    </div>

                                    <hr />

                                    <%-- 24. DEPENDENTS --%>
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label47"><b>24.a. Other Dependents</b></asp:Label>
                                        </div>
                                    </div>

                                    <div runat="server" id="divDependents" class="container-fluid">
                                        <table class="table" id="tDependents">
                                            <thead>
                                                <tr>
                                                    <th style="width: 30%; text-align: center;">Complete Name</th>
                                                    <th style="width: 20%; text-align: center;">Occupation</th>
                                                    <th style="width: 15%; text-align: center;">Income</th>
                                                    <th style="width: 10%; text-align: center;">Age</th>
                                                    <th style="width: 10%; text-align: center;">Is Working?</th>

                                                </tr>
                                            </thead>

                                            <tbody>
                                                <%-- DEP1 --%>

                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="xdepnamex1" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Name of Dependent"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <asp:TextBox runat="server" ID="xdepoccupationx1" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Occupation of Dependent"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xdepincomex1" style="background-color: white;" placeholder="Income" />

                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xdepagex1" style="background-color: white;" placeholder="Age" />

                                                    </td>

                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="input-field form-select" ID="xdepisworkingx1">
                                                            <%-- <asp:ListItem Text="Select" Value=""></asp:ListItem>--%>
                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                        </asp:DropDownList>

                                                    </td>

                                                </tr>

                                                <%-- DEP2 --%>

                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="xdepnamex2" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Name of Dependent"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <asp:TextBox runat="server" ID="xdepoccupationx2" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Occupation of Dependent"></asp:TextBox>
                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xdepincomex2" style="background-color: white;" placeholder="Income" />

                                                    </td>

                                                    <td>
                                                        <input type="number" class="form-control" runat="server" id="xdepagex2" style="background-color: white;" placeholder="Age" />

                                                    </td>

                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="input-field form-select" ID="xdepisworkingx2">
                                                            <%--   <asp:ListItem Text="Select" Value=""></asp:ListItem>--%>
                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>

                                                </tr>

                                            </tbody>

                                        </table>
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <hr />
                            <button type="button" name="next-step"
                                class="next-step btn" value="Next Step" runat="server" validationgroup="DOCAPP">
                                Next <i class="bi bi-arrow-right-square"></i></button>

                            <button type="button" name="previous-step"
                                class="previous-step btn"
                                value="Previous Step">
                               <i class="bi bi-arrow-left-square"> </i> Previous</button>

                        </fieldset>

                        <%-- STEP 3 DEPENDENCY PROFILE--%>
                        <fieldset style="text-align: left;" class="container-fluid" id="field3">
                            <asp:UpdatePanel ID="updatePanel2" runat="server">
                                <ContentTemplate>

                                    <div class="row">

                                        <div class="col-md-6 mb-1">
                                            <%-- 25. LIVING CONDITION A--%>
                                            <div class="row">
                                                <div class="col-md-12 mb-1">
                                                    <asp:Label runat="server" ID="Label12"><b>25. Living/Residing with</b></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:GridView runat="server" ID="_gvLivingConditionA" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                        GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                        <Columns>
                                                            <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                                    <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>


                                        </div>


                                        <div class="col-md-6 mb-1">

                                            <%-- 26. LIVING CONDITION B --%>
                                            <div class="row">
                                                <div class="col-md-12 mb-1">
                                                    <asp:Label runat="server" ID="Label13"><b>25. Household Condition</b></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:GridView runat="server" ID="_gvLivingConditionB" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                        GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                        <Columns>
                                                            <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                                    <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>


                                        </div>
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <button type="button" name="next-step"
                                class="next-step btn" value="Next Step">
                                Next <i class="bi bi-arrow-right-square"></i></button>

                            <button type="button" name="previous-step"
                                class="previous-step btn"
                                value="Previous Step">
                                <i class="bi bi-arrow-left-square"></i>  Previous</button>
                        </fieldset>


                        <%-- STEP 4 EDUCATION / HR PROFILE --%>
                        <fieldset style="text-align: left;" class="container-fluid" id="field4">

                            <div class="row">

                                <%-- 25. LIVING CONDITION A--%>

                                <div class="col-md-4 mb-1">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label15"><b>27. Highest Educational Attainment</b></asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <%-- <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlEducAttainment"></asp:DropDownList>--%>
                                            <asp:RadioButtonList runat="server" ID="rblEducAttainment" CssClass="form-control" RepeatDirection="Vertical"></asp:RadioButtonList>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlEducAttainment" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP" />--%>
                                        </div>
                                    </div>



                                </div>
                                <div class="col-md-4 mb-1">

                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label14"><b>28. Specialization / Technical Skills</b></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <asp:GridView runat="server" ID="_gvSkills" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>


                                </div>

                                <div class="col-md-4 mb-1">

                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label48"><b>29. Shared Skills</b></asp:Label>
                                            <asp:TextBox runat="server" ID="txtSharedSkills" TextMode="MultiLine" Rows="5" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Type Skills here separated by comma."></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label49"><b>30. Involvement in Community Activities</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvCommunity" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>

                                            </asp:GridView>

                                        </div>


                                    </div>

                                </div>
                            </div>

                            <button type="button" name="next-step"
                                class="next-step btn" value="Next Step">
                                Next <i class="bi bi-arrow-right-square"></i></button>
                            <button type="button" name="previous-step"
                                class="previous-step btn"
                                value="Previous Step">
                                <i class="bi bi-arrow-left-square"></i>  Previous</button>
                        </fieldset>

                        <%-- STEP 5 ECONOMIC PROFILE --%>
                        <fieldset style="text-align: left;" class="container-fluid" id="field5">

                            <div class="row">
                                <div class="col-md-4 mb-1">
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label50"><b>31. Source of Income and Assistance</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvSourceIncome" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">


                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 mb-1">
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label51"><b>32.A Assets: Real and Immovable Properties</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvAssetA" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 mb-1">
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label52"><b>32.B Assets: Personal and Movable Properties</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvAssetB" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-1">
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label53"><b>33. Monthly Income</b></asp:Label>
                                            <asp:RadioButtonList runat="server" ID="rblMonthlyIncome" CssClass="form-control" RepeatDirection="Vertical"></asp:RadioButtonList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 mb-1">
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <asp:Label runat="server" ID="Label54"><b>34. Problems / Needs Commonly Encountered</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvPNC" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>

                                            </asp:GridView>

                                        </div>
                                    </div>

                                </div>
                            </div>

                            <button type="button" name="next-step"
                                class="next-step btn" value="Next Step">
                                Next <i class="bi bi-arrow-right-square"></i></button>
                            <button type="button" name="previous-step"
                                class="previous-step btn"
                                value="Previous Step">
                                <i class="bi bi-arrow-left-square"></i> Previous</button>
                        </fieldset>

                        <%-- STEP 6 HEALTH PROFILE--%>
                        <fieldset style="text-align: left;" class="container-fluid" id="field6">

                            <div class="row">
                                <div class="col-md-4 mb-1">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label55"><b>35.A Medical Concern</b></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label56">Blood Type</asp:Label>
                                            <span style="color: red; font-size: 20px">*</span>
                                            <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlBloodType"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="req6" runat="server" ControlToValidate="ddlBloodType" SetFocusOnError="true" Font-Bold="true" Font-Size="13pt" Display="Dynamic" Text="*" ValidationGroup="DOCAPP2" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label59">Physical Disability</asp:Label>
                                            <asp:TextBox runat="server" ID="txtPhysicalDis" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder="Physical Disability type here"></asp:TextBox>
                                        </div>
                                    </div>

                                    <hr />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label60">Health Problems / Ailments</asp:Label>

                                            <asp:GridView runat="server" ID="_gvHealth" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>


                                </div>

                                <div class="col-md-4 mb-1">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label57"><b>35.B Dental Concern</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvDental" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label61"><b>35.C Visual Concern</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvVisual" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label62"><b>35.D Aural/Hearing Condition</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvAural" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-md-4 mb-1">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label58"><b>35.E Social / Emotional</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvSocial" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="left">
                                                                <ItemTemplate>
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label runat="server" ID="Label63"><b>35.F Area of Difficulty</b></asp:Label>

                                            <asp:GridView runat="server" ID="_gvDifficulty" HeaderStyle-Font-Size="12px" CssClass="table table-borderless" PageSize="15"
                                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" AllowSorting="false"
                                                GridLines="None" Font-Names="Arial" Font-Size="14px" ForeColor="#000000" AllowPaging="False" EmptyDataText="NO LIST" ShowHeader="false">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="100%" ItemStyle-HorizontalAlign="left">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelect" Text='<%# Eval("description")%>' CssClass="" Checked='<%# Eval("isSelected")%>' transId='<%# Eval("trans_id")%>' isSpecific='<%# Eval("is_specific")%>' />
                                                            <asp:TextBox runat="server" ID="txtOtherDescription" CssClass="form-control" Width="100%" data-toggle="tooltip" data-placement="top" title="OTHER DESCRIPTION" trigger="hover" Font-Size="14px" Style="text-transform: uppercase" Visible='<%# Eval("is_specific")%>' Text='<%# Eval("other_description")%>' placeholder="Others, Specify"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <asp:Label runat="server" ID="Label64"><b>36. List of Medicines for Maintenance</b></asp:Label>
                                    <asp:TextBox runat="server" ID="txtMedicineMaintenance" TextMode="MultiLine" Rows="5" CssClass="input-field form-control" Style="text-transform: uppercase" placeholder=""></asp:TextBox>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <asp:Label runat="server" ID="Label65"><b>37. Do you have a scheduled medical/physical check-up?</b></asp:Label>
                                    <asp:RadioButtonList runat="server" ID="rblIsScheduledCheckup" CssClass="form-control" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="&nbsp;Yes&nbsp;&nbsp;" Value="Y" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="&nbsp;No" Value="N"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                                <div class="col-md-6 mb-1">
                                    <asp:Label runat="server" ID="Label66"><b>37.A If Yes, when is it done?</b></asp:Label>
                                    <asp:DropDownList runat="server" CssClass="input-field form-select" ID="ddlCheckUpSchedule">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <button type="button" name="next-step"
                                class="next-step btn" value="Next Step" runat="server">
                                Next <i class="bi bi-arrow-right-square"></i></button>

                            <button type="button" name="previous-step"
                                class="previous-step btn"
                                value="Previous Step">
                                <i class="bi bi-arrow-left-square"></i> Previous</button>
                        </fieldset>

                        <%-- STEP 7 --%>
                        <fieldset style="text-align: left; z-index: 2;" id="field7">

                            <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                <ContentTemplate>
                                    <%--<asp:Button runat="server" ID="btnAddAttachment" class="btn btn-info " Text="Add Attachment" />--%>

                                    <%-- LIST OF ATTACHMENTS --%>

                                    <button type="button" runat="server" id="btnFillGVAttach" style="z-index: 1; display: none;"></button>

                                    <asp:GridView runat="server" ID="_gvRequiredDocs" HeaderStyle-Font-Size="14px" CssClass="table table-bordered table-hover" PageSize="15"
                                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">

                                        <Columns>
                                            <asp:BoundField DataField="req_display" HeaderText="Attachments" HeaderStyle-Width="40%" ItemStyle-Font-Size="20px" />

                                            <asp:BoundField DataField="file_name" HeaderText="File Name" HeaderStyle-Width="40%" ItemStyle-Font-Size="20px" />

                                            <%--   <asp:TemplateField HeaderText="Signature Specimen" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Image runat="server" ImageUrl='<%#Bind("document_data")%>' ID="imgSignatory" Height="100px" Width="150px" Visible="true" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>

                                         <%--   <asp:TemplateField HeaderText="Action" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="btnViewAttach" CommandArgument='<%# Bind("trans_id")%>' OnCommand="cmdGVView" class="btn btn-success mb-2" Text="View Attachment" Visible='<%# Eval("hasFile")%>' />
                                                    <asp:Button runat="server" ID="btnUpload" CommandArgument='<%# Bind("req_code")%>' OnCommand="cmdGVUpload" class="btn btn-info mb-2" Text="Upload Attachment" docDesc='<%# Eval("req_desc")%>' Visible='<%# IIf(Eval("hasFile") = "TRUE", "FALSE", "TRUE")%>' />
                                                    <br />
                                                    <asp:Button runat="server" ID="btnRemove" CommandArgument='<%# Bind("req_code")%>' OnCommand="cmdGVRemove" class="btn btn-danger mb-2" Text="Remove Attachment" Visible='<%# Eval("hasFile")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>

                                            <%-- <asp:TemplateField HeaderText="Preview" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Download" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" ID="lnkGVP2" OnCommand="cmdGVDownload" ImageUrl="~/images/filedl24.png"
                                                        CommandArgument='<%# bind("trans_id")%>' Text="Preview" ToolTip="Click to Download Document"
                                                        CausesValidation="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" ID="lnkGVP3" OnCommand="cmdGVDelete" ImageUrl="~/images/filedel24.png"
                                                        CommandArgument='<%# bind("trans_id")%>' Text="Delete" ToolTip="Click to Delete Document"
                                                        CausesValidation="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        </Columns>
                                    </asp:GridView>

                                    <br />

                                    <button type="button" runat="server" id="btnSaveApp" class="btn-submit btn">Submit</button>
                                    <button type="button" runat="server" id="btnContinueLater" class="btn btn-info float-start" style="color: black; font-weight: bold;"><i class="fa-regular fa-floppy-disk"></i>&nbsp;Continue Later</button>
                                </ContentTemplate>
                            </asp:UpdatePanel>


                            <button type="button" name="previous-step"
                                class="previous-step btn"
                                value="Previous Step">
                                 <i class="bi bi-arrow-left-square"></i>Previous</button>

                        </fieldset>

                    </div>

                </div>

            </div>

        </div>

        <hr />
        <div class="footer mt-auto">
            <div class="container" align="center">
                <div class="row">
                    <div class="col-md-6">
                        <div class="logo">
                            <div class="row">
                                <div class="col-sm-4" style="padding-right: 0px; padding-left: 0px;">
                                    <a href="/">
                                        <img height="70" src="Scripts/landing/assets/img/risev2.png" class="rise-logo">
                                    </a>
                                </div>
                                <div class="col-sm-4" style="padding-right: 0px; padding-left: 0px;">
                                    <a href="https://cagayandeoro.gov.ph/" target="_blank" class="btn btn-outline-warning links"><span class="lnks">Visit Official Page </span></a>
                                </div>
                                <div class="col-sm-4" style="padding-right: 0px; padding-left: 0px;">
                                    <a href="https://cagayandeoro.gov.ph/index.php/news/the-city-mayor/rise1.html" target="_blank" class="btn btn-outline-primary links"><span class="lnks">Learn RISE Platform </span></a>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="logo">
                            <div class="row">
                                <div class="col-md-10" style="padding-right: 0px; padding-left: 0px;">
                                    <span style="font-size: 12px; color: black">Powered by: City Management Information Systems and Innovation Department</span>
                                </div>
                                <div class="col-md-2" style="padding-right: 0px; padding-left: 0px;">
                                    <a href="/">
                                        <img height="60" src="Scripts/landing/assets/img/ICTLogo.png" class="ict-logo">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- MODALS --%>

        <%-- VIEW UPLOAD --%>

        <asp:UpdatePanel ID="updatePanel7" runat="server">
            <ContentTemplate>
                <div id="mdlViewUpload" role="dialog" class="modal fade" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                    <div class="modal-dialog modal-xl">

                        <!-- Modal content-->
                        <div class="modal-content" runat="server" id="divMdlPreviewSize">
                            <div class="modal-header" style="text-align: center; font-weight: bold; font-size: large; color: black" runat="server" id="div1">
                                <asp:Label runat="server" ID="lblMsgBoxHeader" Text="Document"></asp:Label>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                <%-- <span class="glyphicon glyphicon-alt-list"></span>--%>
                            </div>

                            <div class="modal-body">
                                <div align="center">
                                    <asp:Literal ID="ltEmbedPreview" runat="server" />
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" id="Button2" runat="server" class="btn btn-danger " data-bs-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>&nbsp;Close</button>
                            </div>
                        </div>

                    </div>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>


        <%-- UPLOAD FILE --%>
        <div runat="server" tabindex="-1" id="mdlUpload" class="modal fade" aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="true" style="z-index: 10;">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header bg-info">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                            <ContentTemplate>
                                <h5><span class="glyphicon glyphicon-upload badge rounded-pill bg-light text-dark" runat="server" id="spanUploadHeaderText"></span></h5>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <button runat="server" id="btnUploadClose" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body bg-light bg-opacity-50">


                        <div class="row">

                            <div class="col-md-12">
                                <span class="input-group-addon">Browse File for Upload :</span>
                                <%--<input id="" type="file" class="file" data-preview-file-type="text" />--%>
                                <input runat="server" id="fuRequirements" name="input-b1" type="file" class="file" data-browse-on-zone-click="true" data-show-upload="false" />
                                <%-- <asp:FileUpload runat="server" ID="fuRequirements" name="input-b1" CssClass="file" data-browse-on-zone-click="true" data-show-upload="false" />--%>
                                <asp:RegularExpressionValidator ID="revFileUpload" runat="server" ControlToValidate="fuRequirements"
                                    ErrorMessage="Image Files Only" ValidationExpression="^.*\.(jpg|JPG|png|PNG|bmp|BMP|jpeg)$"
                                    ForeColor="Red" Style="font-weight: 100" ValidationGroup="DOCUPLOAD"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" CssClass="reqVal" runat="server" ControlToValidate="fuRequirements" SetFocusOnError="true" Font-Bold="true" Font-Size="10pt" Display="Dynamic" Font-Italic="true" Text="Select document to upload" ValidationGroup="DOCUPLOAD" />
                            </div>

                        </div>

                        <div class="row">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel8">
                                <ContentTemplate>
                                    <div class="col-md-12">
                                        <asp:Button runat="server" CssClass="btnUpload btn btn-info btn-lg" ID="btnUpload" Text="Upload" ValidationGroup="DOCUPLOAD" OnClientClick="uploadFile()" />
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                </div>

            </div>

        </div>


        <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
        <%-- <script src="Scripts/myJS/myJs.js"></script>--%>
        <script src="Scripts/myJS/stepsJs.js"></script>
        <%-- <script src="Scripts/jquery-1.12.4.min.js"></script>--%>
        <script src="Scripts/block/blockui.js"></script>

        <script src="https://kit.fontawesome.com/9cfc2a3b54.js" crossorigin="anonymous"></script>


        <script>
            $(document).ready(function () {
                $("#fuRequirements").fileinput({
                    theme: "bs5",
                    showPreview: false,
                    showUpload: false,
                    allowedFileExtensions: ["jpg", "png", "jpeg"]
                });
            });
        </script>

        <asp:UpdatePanel runat="server" ID="upUpdate">
            <ContentTemplate>
                <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
                <asp:HiddenField runat="server" ID="hfDocType"></asp:HiddenField>
                <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <%--  <asp:UpdatePanel runat="server" ID="UpdatePanel9">
            <ContentTemplate>--%>
        <div id="domMessage" style="display: none; z-index: 999;">
            <div id="loader"></div>
        </div>
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </form>
</body>
</html>
