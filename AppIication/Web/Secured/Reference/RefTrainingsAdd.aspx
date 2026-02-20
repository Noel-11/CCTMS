<%@ Page Title="Trainings" Language="VB" AutoEventWireup="false" CodeFile="RefTrainingsAdd.aspx.vb"
    Inherits="Secured_Reference_RefTrainingsAdd" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <div class="card">
        <asp:UpdatePanel ID="updatePanel2" runat="server">
            <ContentTemplate>
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-4">
                            <button runat="server" id="btnHome" class="btn btn-primary"><i class="bi bi-chevron-double-left"></i>&nbsp;Back</button>
                        </div>
                        <div class="col-lg-4">

                            <h2 class="text-success">Training Title Details</h2>
                        </div>

                    </div>

                </div>

                <div class="card-body" style="padding-bottom: 0px;">
                    <div class="container">

                        <br />
                        <div class="row mb-1">

                            <div class="col-lg-12">
                                <div class="input-group">
                                    <label class="input-group-text">Training Title</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtTrainingTitle" />

                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtTrainingTitle" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Title required" ValidationGroup="DOC" />

                            </div>

                        </div>

                        <div class="row mb-1">

                            <div class="col-lg-12">
                                <div class="input-group">
                                    <label class="input-group-text">Description</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtDescription" />
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Description required" ValidationGroup="DOC" />
                            </div>
                        </div>

                        <div class="row mb-1">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <label class="input-group-text">Learning Mode</label>
                                    <asp:DropDownList runat="server" CssClass="form-select" ID="ddlPreferredMode">
                                    </asp:DropDownList>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlPreferredMode" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Mode is required" ValidationGroup="DOC" />
                            </div>
                        </div>

                        <div class="row mb-1">
                            <div class="col-lg-12">
                                <div class="input-group">
                                    <label class="input-group-text">Learning Tracks</label>
                                    <asp:DropDownList runat="server" CssClass="form-select" ID="ddlLearningTracks" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlLearningTracks" SetFocusOnError="true" Font-Italic="true" Font-Size="10pt" Display="Dynamic" Text="Tracks is required" ValidationGroup="DOC" />
                            </div>
                        </div>

                        <div runat="server" id="divTracksOther" class="row mb-1">

                            <div class="col-lg-12">
                                <div class="input-group">
                                    <label class="input-group-text">Learning Tracks Other(Specify)</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtLearningTracksOther" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb-3">
                                 <div class="input-group">
                                     <label class="input-group-text">Is Active?</label>
                                     <asp:RadioButtonList runat="server" ID="rblIsactive" CssClass="form-control " RepeatDirection="Horizontal">
                                    <asp:ListItem Text="&nbsp;Yes&nbsp;&nbsp;&nbsp;" Value="Y" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="&nbsp;No" Value="N"></asp:ListItem>
                                </asp:RadioButtonList>
                                 </div>
                               
                            </div>
                        </div>

                        <div class="card-footer">
                            <asp:Button runat="server" Text="Save" class="btn btn-success" ID="btnSave" ValidationGroup="DOC" />
                            <%--<asp:Button runat="server" Text="Cance" class="btn btn-success" ID="Button1" ValidationGroup="DOC" />--%>
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
