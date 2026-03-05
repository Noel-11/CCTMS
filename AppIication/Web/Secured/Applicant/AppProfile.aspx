<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AppProfile.aspx.vb"
    Inherits="Secured_Applicant_AppProfile" MasterPageFile="~/MasterPage/Applicant.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <div class="container-fluid my-4">

        <%-- <div class="container">
            <div class="empower text-light" style="font-size: 25px;">CITY COLLEGE ONLINE TRAINING REGISTRATION</div>
        </div>--%>

        <div class="card shadow-sm">
            <div class="card-body">

                <div class="row" runat="server" id="divPersonal">
                    <!-- PERSONAL INFORMATION -->
                    <h6 class="border-bottom pb-2 mb-3 fw-bold">PERSONAL INFORMATION</h6>

                    <div class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Last Name<span class="text-danger">*</span></label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtLName" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtLName" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">First Name</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtFName" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
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
                            <label class="form-label">Gender<span class="text-danger">*</span></label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlGender">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlGender" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Civil Status<span class="text-danger">*</span></label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlCivilStatus">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCivilStatus" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Contact No.<span class="text-danger">*</span></label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtContactNo" MaxLength="11" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtContactNo" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="txtContactNo" Font-Bold="true" Font-Italic="true" Font-Size="10pt" SetFocusOnError="true" ErrorMessage="Only numbers allowed" Display="Dynamic" ValidationExpression="^\d+$" ValidationGroup="DOC"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ControlToValidate="txtContactNo" Font-Bold="true" Font-Italic="true" Font-Size="10pt" SetFocusOnError="true" ErrorMessage="Invalid Contact no." Display="Dynamic" ValidationExpression="^(?:\d{2}-\d{3}-\d{3}-\d{3}|\d{11})$" ValidationGroup="DOC"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Email Address<span class="text-danger">*</span></label>
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="txtEmail" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>
                    </div>
                </div>

                <div class="row" runat="server" id="divInstitution">
                    <div class="col-lg-12">
                        <h6 class="border-bottom pb-2 mb-3 fw-bold">INSTITUTION INFORMATION</h6>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Institution Name<span class="text-danger">*</span></label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtInstitutionName" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtInstitutionName" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                            </div>

                            <div class="col-md-3">
                                <label class="form-label">Contact No.<span class="text-danger">*</span></label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtInstContact" MaxLength="11" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtInstContact" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ControlToValidate="txtInstContact" Font-Bold="true" Font-Italic="true" Font-Size="10pt" SetFocusOnError="true" ErrorMessage="Only numbers allowed" Display="Dynamic" ValidationExpression="^\d+$" ValidationGroup="DOC"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="txtInstContact" Font-Bold="true" Font-Italic="true" Font-Size="10pt" SetFocusOnError="true" ErrorMessage="Invalid Contact no." Display="Dynamic" ValidationExpression="^(?:\d{2}-\d{3}-\d{3}-\d{3}|\d{11})$" ValidationGroup="DOC"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Email Address<span class="text-danger">*</span></label>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="Email" ID="txtInstEmail" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtInstEmail" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                            </div>

                        </div>

                    </div>
                </div>

                <div class="row g-3 mt-2">
                    <div class="col-md-6">
                        <label class="form-label">Home Address<span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtHomeAddr" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtHomeAddr" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">City / Province</label>
                        <asp:DropDownList runat="server" CssClass="form-select" ID="ddlCityAddr">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row" runat="server" id="divProfession">

                    <!-- PROFESSION -->
                    <h6 class="border-bottom pb-2 mt-4 fw-bold">PROFESSION / OCCUPATION</h6>

                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label">Profession / Occupation<span class="text-danger">*</span></label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtProfession" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtProfession" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Highest Educational Attainment</label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="dllEducation">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Position / Job Title<span class="text-danger">*</span></label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPosition" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPosition" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>
                    </div>

                    <div class="row g-3 mt-2">
                        <div class="col-md-4">
                            <label class="form-label">Current Workplace / Affiliation</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtWorkPlace" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">PRC License Number<span class="text-danger">*</span></label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPRCNo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPRCNo" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">License Expiration Date<span class="text-danger">*</span></label>
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpPRCExpiration" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="dtpPRCExpiration" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>
                    </div>

                </div>

                <div class="row" runat="server" id="divPreferences">

                    <!-- TRAINING -->
                    <h6 class="border-bottom pb-2 mt-4 fw-bold">TRAINING & SEMINAR PREFERENCES</h6>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Preferred Learning Tracks</label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="dllPreferredTracks" Visible="false">
                            </asp:DropDownList>

                            <asp:GridView runat="server" ID="_gvLearnTracks" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table-bordered" PageSize="15"
                                EmptyDataText="NO RECORD FOUND"
                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                                <Columns>

                                    <asp:TemplateField HeaderText="Sel" HeaderStyle-Width="1%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:CheckBox runat="server" ID="chkSelect" listId='<%# Eval("trans_id")%>' Checked='<%# Eval("isChecked")%>' />

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sel" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>

                                            <asp:Label runat="server" ID="lblDescription" Text='<%# Eval("description")%>' Font-Bold="true"></asp:Label>
                                            <asp:TextBox runat="server" ID="txtOthers" Visible='<%# Eval("isOther")%>' Width="100%"></asp:TextBox>

                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>
                            </asp:GridView>

                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Preferred Learning Mode<span class="text-danger">*</span></label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlPreferredMode">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlPreferredMode" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>
                    </div>

                    <div class="row g-3 mt-2">
                        <div class="col-md-6">
                            <label class="form-label">Preferred Schedule<span class="text-danger">*</span></label>
                            <asp:DropDownList runat="server" CssClass="form-select" ID="ddlPreferredSched">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlPreferredSched" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Specific Topic of Interest</label>
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" ID="txtSpecificTopic" />
                        </div>
                    </div>

                    <!-- ADMIN -->
                    <h6 class="border-bottom pb-2 mt-4 fw-bold">ADMINISTRATIVE TRACKING</h6>

                    <div class="mb-3">
                        <label class="form-label">How did you hear about our programs?<span class="text-danger">*</span></label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlHear">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlHear" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="*" ValidationGroup="DOC" />
                    </div>

                </div>

                <div class="text-center mt-4">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                        <ContentTemplate>
                            <asp:Button runat="server" Text="Save" CssClass="btn btn-success px-5" ID="btnSaveRegistration" ValidationGroup="DOC" />
                            <asp:Button runat="server" Text="Change Password" CssClass="btn btn-warning px-5" ID="btnChangePassword" CausesValidation="false" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>
        </div>
    </div>

    <%--MODAL PASSWORD --%>
    <div class="modal fade" id="mdlPassword" aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">

                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <div class="modal-header bg-warning text-dark" style="text-align: center;">
                            <asp:Label runat="server" ID="Label8" Style="font-size: 20px;" Text="CHANGE PASSWORD"></asp:Label>
                            <button type="button" id="btnMdlStatusClose" class="btn-close text-light" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">


                            <div class="row" runat="server" id="pnlPin">
                                <div class="col-md-12 mb-2">
                                    <div>
                                        <h3>Verification Code</h3>
                                        <p>
                                            Please type the verification code sent to
                                                <asp:Label runat="server" ID="lblPinContact"></asp:Label>
                                        </p>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtPinCode" SetFocusOnError="true" Font-Bold="false" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Code is Required" ValidationGroup="PIN" />
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtPinCode" CssClass="form-control mb-3" TextMode="Number" MaxLength="6" placeholder="Payslip PIN" lenght="6" ValidationGroup="PIN"></asp:TextBox>
                                            <span class="input-group-btn border-secondary" style="background-color: white; color: black">
                                                <button runat="server" id="btnVerify" type="button" class="btn btn-primary mb-3" validationgroup="PIN">Verify <i class="bi bi-arrow-right"></i></button>
                                            </span>

                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <asp:TextBox runat="server" ID="txtCurrentPassword" CssClass="form-control mb-3" TextMode="Password" placeholder="Current Password*"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div runat="server" id="pnlPassword">
                                        <asp:TextBox runat="server" ID="txtRegPasword" CssClass="form-control mb-3" TextMode="Password" placeholder="Password*"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txtRetypeRegPasword" CssClass="form-control mb-3" TextMode="Password" placeholder="Confirm Password*"></asp:TextBox>
                                        <%--<button runat="server" id="btnRegister" type="button" class="btn btn-primary mb-3">SUBMIT <i class="bi bi-arrow-right"></i></button>--%>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" runat="server" class="btn btn-success btn-lg mb-2" id="btnSavePassword" validationgroup="SubmitStatus">Save</button>
                            <button type="button" runat="server" class="btn btn-danger btn-lg mb-2" id="btnCPClose" data-bs-dismiss="modal">Cancel</button>

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>

    </div>


    <asp:UpdatePanel runat="server" ID="upUpdate">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfCpNewPw"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
