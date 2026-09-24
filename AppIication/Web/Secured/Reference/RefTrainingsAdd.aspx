<%@ Page Title="Trainings" Language="VB" AutoEventWireup="false" CodeFile="RefTrainingsAdd.aspx.vb"
    Inherits="Secured_Reference_RefTrainingsAdd" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <div class="card">
        <asp:UpdatePanel ID="updatePanel2" runat="server">
            <ContentTemplate>

                <%-- HEADER --%>
                <div class="card-header border-bottom d-flex align-items-center justify-content-between px-3 py-2"
                    style="background: #2e8b5a">
                    <button runat="server" id="btnHome"
                        class="btn btn-sm fw-semibold d-flex align-items-center gap-1"
                        style="background: rgba(255,255,255,0.15); color: #fff; border: 1.5px solid rgba(255,255,255,0.3); font-size: 12px">
                        <i class="bi bi-chevron-double-left"></i>Back
                    </button>

                    <div class="d-flex align-items-center gap-2">
                        <i class="bi bi-journal-text text-white" style="font-size: 16px"></i>
                        <h5 class="fw-bold text-white mb-0"
                            style="font-size: 15px; letter-spacing: .04em">Training Title Details
                        </h5>
                    </div>

                    <%-- Spacer to balance the back button --%>
                    <div style="width: 70px"></div>
                </div>

                <%-- BODY --%>
                <div class="card-body p-3">
                    <div class="card border rounded-3 shadow-none">
                        <div class="card-header bg-white border-bottom d-flex align-items-center gap-2 py-2 px-3">
                            <i class="bi bi-info-circle text-secondary"></i>
                            <span class="fw-semibold text-uppercase text-secondary"
                                style="font-size: 11px; letter-spacing: .06em">Training Information
                            </span>
                        </div>
                        <div class="card-body p-3">
                            <div class="row g-3">

                                <%-- Training Title --%>
                                <div class="col-12">
                                    <label class="form-label fw-semibold mb-1"
                                        style="font-size: 13px; color: #1a4a2e">
                                        Training Title <span class="text-danger">*</span>
                                    </label>
                                    <asp:TextBox runat="server" ID="txtTrainingTitle"
                                        CssClass="form-control" TextMode="MultiLine" Rows="2"
                                        placeholder="Enter training title"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                        ControlToValidate="txtTrainingTitle" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Title is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Description --%>
                                <div class="col-12">
                                    <label class="form-label fw-semibold mb-1"
                                        style="font-size: 13px; color: #1a4a2e">
                                        Description <span class="text-danger">*</span>
                                    </label>
                                    <asp:TextBox runat="server" ID="txtDescription"
                                        CssClass="form-control" TextMode="MultiLine" Rows="2"
                                        placeholder="Enter description"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txtDescription" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Description is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Learning Mode --%>
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold mb-1"
                                        style="font-size: 13px; color: #1a4a2e">
                                        Learning Mode <span class="text-danger">*</span>
                                    </label>
                                    <asp:DropDownList runat="server" ID="ddlPreferredMode"
                                        CssClass="form-select">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="ddlPreferredMode" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Mode is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Learning Tracks --%>
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold mb-1"
                                        style="font-size: 13px; color: #1a4a2e">
                                        Learning Tracks <span class="text-danger">*</span>
                                    </label>
                                    <asp:DropDownList runat="server" ID="ddlLearningTracks"
                                        CssClass="form-select"
                                        AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="ddlLearningTracks" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Tracks is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Learning Tracks Other --%>
                                <div runat="server" id="divTracksOther" class="col-12">
                                    <label class="form-label fw-semibold mb-1"
                                        style="font-size: 13px; color: #1a4a2e">
                                        Learning Tracks — Other (specify)
                                    </label>
                                    <asp:TextBox runat="server" ID="txtLearningTracksOther"
                                        CssClass="form-control"
                                        placeholder="Please specify"></asp:TextBox>
                                </div>

                                <%-- Training Program Fee --%>
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold mb-1"
                                        style="font-size: 13px; color: #1a4a2e">
                                        Training Program Fee <span class="text-danger">*</span>
                                    </label>
                                    <asp:DropDownList runat="server" ID="ddlTrainingProgFee"
                                        CssClass="form-select"
                                        AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="ddlTrainingProgFee" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Training Program Fee is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Registration Fee --%>
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold mb-1"
                                        style="font-size: 13px; color: #1a4a2e">
                                        Registration Fee
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text"
                                            style="background: #cdf9df; color: #2e8b5a; border-color: #a8f0c4; font-weight: 600">₱
                                        </span>
                                        <asp:TextBox runat="server" ID="txtRegistrationFee"
                                            CssClass="form-control text-end"
                                            TextMode="Number"
                                            min="0.00" max="999999.99"
                                            MaxLength="9" step="any"
                                            Style="background-color: #f8f9fa"
                                            ReadOnly="true"
                                            required="required"
                                            placeholder="0.00"></asp:TextBox>
                                    </div>
                                </div>

                                <%-- Is Active --%>
                                <div class="col-12">
                                    <label class="form-label fw-semibold mb-2"
                                        style="font-size: 13px; color: #1a4a2e">
                                        Is Active?
                                    </label>
                                    <asp:RadioButtonList runat="server" ID="rblIsactive"
                                        RepeatDirection="Horizontal"
                                        RepeatLayout="Flow" CssClass="form-control"
                                        Style="font-size: 13px; color: #1a4a2e; display: flex; gap: .5rem; align-items: center">
                                        <asp:ListItem Text="&nbsp;Yes" Value="Y" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="&nbsp;No" Value="N"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                            </div>
                        </div>

                        <%-- FOOTER --%>
                        <div class="card-footer bg-white border-top d-flex justify-content-end gap-2 px-3 py-2">
                            <asp:Button runat="server" ID="btnSave"
                                Text="Save"
                                CssClass="btn btn-sm fw-semibold text-white px-4"
                                Style="background: #2e8b5a; border-color: #2e8b5a"
                                ValidationGroup="DOC" />
                        </div>

                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>


    <asp:UpdatePanel ID="updatePanel3" runat="server">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
