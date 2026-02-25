<%@ Page Title="DASHBOARD" Language="VB" AutoEventWireup="false" CodeFile="DashBoard.aspx.vb"
    Inherits="Secured_DashBoard" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

     <section class="section dashboard">

        <div class="row">

             <!-- UPCOMING -->
            <div class="col-xxl-4 col-md-6">
                <div class="card info-card sales-card">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                        <ContentTemplate>

                            <div class="filter">
                                <a class="icon text-dark" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <asp:DropDownList runat="server" ID="ddlUpcomingFilter" CssClass="dropdown-menu dropdown-menu-end dropdown-menu-arrow" AutoPostBack="true">
                                    <asp:ListItem Text="Today" Value="Today"></asp:ListItem>
                                    <asp:ListItem Text="This Month" Value="Month"></asp:ListItem>
                                     <asp:ListItem Text="This Year" Value="Year"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <button runat="server" type="button" class="card-body bg-warning border-0 w-100 text-start rounded" id="btnUpcoming" style="cursor: pointer;">
                                <h5 class="card-title text-dark">UPCOMING<span>|
                                            <label runat="server" id="lblUpcomingFilter" class="text-dark"></label>
                                </span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-exclamation-square-fill"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>
                                            <asp:Label runat="server" ID="lblUpcomingCnt" Text="" CssClass="text-dark"></asp:Label></h6>
                                    </div>
                                </div>
                            </button>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <!-- END PENDING -->
         
            <!-- COMPLETED -->
            <div class="col-xxl-4 col-md-6">
                <div class="card info-card sales-card">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                        <ContentTemplate>

                            <div class="filter">
                                <a class="icon text-light" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <asp:DropDownList runat="server" ID="ddlCompleteFilter" CssClass="dropdown-menu dropdown-menu-end dropdown-menu-arrow" AutoPostBack="true">
                                    <asp:ListItem Text="Today" Value="Today"></asp:ListItem>
                                    <asp:ListItem Text="This Month" Value="Month"></asp:ListItem>
                                     <asp:ListItem Text="This Year" Value="Year"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <button runat="server" type="button" class="card-body bg-success border-0 w-100 text-start rounded" id="btnComplete" style="cursor: pointer;">
                                <h5 class="card-title text-light">COMPLETED <span>|
                                            <label runat="server" id="lblCompleteFilter" class="text-light"></label>
                                </span></h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-clipboard-check-fill"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>
                                            <asp:Label runat="server" ID="lblCompleteCnt" Text="" CssClass="text-light"></asp:Label></h6>
                                    </div>
                                </div>
                            </button>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <!-- END APPROVED -->

           

        </div>


          <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <div class="row">
                                <div class="col-md-4">
                                   Training Application Chart
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-text border-secondary" style="color:black;">Year</span>
                                         <asp:DropDownList runat="server" ID="ddlChartYear" CssClass="form-select border-secondary float-start" AutoPostBack="true">
                                    </asp:DropDownList>
                                    </div>
                                   
                                </div>
                            </div>

                        </div>
                        <!-- Column Chart -->
                        <div id="columnChart"></div>

                    </div>
                </div>

            </div>
        </div>

      

    </section>


</asp:Content>
