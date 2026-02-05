<%@ Page Title="SCID" Language="VB" AutoEventWireup="false" CodeFile="TrainingsAdd.aspx.vb"
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
                                    <div class="col-lg-3">
                                        <div class="input-group">
                                            <label class="input-group-text">Training Date</label>
                                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpTrainingDate" />
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
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtTrainingTitle" />
                                        </div>
                                    </div>


                                </div>

                                <div class="row mb-2">
                                    <div class="col-lg-4">
                                        <div class="input-group">
                                            <label class="input-group-text">No. of Slots</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtTrainingSlots" TextMode="Number" MaxLength="3" />
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="input-group">
                                            <label class="input-group-text">Description</label>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtDescription" />
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

                                <asp:Button runat="server" Text="Save Training" class="btn btn-success" ID="btnSaveTraining" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>
            </div>

            <div class="card" runat="server" id="divAttendees">
                <div class="card-header bg-success text-light">
                    <span runat="server" id="span1" style="font-weight: bold;">Registered Attendees</span>
                    <button runat="server" class="btn btn-success" id="btnPrintAttendance"><i class="bi bi-printer-fill"></i>&nbsp;</button>

                </div>
                <div class="card-body" style="padding-bottom: 5px;">

                    <asp:GridView runat="server" ID="_gvAttendees" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table-bordered table-success table-striped table-hover" PageSize="15" EmptyDataText="NO RECORD FOUND"
                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">
                        <Columns>

                            <asp:BoundField DataField="lname" HeaderText="Last Name" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:MMM dd, yyyy}" />
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


            <div class="card" runat="server" id="divApplicants">
                <div class="card-header bg-warning text-light">
                    <span runat="server" id="span2" style="font-weight: bold;">Training Applicants</span>
                </div>
                <div class="card-body" style="padding-bottom: 5px;">

                    <asp:GridView runat="server" ID="_gvApplicants" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table-bordered table-success table-striped table-hover" PageSize="15" EmptyDataText="NO RECORD FOUND"
                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="true">
                        <Columns>

                            <asp:BoundField DataField="lname" HeaderText="Last Name" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:MMM dd, yyyy}" />
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
    <asp:UpdatePanel ID="updatePanel3" runat="server">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
