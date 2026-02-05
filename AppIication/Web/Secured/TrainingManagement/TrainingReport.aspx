<%@ Page Title="SCID" Language="VB" AutoEventWireup="false" CodeFile="TrainingReport.aspx.vb"
    Inherits="Secured_TrainingManagement_TrainingReport" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <div class="container-fluid mt-3">
            <div class="d-flex">

                <!-- MAIN CONTENT -->
                <div class="flex-fill">

                    <!-- TOP RIGHT PROFILE -->
                    <div class="text-end mb-3">
                        <a href="AppProfile.aspx" class="text-decoration-none text-muted">PROFILE</a>
                    </div>

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
                        <asp:GridView
                            runat="server" ID="_gvTraining"
                            CssClass="table table-borderless align-middle"
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
                                            CssClass="btn btn-sm btn-green" trainingId='<%# Eval("trans_id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>


</asp:Content>
