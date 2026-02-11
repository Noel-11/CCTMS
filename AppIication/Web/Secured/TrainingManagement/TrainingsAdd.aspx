<%@ Page Title="Trainings" Language="VB" AutoEventWireup="false" CodeFile="TrainingsAdd.aspx.vb"
    Inherits="Secured_TrainingManagement_TrainingsAdd" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-lg-4">
                    <button runat="server" id="btnHome" class="btn btn-primary"><i class="bi bi-chevron-double-left"></i>&nbsp;Back</button>
                </div>
                <div class="col-lg-4">

                    <h2 class="text-success">Training Programs Details</h2>
                </div>

            </div>

        </div>

        <div class="card-body" style="padding-bottom: 0px;">

            <div class="container">
                <div class="card" runat="server" id="divTrainingInfo">
                    <div class="card-header bg-success text-light">
                        <span runat="server" id="spanTainingHead" style="font-weight: bold;">TRAINING INFO</span>
                    </div>
                    <div class="card-body" style="padding-bottom: 5px;">
                        <asp:UpdatePanel ID="updatePanel1" runat="server">
                            <ContentTemplate>
                                <br />
                                <div class="row mb-2">
                                    <div class="col-lg-4">
                                        <div class="input-group">
                                            <label class="input-group-text">Training Date</label>
                                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpTrainingDate" required />
                                        </div>
                                    </div>

                                    <%--<div class="col-lg-3">
                                     <div class="input-group">
                                    <label class="input-group-text">Training Time</label>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpTrainingTime" />
                                    </div>
                                     </div>--%>

                                    <div class="col-lg-6">
                                        <div class="input-group">
                                            <label class="input-group-text">Training Title</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtTrainingTitle" required />
                                        </div>
                                    </div>

                                </div>

                                <div class="row mb-2">

                                    <div class="col-lg-12">
                                        <div class="input-group">
                                            <label class="input-group-text">Description</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtDescription" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">

                                    <div class="col-lg-4">
                                        <div class="input-group">
                                            <label class="input-group-text">No. of Slots</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtTrainingSlots" TextMode="Number" MaxLength="3" required />
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="input-group">
                                            <label class="input-group-text">Registration Fee</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtRegistrationFee" TextMode="Number" min="0.00" max="999999.99" MaxLength="9" step="any" Style="text-align: right" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">

                                    <div class="col-lg-12">
                                        <div class="input-group">
                                            <label class="input-group-text">Links and Other Details</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtOtherDetails" Rows="3" TextMode="MultiLine" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <asp:Button runat="server" Text="Save Training" class="btn btn-success" ID="btnSaveTraining" />
                                        <asp:Button runat="server" Text="Check Attendance" class="btn btn-info" ID="btnCheckAttendance" />
                                    </div>

                                    <div class="col-lg-8">
                                        <div class="float-end">
                                            <span class="text-success" runat="server" id="lblTrainingStatus" style="font-size: 11px; font-weight: bold;"></span>
                                            <asp:Button runat="server" Text="Status" class="btn btn-warning" ID="btnStatus" />
                                        </div>

                                    </div>

                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>
            </div>

            <div class="card" runat="server" id="divAttendees">
                <asp:UpdatePanel ID="updatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="card-header bg-success text-light">
                            <span runat="server" id="span1" style="font-weight: bold;">Registered Attendees</span>
                            <button runat="server" class="btn btn-warning" id="btnPrintAttendance" tooltip="Click to Print Attendance"><i class="bi bi-printer-fill"></i>&nbsp;</button>

                        </div>
                        <div class="card-body" style="padding-bottom: 5px;">

                            <asp:GridView runat="server" ID="_gvAttendees" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table-bordered table-success table-striped table-hover" PageSize="15" EmptyDataText="NO RECORD FOUND"
                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">
                                <Columns>

                                    <asp:BoundField DataField="lname" HeaderText="Last Name" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="fname" HeaderText="First Name" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="mname" HeaderText="Middle Name" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="contact_no" HeaderText="Contact No." ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="email_add" HeaderText="Email Address" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="prc_no" HeaderText="PRC ID #" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="prc_expiration" HeaderText="PRC Expiration Date" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />
                                     <asp:BoundField DataField="is_present" HeaderText="IsPresent" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="CENTER" />

                                </Columns>
                            </asp:GridView>

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="card" runat="server" id="divApplicants">
                <div class="card-header bg-warning text-dark">
                    <span runat="server" id="span2" style="font-weight: bold;">Training Applicants</span>
                </div>
                <div class="card-body" style="padding-bottom: 5px;">

                    <asp:GridView runat="server" ID="_gvApplicants" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table-bordered table-success table-striped table-hover" PageSize="15" EmptyDataText="NO RECORD FOUND"
                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">
                        <Columns>

                            <asp:BoundField DataField="lname" HeaderText="Last Name" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="fname" HeaderText="First Name" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="mname" HeaderText="Middle Name" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="contact_no" HeaderText="Contact No." ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="email_add" HeaderText="Email Address" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="prc_no" HeaderText="PRC ID #" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="left" />
                            <asp:BoundField DataField="prc_expiration" HeaderText="PRC Expiration Date" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />

                        </Columns>
                    </asp:GridView>

                </div>

            </div>

        </div>

    </div>

    <%-- CHECK ATTENDANCE --%>
    <div id="mdlCheckAttendance" role="dialog" class="modal fade" aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                    <ContentTemplate>
                        <div class="modal-header bg-success">
                            <h5 class="modal-title text-light" runat="server" id="H1">Training Check Attendance</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body bg-light">
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <span class="form-label fw-bold text-dark">Training Date: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblCheckTrainingDate"></asp:Label>
                                </div>

                                <div class="col-md-6 mb-1">
                                    <span class="fw-bold text-dark">Training Title: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblCheckTrainingTitle"></asp:Label>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <span class="fw-bold text-dark">Current Status: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblCheckStatus"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <span class="fw-bold text-dark">Remarks: </span>
                                    <asp:Label runat="server" CssClass="form-control text-dark" Style="background-color: white" ID="lblCheckRemarks"></asp:Label>
                                </div>
                            </div>

                            <hr />
                            <span>Attendance List</span>
                            <asp:GridView runat="server" ID="_gvCheckAttendance" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table-bordered table-striped table-hover" PageSize="15" EmptyDataText="NO RECORD"
                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                                <Columns>

                                    <asp:TemplateField HeaderText="Present" HeaderStyle-Width="3%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                           
                                            <asp:CheckBox runat="server" transId ='<%# Eval("trans_id")%>' ID="chkAtt" ToolTip="Check if Present" Checked='<%# Eval("isAttendanceChecked")%>' />

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="applicantName" HeaderText="Name" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="contact_no" HeaderText="Contact No." ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="email_add" HeaderText="Email Address" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="prc_no" HeaderText="PRC ID #" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="left" />
                                    <asp:BoundField DataField="prc_expiration" HeaderText="PRC Expiration Date" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />

                                </Columns>
                            </asp:GridView>

                             <div class="row">
                                <div class="col-lg-g">
                                    <button runat="server" class="btn btn-success" id="btnSaveCheckAttendance" tooltip="Click to Save"><i class=""></i>&nbsp;Save Attendance</button>
                                </div>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" runat="server" id="Button2" data-bs-dismiss="modal">Close</button>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- MODAL TRAINING STATUS-->
    <div id="mdlStatus" role="dialog" class="modal fade" aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <asp:UpdatePanel runat="server" ID="UpdatePanel9">
                    <ContentTemplate>

                        <div class="modal-header bg-success">
                            <h5 class="modal-title text-light" runat="server" id="lblReturnHeaderText">Training Status</h5>
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
                                <div class="col-md-6 mb-1">
                                    <span class="fw-bold text-dark">Status: </span>
                                    <asp:DropDownList runat="server" ID="ddlTrainingStatus" CssClass="form-select" ValidationGroup="DOCSTATUS"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <span class="fw-bold text-dark">Remarks: </span>
                                    <asp:TextBox runat="server" ID="txtStatusRemarks" CssClass="form-control" TextMode="MultiLine" Rows="3" ValidationGroup="DOCSTATUS"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-g">
                                    <button runat="server" class="btn btn-success" id="btnSaveStatus" tooltip="Click to Save" validationgroup="DOCSTATUS"><i class="bi bi-printer-fill"></i>&nbsp;Save Status</button>
                                </div>
                            </div>

                            <hr />
                            <span>Status List</span>
                            <asp:GridView runat="server" ID="_gvStatus" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table-bordered table-striped table-hover" PageSize="15" EmptyDataText="NO RECORD"
                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                                <Columns>

                                    <asp:BoundField DataField="counter" HeaderText="#" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="reg_status" HeaderText="Status" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="remarks" HeaderText="Remarks" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="last_user" HeaderText="User" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="last_date" HeaderText="User" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />

                                </Columns>
                            </asp:GridView>

                        </div>

                        <div class="modal-footer">
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
                            <asp:Label runat="server" ID="lblReportHeadName" Style="font-size: 20px" Text="Attendance"></asp:Label>
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

    <asp:UpdatePanel ID="updatePanel3" runat="server">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
