<%@ Page Title="Trainings" Language="VB" AutoEventWireup="false" CodeFile="TrainingReport.aspx.vb"
    Inherits="Secured_TrainingManagement_TrainingReport" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <div class="card">

        <div class="card-header">
            <div class="row">

                <div class="col-lg-4">
                    <%--<button runat="server" class="btn btn-success" id="btnAdd"><i class="bi bi-plus-square"></i>&nbsp;Add New Training</button>--%>
                </div>

                <div class="col-lg-4">
                      
                   <h2 class="text-success">Report: Training List</h2>
              </div>

            </div>

        </div>

        <div class="card-body" style="padding-bottom: 0px;">
            <asp:UpdatePanel ID="updatePanel5" runat="server">
                <ContentTemplate>

                    <div class="row mt-1">
                        <div class="col-md-6 mb-1">
                            <div class="input-group mb-2">
                                 <span runat="server" id="Span1" class="input-group-text border-secondary bg-success text-light">Date From</span>
                                 <asp:TextBox runat="server" ID="dtpDateFrom" CssClass="input-field form-control border-secondary" Style="text-transform: uppercase" placeholder="" TextMode="Date"></asp:TextBox>
                                 <span runat="server" id="Span2" class="input-group-text border-secondary bg-success text-light">To</span>
                                 <asp:TextBox runat="server" ID="dtpDateTo" CssClass="input-field form-control border-secondary" Style="text-transform: uppercase" placeholder="" TextMode="Date"></asp:TextBox>
                                  
                            </div>

                        </div>

                        <div class="col-md-6 mb-1">
                            <div class="input-group mb-1">
                                <span runat="server" id="Span3" class="input-group-text border-secondary bg-success text-light">Status</span>
                                 <asp:DropDownList runat="server" ID="ddlTrainingStatus" CssClass="form-select border-secondary" ></asp:DropDownList>
                                <button type="button" runat="server" class="btn btn-success" id="btnSearch"><i class="bi bi-funnel"></i>&nbsp;Filter</button>
                                <span class="input-group-text" style="background-color: white; color: black">
                                    <asp:Label runat="server" ID="lblPaging" CssClass="pull-right "></asp:Label></span>
                            </div>
                        </div>
                    </div>

                    <asp:GridView runat="server" ID="_gv" HeaderStyle-Font-Size="14px" CssClass="table table-bordered table-success-subtle table-striped table-hover" PageSize="15" EmptyDataText="NO RECORD FOUND"
                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                        <Columns>
                           
                            <asp:BoundField DataField="training_date" HeaderText="Training Date" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:MMM dd, yyyy}" />
                            <asp:BoundField DataField="training_title" HeaderText="Title" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="training_desc" HeaderText="Description" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="attendance" HeaderText="Attendance" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                             <asp:BoundField DataField="training_status" HeaderText="Status" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                             <%--<asp:BoundField DataField="registration_fee" HeaderText="Fee" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N}" />--%>
                             <asp:TemplateField HeaderText="" HeaderStyle-Width="1%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="lnkEdit" ImageUrl="~/images/printer.png" OnCommand="cmdGVPrint"
                                        CommandArgument='<%# Bind("trans_id")%>' ToolTip="Click to View Attendance" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>
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

</asp:Content>
