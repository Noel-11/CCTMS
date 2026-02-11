<%@ Page Title="Trainings" Language="VB" AutoEventWireup="false" CodeFile="RegistrationReport.aspx.vb"
    Inherits="Secured_TrainingManagement_RegistrationReport" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <div class="card">

        <div class="card-header">
            <div class="row">
                <div class="col-lg-4">
                    <%--<button runat="server" class="btn btn-success" id="btnAdd"><i class="bi bi-plus-square"></i>&nbsp;Add New Training</button>--%>
                </div>
                <div class="col-lg-4">

                    <h2 class="text-success">Report: Registration List</h2>
                </div>

            </div>

        </div>

        <div class="card-body" style="padding-bottom: 0px;">
            <asp:UpdatePanel ID="updatePanel5" runat="server">
                <ContentTemplate>

                    <div class="row mt-1">
                        <div class="col-md-4 mb-1">
                            <div class="input-group">
                                <span runat="server" id="Span1" class="input-group-text border-secondary" style="background-color: white; color: black">Date From</span>
                                <asp:TextBox runat="server" ID="dtpDateFrom" CssClass="input-field form-control border-secondary" Style="text-transform: uppercase" placeholder="" TextMode="Date"></asp:TextBox>
                                <span runat="server" id="Span2" class="input-group-text border-secondary" style="background-color: white; color: black">To</span>
                                <asp:TextBox runat="server" ID="dtpDateTo" CssClass="input-field form-control border-secondary" Style="text-transform: uppercase" placeholder="" TextMode="Date"></asp:TextBox>

                            </div>

                        </div>

                        <div class="col-md-4 mb-1">
                            <div class="input-group">
                                <span runat="server" id="Span4" class="input-group-text border-secondary bg-success text-light">Learning Tracks</span>
                                <asp:DropDownList runat="server" ID="ddlLearningTracks" CssClass="form-select border-secondary"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-4 mb-1">
                            <div class="input-group">
                                <span runat="server" id="Span5" class="input-group-text border-secondary bg-success text-light">Preferred Schedule</span>
                                <asp:DropDownList runat="server" ID="ddlPreferredSched" CssClass="form-select border-secondary"></asp:DropDownList>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-4 mb-1">
                            <div class="input-group">
                                <span runat="server" id="Span6" class="input-group-text border-secondary bg-success text-light">Gender</span>
                                <asp:DropDownList runat="server" ID="ddlGender" CssClass="form-select border-secondary"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-4 mb-1">
                            <div class="input-group mb-1">
                                <span runat="server" id="Span3" class="input-group-text border-secondary bg-success text-light">Learning Mode</span>
                                <asp:DropDownList runat="server" ID="ddlLearningMode" CssClass="form-select border-secondary"></asp:DropDownList>

                            </div>
                        </div>

                        <div class="col-md-4 mb-1">

                            <button runat="server" class="btn btn-success" id="btnSearch"><i class="bi bi-funnel"></i>&nbsp;Filter</button>
                            <button runat="server" class="btn btn-info" id="btnPrint"><i class="bi bi-printer"></i>&nbsp;Filter</button>
                            <span class="text-dark" style="background-color: white; color: black">
                                <asp:Label runat="server" ID="lblPaging" CssClass="pull-right "></asp:Label></span>
                        </div>
                    </div>

                    <asp:GridView runat="server" ID="_gv" HeaderStyle-Font-Size="14px" CssClass="table table-bordered table-success-subtle table-striped table-hover" PageSize="15" EmptyDataText="NO RECORD FOUND"
                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                        <Columns>

                            <asp:BoundField DataField="lname" HeaderText="LAST NAME" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="fname" HeaderText="FIRST NAME" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="mname" HeaderText="MIDDLE NAME" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="gender" HeaderText="GENDER" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="contact_no" HeaderText="CONTACT NO." ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="email_add" HeaderText="EMAIL ADDRESS" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="profession" HeaderText="PROFESSION" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="prc_no" HeaderText="LICENSE NUMBER" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="prc_expiration" HeaderText="EXPIRATION DATE" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="learningTracks" HeaderText="LEARNING TRACKS" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="learningMode" HeaderText="LEARNING MODE" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="preferredSched" HeaderText="PREFERRED SCHEDULE" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Left" />
                        </Columns>
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>


    <!-- Modal PRINT REPORT-->

    <div id="mdlPrintReport" role="dialog" class="modal fade" data-bs-backdrop="false" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl">

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

</asp:Content>
