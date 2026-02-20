<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" 
    Inherits="_Login" MasterPageFile="~/MasterPage/Public.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
       
      <section class="page1">
            <div class="container">
                <div class="college"><b>CITY COLLEGE</b></div>
                <div class="empower">EMPOWER YOUR FUTURE</div>

                <div class="highlight mb-2">SEMINAR</div>
                <div class="cont mb-3"><span style="color: #e5b417;">CONTINUING </span><span>PROFESSIONAL</span> <span style="color: black;">DEVELOPMENT</span></div>
                <div class="sub mb-2">TRAINING</div>
            </div>
        </section>

        <!-- LOGIN --> 
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                
                <div class="login-box text-center">
                     <a runat="server" id="aForgotP" href="#" style="font-size: 14px;text-decoration:underline;color:blue;">Forgot password? Click Here</a>
                    <div class="mb-3">
                        <asp:TextBox runat="server" CssClass="form-control" Placeholder="username" ID="txtUserName" />
                    </div>
                    <div class="mb-3">
                        <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" Placeholder="password" ID="txtPassword" />
                    </div>

                    <asp:Button runat="server" Text="LOGIN" class="btn btn-green px-5" ID="btnLogin" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>


    <%--FORGOT PASSWORD--%>
        <div id="mdlForgotPassword" role="dialog" class="modal fade" data-bs-backdrop="false" data-bs-keyboard="false" style="z-index: 10">
            <div class="modal-dialog modal-md">
                <!-- Modal content-->
                <div class="modal-content">
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
                                            <asp:TextBox runat="server" ID="txtVerLName" CssClass="form-control mb-3"  placeholder="Last Name"  ValidationGroup="CEL"></asp:TextBox>

                                             </div>

                                                <div class="col-md-12 mb-2">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVerFName" SetFocusOnError="true" Font-Bold="false" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="First Name is Required" ValidationGroup="CEL" />
                                           <asp:TextBox runat="server" ID="txtVerFName" CssClass="form-control mb-3"  placeholder="First Name"  ValidationGroup="CEL"></asp:TextBox>

                                             </div>

                                              <div class="col-md-12 mb-2">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVerEmail" SetFocusOnError="true" Font-Bold="false" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Email Address is Required" ValidationGroup="CEL" />
                                           <asp:TextBox runat="server" ID="txtVerEmail" TextMode="Email" CssClass="form-control mb-3"  placeholder="Email Address"  ValidationGroup="CEL"></asp:TextBox>

                                             </div>
                                          
                                            <button runat="server" id="btnVerifyCel" type="button" class="btn btn-primary mb-3" validationgroup="CEL">Verify User <i class="bi bi-arrow-right"></i></button>
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
                                            <asp:TextBox runat="server" ID="txtPinCode" CssClass="form-control mb-3" TextMode="Number" MaxLength="6" placeholder="Payslip PIN" lenght="6" ValidationGroup="PIN"></asp:TextBox>
                                            <button runat="server" id="btnVerify" type="button" class="btn btn-primary mb-3" validationgroup="PIN">Verify PIN <i class="bi bi-arrow-right"></i></button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 mb-2">
                                        <div runat="server" id="pnlPassword">
                                            <asp:TextBox runat="server" ID="txtRegPasword" CssClass="form-control mb-3" TextMode="Password" placeholder="Payslip Password*"></asp:TextBox>
                                            <asp:TextBox runat="server" ID="txtRetypeRegPasword" CssClass="form-control mb-3" TextMode="Password" placeholder="Confirm Password*"></asp:TextBox>
                                            <button runat="server" id="btnRegister" type="button" class="btn btn-primary mb-3">SUBMIT <i class="bi bi-arrow-right"></i></button>
                                        </div>
                                    </div>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="modal-footer ">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <%--   <asp:Button runat="server" ID="btnSaveMC" class="btn btn-success pull-right" Text="Save" ValidationGroup="DOC" CausesValidation="false" />
                                    <asp:Button runat="server" ID="btnSaveMCAll" class="btn btn-success pull-right" Text="Save to all" ValidationGroup="DOC" CausesValidation="false" />--%>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--FORGOT PASSWORD END--%>


        <asp:UpdatePanel runat="server" ID="upUpdate">
            <ContentTemplate>
                 <asp:HiddenField runat="server" ID="hfUserId"></asp:HiddenField>
                <asp:HiddenField runat="server" ID="hfEmailAdd"></asp:HiddenField>
                <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

