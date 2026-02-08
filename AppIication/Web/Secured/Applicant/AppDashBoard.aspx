<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AppDashBoard.aspx.vb"
    Inherits="Secured_Applicant_AppDashBoard" MasterPageFile="~/MasterPage/Applicant.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <!-- SUMMARY CARDS -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card-summary">
                <center> UPCOMING TRAININGS <br />
                                         <span runat="server" id="spanUpcomingCount">0</span></center>
            </div>

        </div>
        <div class="col-md-4">
            <div class="card-summary">
                <center>COMPLETED TRAININGS<br />
                                    <span runat="server" id="spanCompleted">0</span></center>
            </div>
        </div>
    </div>

    <!-- AVAILABLE TRAININGS -->
    <div class="section-title">AVAILABLE TRAININGS</div>

    <div class="table-responsive border rounded p-2">
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <asp:GridView
                    runat="server" ID="_gvTraining"
                    CssClass="table table-bordered align-middle"
                    AutoGenerateColumns="False" EmptyDataText="NO TRAINING AVAILABLE">

                    <Columns>
                        <asp:BoundField HeaderText="TRAINING DATE" DataField="training_date" />
                        <asp:BoundField HeaderText="TRAINING TITLE" DataField="training_title" />
                        <asp:BoundField HeaderText="DESCRIPTION" DataField="training_desc" />
                        <asp:BoundField HeaderText="AVAILABLE SLOTS" DataField="availableSlots" />

                        <asp:TemplateField HeaderText="ACTION">
                            <ItemTemplate>

                                <asp:Button
                                    runat="server"
                                    Text="Register"
                                    ID="btnRegister" CommandArgument='<%# Bind("trans_id")%>'
                                    CssClass="btn btn-sm btn-green" OnCommand="cmdGVRegister"
                                    trainingDate='<%# Eval("training_date")%>'
                                    title='<%# Eval("training_title")%>'
                                    description='<%# Eval("training_desc")%>'
                                    availableSlots='<%# Eval("availableSlots")%>'
                                    ToolTip="Click to Register" />

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <asp:UpdatePanel runat="server" ID="upUpdate">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfApplicantId"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfTrainingId"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
