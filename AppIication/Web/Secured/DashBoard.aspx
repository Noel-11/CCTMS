<%@ Page Title="DASHBOARD" Language="VB" AutoEventWireup="false" CodeFile="DashBoard.aspx.vb"
    Inherits="Secured_DashBoard" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <%-- ==================== PAGE SCOPED STYLES ==================== --%>
    <style>
        .db-page { --db-green: #2e8b5a; --db-green-dark: #246e47; --db-ink: #1a4a2e; --db-soft: #eaf6ef;
            --db-line: #e3ebe6; --db-amber: #c98a1a; --db-amber-ink: #8a5a11; --db-amber-soft: #fff7e8;
            --db-amber-line: #f2e0c0; }
        .db-page .card { border: 1px solid var(--db-line); border-radius: 10px; box-shadow: none; }

        /* page header */
        .db-head { background: linear-gradient(135deg, #2e8b5a 0%, #246e47 100%); color: #fff; border-bottom: 0;
            border-radius: 10px 10px 0 0; padding: .7rem 1rem; display: flex; align-items: center;
            justify-content: space-between; gap: .75rem; flex-wrap: wrap; }
        .db-title { display: flex; align-items: center; gap: .5rem; margin: 0; font-size: 1.05rem;
            font-weight: 700; letter-spacing: .03em; color: #fff; }
        .db-title i { font-size: 1.15rem; }
        .db-note { font-size: .75rem; color: rgba(255,255,255,.88); }

        /* section head */
        .db-section { overflow: hidden; }
        .db-section-head { background: var(--db-soft); border-bottom: 1px solid #d7e7de; color: var(--db-ink);
            padding: .55rem .9rem; font-size: .74rem; font-weight: 700; letter-spacing: .08em;
            text-transform: uppercase; display: flex; align-items: center; justify-content: space-between;
            gap: .5rem; flex-wrap: wrap; }
        .db-section-head i { color: var(--db-green); font-size: .95rem; }
        .db-section-head .db-sub { font-size: .74rem; font-weight: 500; letter-spacing: 0;
            text-transform: none; color: #5c7568; }

        /* fields */
        .db-label { display: block; margin-bottom: .25rem; font-size: .78rem; font-weight: 600; color: var(--db-ink); }
        .db-page .form-control, .db-page .form-select, .db-page .input-group-text { font-size: .85rem; }
        .db-page .form-control:focus, .db-page .form-select:focus { border-color: var(--db-green);
            box-shadow: 0 0 0 .2rem rgba(46,139,90,.15); }

        /* KPI tiles */
        .db-kpi { overflow: hidden; margin-bottom: 0; }
        .db-kpi-head { display: flex; align-items: center; justify-content: space-between; gap: .5rem;
            padding: .4rem .75rem; background: var(--db-soft); border-bottom: 1px solid #d7e7de; }
        .db-kpi-label { display: inline-flex; align-items: center; gap: .4rem; font-size: .72rem;
            font-weight: 700; letter-spacing: .08em; text-transform: uppercase; color: var(--db-ink); }
        .db-kpi-label i { font-size: .9rem; }
        .db-kpi.amber .db-kpi-head { background: var(--db-amber-soft); border-bottom-color: var(--db-amber-line); }
        .db-kpi.amber .db-kpi-label { color: var(--db-amber-ink); }
        .db-period { font-weight: 500; letter-spacing: 0; text-transform: none; color: #5c7568; }
        .db-kpi-filter { width: auto; flex: 0 0 auto; }
        .db-kpi-filter .input-group-text { background: #fff; padding: .2rem .4rem; }
        .db-kpi-filter .form-select { width: auto; font-size: .75rem; padding: .2rem 1.5rem .2rem .45rem; }

        .db-kpi-body { width: 100%; border: 0; background: #fff; text-align: left; padding: .9rem 1rem;
            display: flex; align-items: center; gap: .85rem; cursor: pointer; transition: background .15s ease; }
        .db-kpi-body:hover, .db-kpi-body:focus { background: #f7fbf9; }
        .db-kpi-icon { flex: 0 0 52px; width: 52px; height: 52px; border-radius: 12px; font-size: 1.4rem;
            display: inline-flex; align-items: center; justify-content: center; }
        .db-kpi.green .db-kpi-icon { background: var(--db-soft); color: var(--db-green); }
        .db-kpi.amber .db-kpi-icon { background: #fff2dc; color: var(--db-amber); }
        .db-kpi-text { display: flex; flex-direction: column; gap: .1rem; }
        .db-kpi-num { font-size: 1.8rem; font-weight: 800; line-height: 1.05; color: var(--db-green-dark); }
        .db-kpi.amber .db-kpi-num { color: var(--db-amber-ink); }
        .db-kpi-cap { font-size: .72rem; font-weight: 500; color: #7b9086; }
        .db-kpi-go { margin-left: auto; font-size: 1.15rem; color: #c3d5cb; }
        .db-kpi-body:hover .db-kpi-go { color: var(--db-green); }
        .db-kpi.amber .db-kpi-body:hover .db-kpi-go { color: var(--db-amber); }
        .db-kpi.amber .db-kpi-body:hover, .db-kpi.amber .db-kpi-body:focus { background: #fffbf2; }

        /* chart */
        .db-chart-wrap { border: 1px solid var(--db-line); border-radius: 8px; padding: .25rem .5rem; background: #fff; }

        @media (max-width: 575.98px) {
            .db-head { align-items: flex-start; }
            .db-title { font-size: .95rem; }
            .db-kpi-body { padding: .75rem .8rem; }
        }
    </style>

    <div class="db-page">

        <%-- ==================== PAGE HEADER ==================== --%>
        <div class="card mb-3">
            <div class="card-header db-head">
                <h2 class="db-title"><i class="bi bi-speedometer2"></i>Dashboard Overview</h2>
                <span class="db-note"><i class="bi bi-info-circle"></i>&nbsp;Training status summary and application statistics</span>
            </div>

            <div class="card-body p-3">

                <%-- ==================== KPI TILES ==================== --%>
                <div class="row g-3">

                    <%-- UPCOMING --%>
                    <div class="col-12 col-md-6 col-xxl-4">
                        <div class="card db-kpi amber">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                                <ContentTemplate>

                                    <div class="db-kpi-head">
                                        <span class="db-kpi-label">
                                            <i class="bi bi-hourglass-split"></i>Upcoming
                                            <label runat="server" id="lblUpcomingFilter" class="db-period"></label>
                                        </span>
                                        <div class="input-group input-group-sm db-kpi-filter" title="Filter upcoming trainings by period">
                                            <span class="input-group-text"><i class="bi bi-funnel"></i></span>
                                            <asp:DropDownList runat="server" ID="ddlUpcomingFilter" CssClass="form-select" AutoPostBack="true">
                                                <asp:ListItem Text="Today" Value="Today"></asp:ListItem>
                                                <asp:ListItem Text="This Month" Value="Month"></asp:ListItem>
                                                <asp:ListItem Text="This Year" Value="Year"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <button runat="server" type="button" class="db-kpi-body" id="btnUpcoming" title="View upcoming trainings">
                                        <span class="db-kpi-icon"><i class="bi bi-calendar-event"></i></span>
                                        <span class="db-kpi-text">
                                            <asp:Label runat="server" ID="lblUpcomingCnt" Text="" CssClass="db-kpi-num"></asp:Label>
                                            <span class="db-kpi-cap">Upcoming trainings</span>
                                        </span>
                                        <span class="db-kpi-go"><i class="bi bi-arrow-right-circle"></i></span>
                                    </button>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <%-- COMPLETED --%>
                    <div class="col-12 col-md-6 col-xxl-4">
                        <div class="card db-kpi green">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                <ContentTemplate>

                                    <div class="db-kpi-head">
                                        <span class="db-kpi-label">
                                            <i class="bi bi-patch-check-fill"></i>Completed
                                            <label runat="server" id="lblCompleteFilter" class="db-period"></label>
                                        </span>
                                        <div class="input-group input-group-sm db-kpi-filter" title="Filter completed trainings by period">
                                            <span class="input-group-text"><i class="bi bi-funnel"></i></span>
                                            <asp:DropDownList runat="server" ID="ddlCompleteFilter" CssClass="form-select" AutoPostBack="true">
                                                <asp:ListItem Text="Today" Value="Today"></asp:ListItem>
                                                <asp:ListItem Text="This Month" Value="Month"></asp:ListItem>
                                                <asp:ListItem Text="This Year" Value="Year"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <button runat="server" type="button" class="db-kpi-body" id="btnComplete" title="View completed trainings">
                                        <span class="db-kpi-icon"><i class="bi bi-clipboard-check-fill"></i></span>
                                        <span class="db-kpi-text">
                                            <asp:Label runat="server" ID="lblCompleteCnt" Text="" CssClass="db-kpi-num"></asp:Label>
                                            <span class="db-kpi-cap">Completed trainings</span>
                                        </span>
                                        <span class="db-kpi-go"><i class="bi bi-arrow-right-circle"></i></span>
                                    </button>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                </div>
                <%-- ==================== /KPI TILES ==================== --%>

            </div>
            <%-- /card-body --%>
        </div>
        <%-- /page header card --%>

        <%-- ==================== APPLICATION CHART ==================== --%>
        <div class="card db-section mb-2">
            <div class="card-header db-section-head">
                <span class="d-inline-flex align-items-center gap-2"><i class="bi bi-bar-chart-fill"></i>Training Application Chart</span>
                <span class="db-sub">Applied vs. registered (paid) applications per month</span>
            </div>
            <div class="card-body p-3">

                <div class="row g-2 align-items-end justify-content-end">
                    <div class="col-12 col-sm-6 col-md-4 col-xxl-3">
                        <label class="db-label">Year</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-text bg-white"><i class="bi bi-calendar3 text-success"></i></span>
                            <asp:DropDownList runat="server" ID="ddlChartYear" CssClass="form-select" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="db-chart-wrap mt-3">
                    <div id="columnChart"></div>
                </div>

            </div>
        </div>
        <%-- ==================== /APPLICATION CHART ==================== --%>

    </div>
    <%-- ==================== /db-page ==================== --%>

</asp:Content>
