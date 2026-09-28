<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb"
    Inherits="_Login" MasterPageFile="~/MasterPage/Public.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <section class="login-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 col-xl-8">
                    <div class="card login-shell border-0 shadow-lg rounded-4 overflow-hidden">
                        <div class="row g-0 align-items-stretch">

                            <!-- BRAND PANEL -->
                            <div class="col-lg-5 login-brand d-flex flex-column align-items-center justify-content-center text-center text-white p-4 p-lg-5">
                                <div class="brand-logos brand-logos-themed justify-content-center mb-3">
                                    <img src="<%=ResolveClientUrl("~/Images/CDOSeal.png")%>" alt="City of Cagayan de Oro Seal" class="brand-logo" />
                                    <img src="<%=ResolveClientUrl("~/Images/RISE.png")%>" alt="RISE Cagayan de Oro" class="brand-logo brand-logo-wide" />
                                </div>
                                <div class="college-mini fw-bold mb-2">CITY COLLEGE</div>
                                <div class="empower-mini mb-3">EMPOWER YOUR FUTURE</div>
                                <span class="badge rounded-pill badge-gold mb-3">SEMINAR</span>
                                <p class="mb-0 small opacity-75">
                                    <span class="text-warning-em fw-bold">Continuing</span> Professional Development Training
                                </p>
                            </div>

                            <!-- LOGIN PANEL -->
                            <div class="col-lg-7">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                    <ContentTemplate>

                                        <div class="login-box text-center p-4 p-md-5">

                                            <div class="login-icon mb-3">
                                                <i class="bi bi-person-circle"></i>
                                            </div>
                                            <h4 class="fw-bold text-success mb-1">SIGN IN</h4>
                                            <p class="text-secondary mb-4">Access your CPD training account</p>

                                            <div class="input-group mb-3">
                                                <span class="input-group-text bg-light"><i class="bi bi-person-fill"></i></span>
                                                <asp:TextBox runat="server" CssClass="form-control" Placeholder="username" ID="txtUserName" onkeyup="clickEnterSearch('ctl00_cpConTent_btnLogin');" />
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text bg-light"><i class="bi bi-lock-fill"></i></span>
                                                <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" Placeholder="password" ID="txtPassword" onkeyup="clickEnterSearch('ctl00_cpConTent_btnLogin');" />
                                            </div>

                                            <div runat="server" id="divLoginError" visible="false" class="mb-3">
                                                <label class="form-check-label text-danger small">Invalid username/password!</label>
                                            </div>

                                            <asp:Button runat="server" Text="LOGIN" class="btn btn-green w-100 mb-3 rounded-pill" ID="btnLogin" />
                                            <a runat="server" id="aForgotP" class="small text-success" href="#">Forgot password?</a>

                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%--FORGOT PASSWORD--%>
    <div id="mdlForgotPassword" role="dialog" class="modal fade" data-bs-backdrop="false" data-bs-keyboard="false">
        <div class="modal-dialog modal-md">
            <!-- Modal content-->
            <div class="modal-content border-0 shadow-lg rounded-4 overflow-hidden">
                <div class="modal-header bg-success" style="text-align: center">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Label runat="server" ID="lblFP" Text="Retrieve Account" CssClass="badge text-light" Font-Size="Large" ForeColor="Yellow"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="padding: 10px 10px;">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div runat="server" id="pnlContact">
                                        <h4>Verify User Details</h4>

                                        <div class="col-md-12 mb-2">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtVerLName" SetFocusOnError="true" Font-Bold="false" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Last Name is Required" ValidationGroup="CEL" />
                                            <asp:TextBox runat="server" ID="txtVerLName" CssClass="form-control mb-3" placeholder="Last Name" ValidationGroup="CEL"></asp:TextBox>

                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVerFName" SetFocusOnError="true" Font-Bold="false" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="First Name is Required" ValidationGroup="CEL" />
                                            <asp:TextBox runat="server" ID="txtVerFName" CssClass="form-control mb-3" placeholder="First Name" ValidationGroup="CEL"></asp:TextBox>

                                        </div>--%>

                                        <div class="col-md-12 mb-2">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVerEmail" SetFocusOnError="true" Font-Bold="false" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Email Address is Required" ValidationGroup="CEL" />
                                            <asp:TextBox runat="server" ID="txtVerEmail" TextMode="Email" CssClass="form-control mb-3" placeholder="Email Address" ValidationGroup="CEL"></asp:TextBox>

                                        </div>

                                        <button runat="server" id="btnVerifyCel" type="button" class="btn btn-green mb-3" validationgroup="CEL">Verify User <i class="bi bi-arrow-right"></i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div runat="server" id="pnlPin">
                                        <h4>Verification Code</h4>
                                        <p>
                                            Please type the verification code sent to
                                                <asp:Label runat="server" ID="lblPinContact" Font-Italic="true"></asp:Label>
                                        </p>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPinCode" SetFocusOnError="true" Font-Bold="false" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Code is Required" ValidationGroup="PIN" />
                                        <asp:TextBox runat="server" ID="txtPinCode" CssClass="form-control mb-3" TextMode="Number" MaxLength="6" placeholder="PIN" lenght="6" ValidationGroup="PIN"></asp:TextBox>
                                        <button runat="server" id="btnVerify" type="button" class="btn btn-green mb-3" validationgroup="PIN">Verify PIN <i class="bi bi-arrow-right"></i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div runat="server" id="pnlPassword">

                                        <div runat="server" id="divFPSet">
                                            <div class="password-container">
                                                <asp:TextBox runat="server" ID="txtRegPasword" CssClass="form-control mb-3" TextMode="Password" placeholder="New Password*"
                                                    onkeyup="validatePassword(this.id,'fpLength','fpUppercase','fpNumber','fpSpecial')"
                                                    onfocus="showTooltip('fpTooltip')"
                                                    onblur="hideTooltip(this.id,'fpTooltip')"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txtRetypeRegPasword" CssClass="form-control mb-3" TextMode="Password" placeholder="Confirm Password*"></asp:TextBox>

                                                <!-- Tooltip -->
                                                <div id="fpTooltip" class="password-tooltip">
                                                    <p id="fpLength" class="invalid">• At least 8 characters</p>
                                                    <p id="fpUppercase" class="invalid">• 1 uppercase letter</p>
                                                    <p id="fpNumber" class="invalid">• 1 number</p>
                                                    <p id="fpSpecial" class="invalid">• 1 special character</p>
                                                </div>
                                            </div>

                                        </div>

                                        <button runat="server" id="btnRegister" type="button" class="btn btn-green mb-3">SUBMIT <i class="bi bi-arrow-right"></i></button>
                                    </div>
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="modal-footer ">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                   <asp:Button runat="server" ID="btnSaveMC" class="btn btn-success pull-right" Text="Save" ValidationGroup="DOC" CausesValidation="false" />
                                    <asp:Button runat="server" ID="btnSaveMCAll" class="btn btn-success pull-right" Text="Save to all" ValidationGroup="DOC" CausesValidation="false" />--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--FORGOT PASSWORD END--%>

    <div id="mdlChangePassword" role="dialog" class="modal fade" data-bs-backdrop="false" data-bs-keyboard="false" style="background: #ffffff; background: linear-gradient(90deg,rgba(255, 255, 255, 1) 0%, rgba(240, 255, 240, .9) 100%);">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <!-- Modal content-->
            <div class="modal-content border-0 shadow-lg rounded-4 overflow-hidden">
                <div class="modal-header bg-warning" style="text-align: center">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Label runat="server" ID="Label1" Text="Change Password To continue" CssClass="badge text-dark" Font-Size="Large" ForeColor="Yellow"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="padding: 10px 10px;">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div runat="server" id="divCPPin">
                                        <h4>Verification Code</h4>
                                        <p>
                                            Please type the verification code sent to
                                                <asp:Label runat="server" ID="lblCPContact" Font-Italic="true"></asp:Label>
                                        </p>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCPPin" SetFocusOnError="true" Font-Bold="false" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Code is Required" ValidationGroup="CPPIN" />
                                        <asp:TextBox runat="server" ID="txtCPPin" CssClass="form-control mb-3" TextMode="Number" MaxLength="6" placeholder="PIN" lenght="6" ValidationGroup="PIN"></asp:TextBox>
                                        <button runat="server" id="btnCPVerPin" type="button" class="btn btn-green mb-3" validationgroup="CPPIN">Verify PIN <i class="bi bi-arrow-right"></i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div runat="server" id="divCPSet">
                                        <div class="password-container">

                                            <asp:TextBox runat="server" ID="txtCPassword" CssClass="form-control mb-3" TextMode="Password" placeholder="New Password*"
                                                onkeyup="validatePassword(this.id,'length','uppercase','number','special')"
                                                onfocus="showTooltip('passwordTooltip')"
                                                onblur="hideTooltip(this.id,'passwordTooltip')"></asp:TextBox>

                                            <asp:TextBox runat="server" ID="txtCRetypePassword" CssClass="form-control mb-1" TextMode="Password" placeholder="Confirm Password*"></asp:TextBox>

                                            <!-- Tooltip -->
                                            <div id="passwordTooltip" class="password-tooltip">
                                                <p id="length" class="invalid">• At least 8 characters</p>
                                                <p id="uppercase" class="invalid">• 1 uppercase letter</p>
                                                <p id="number" class="invalid">• 1 number</p>
                                                <p id="special" class="invalid">• 1 special character</p>
                                            </div>
                                        </div>

                                        <button runat="server" id="btnSavePassword" type="button" class="btn btn-green mb-3">Submit <i class="bi bi-arrow-right"></i></button>
                                        <button type="button" class="btn btn-danger mb-3" runat="server" id="btnCPClose" data-bs-dismiss="modal">Cancel</button>
                                    </div>
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>
    </div>


    <asp:UpdatePanel runat="server" ID="upUpdate">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfUserId"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfUserName"></asp:HiddenField>
             <asp:HiddenField runat="server" ID="hfCPassword"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfEmailAdd"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

