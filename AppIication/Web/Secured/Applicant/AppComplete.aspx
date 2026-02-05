<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AppComplete.aspx.vb" Inherits="Secured_Applicant_AppComplete" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Dashboard</title>
    <link href="../../Scripts/NiceAdmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Scripts/mycss/Applicant.css" rel="stylesheet" />

</head>

<body>

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="container-fluid mt-3">
            <div class="d-flex">

                <!-- LEFT SIDEBAR -->
                <div class="sidebar me-4">
                    <asp:Button runat="server" Text="DASHBOARD" ID="btnDashboard" CssClass="btn btn-green w-100" />
                    <asp:Button runat="server" Text="COMPLETED TRAININGS" ID="btnComplete" CssClass="btn btn-outline-success w-100" />
                    <asp:Button runat="server" Text="UPCOMING TRAININGS" ID="btnUpcoming" CssClass="btn btn-green w-100" />
                </div>

                <!-- MAIN CONTENT -->
                <div class="flex-fill">

                    <!-- TOP RIGHT PROFILE -->
                    <div class="text-end mb-3">
                        <a href="#" class="text-decoration-none text-muted">PROFILE</a>
                    </div>

                    <!-- AVAILABLE TRAININGS -->
                    <div class="section-title">LIST OF COMPLETED TRAININGS</div>

                    <div class="table-responsive border rounded p-2">
                        <asp:GridView
                            runat="server" ID="_gvTraining"
                            CssClass="table table-borderless align-middle"
                            AutoGenerateColumns="False" EmptyDataText="NO TRAINING AVAILABLE">

                            <Columns>
                                <asp:BoundField HeaderText="TRAINING DATE" DataField="training_date" />
                                <asp:BoundField HeaderText="TRAINING TITLE" DataField="training_title" />
                                <asp:BoundField HeaderText="DESCRIPTION" DataField="training_desc" />
                               
                                <asp:TemplateField HeaderText="ACTION">
                                    <ItemTemplate>
                                        <asp:Button
                                            runat="server"
                                            Text="VIEW"
                                            CssClass="btn btn-sm btn-green" trainingId='<%# Eval("trans_id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>

        <asp:UpdatePanel runat="server" ID="upUpdate">
            <ContentTemplate>
                <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>

</body>
</html>
