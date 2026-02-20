<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AppUpcoming.aspx.vb"
    Inherits="Secured_Applicant_AppUpcoming" MasterPageFile="~/MasterPage/Applicant.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <!-- UPCOMING TRAININGS -->
    <div class="section-title">LIST OF UPCOMING TRAININGS</div>

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
                        <asp:BoundField HeaderText="VENUE" DataField="training_venue" />
                        <asp:BoundField HeaderText="STATUS" DataField="application_status" />

                        <asp:TemplateField HeaderText="ACTION">
                            <ItemTemplate>
                                <asp:Button
                                    runat="server"
                                    Text="View"
                                    ID="btnRegister" CommandArgument='<%# Bind("trans_id")%>'
                                    CssClass="btn btn-sm btn-green" OnCommand="cmdGVView"
                                    trainingDate='<%# Eval("training_date")%>'
                                    title='<%# Eval("training_title")%>'
                                    description='<%# Eval("training_desc")%>'
                                    venue='<%# Eval("training_venue")%>'
                                    availableSlots='<%# Eval("availableSlots")%>'
                                    otherDetails='<%# Eval("other_details")%>'
                                    ToolTip="Click to View" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div id="mdlView" role="dialog" class="modal fade" aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <asp:UpdatePanel runat="server" ID="UpdatePanel9">
                    <ContentTemplate>

                        <div class="modal-header bg-success-subtle">
                            <h5 class="modal-title text-dark" runat="server" id="lblReturnHeaderText">Training Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body bg-light">
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <span class="form-label fw-bold text-dark">Training Date: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblTrainingDate"></asp:Label>
                                </div>

                                <div class="col-md-6 mb-1">
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
                                    <span class="fw-bold text-dark">Venue: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblVenue"></asp:Label>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <span class="fw-bold text-dark">Other Details (Links & Credentials): </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblOtherDescription"></asp:Label>
                                </div>

                            </div>

                        </div>

                        <div class="modal-footer">

                            <%--<button type="button" class="btn btn-primary" runat="server" id="btn">Confirm</button>--%>
                            <button type="button" class="btn btn-success" runat="server" id="btnCloseView" data-bs-dismiss="modal">Close</button>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <asp:UpdatePanel runat="server" ID="upUpdate">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfApplicantId"></asp:HiddenField>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
