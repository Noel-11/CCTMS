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
                                    otherDetails='<%# Eval("other_details")%>'
                                    registrationFee='<%# Eval("registration_fee")%>'
                                    ToolTip="Click to Register" />

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>


    <div id="mdlView" role="dialog" class="modal fade"  aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <asp:UpdatePanel runat="server" ID="UpdatePanel9">
                    <ContentTemplate>

                        <div class="modal-header bg-success-subtle">
                            <h5 class="modal-title text-dark" runat="server" id="lblReturnHeaderText">Training Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body bg-light">
                            <div class="row">
                                <div class="col-md-4 mb-1">
                                    <span class="form-label fw-bold text-dark">Training Date: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblTrainingDate"></asp:Label>
                                </div>

                                <div class="col-md-4 mb-1">
                                    <span class="fw-bold text-dark">Training Title: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblTrainingTitle"></asp:Label>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <span class="fw-bold text-dark">Description: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblDescription"></asp:Label>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <span class="fw-bold text-dark">Other Details (Links & Credentials): </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblOtherDescription"></asp:Label>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <span class="fw-bold text-dark">Available Slots: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblTrainingSlots"></asp:Label>
                                </div>

                                <div class="col-md-6 mb-1">
                                    <span class="fw-bold text-dark">Registration Fee: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblTrainingFee"></asp:Label>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">
                             <button type="button" class="btn btn-success" runat="server" id="btnApply">Apply</button>
                            <button type="button" class="btn btn-danger" runat="server" id="btnCloseView" data-bs-dismiss="modal">Close</button>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

        <!-- Modal PRINT REPORT-->

    <div id="mdlPrintReport" role="dialog" class="modal fade" data-bs-backdrop="false" data-bs-keyboard="false">
        <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <asp:UpdatePanel ID="updatePanel6" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <span class="glyphicon glyphicon-alt-list"></span>
                            <asp:Label runat="server" ID="lblReportHeadName" Style="font-size: 20px" Text="Billing"></asp:Label>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <asp:Literal ID="ltEmbed" runat="server" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="Button4" runat="server" class="btn btn-danger " data-bs-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>&nbsp;Close</button>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>

    </div>

    <asp:UpdatePanel runat="server" ID="upUpdate">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfApplicantId"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfTrainingId"></asp:HiddenField>
             <asp:HiddenField runat="server" ID="hfTrainingFee"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
