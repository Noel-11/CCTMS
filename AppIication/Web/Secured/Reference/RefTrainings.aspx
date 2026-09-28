<%@ Page Title="Trainings" Language="VB" AutoEventWireup="false" CodeFile="RefTrainings.aspx.vb"
    Inherits="Secured_Reference_RefTrainings" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <%-- ==================== PAGE SCOPED STYLES ==================== --%>
    <style>
        .rt-page {
            --rt-green: #2e8b5a;
            --rt-green-dark: #246e47;
            --rt-ink: #1a4a2e;
            --rt-soft: #eaf6ef;
            --rt-line: #e3ebe6;
        }

        .rt-page .card {
            border: 1px solid var(--rt-line);
            border-radius: 10px;
            box-shadow: none;
            background: #fff;
        }

        /* Page Banner Header */
        .rt-head {
            background: linear-gradient(135deg, #2e8b5a 0%, #246e47 100%);
            color: #fff;
            border-bottom: 0;
            border-radius: 10px 10px 0 0;
            padding: .75rem 1.1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: .75rem;
            flex-wrap: wrap;
        }

        .rt-title-wrap {
            display: flex;
            align-items: center;
            gap: .65rem;
        }

        .rt-title-icon {
            width: 36px;
            height: 36px;
            border-radius: 8px;
            background: rgba(255, 255, 255, .18);
            border: 1px solid rgba(255, 255, 255, .3);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.1rem;
            color: #fff;
            flex-shrink: 0;
        }

        .rt-title {
            margin: 0;
            font-size: 1.1rem;
            font-weight: 700;
            letter-spacing: .02em;
            color: #fff;
            line-height: 1.25;
        }

        .rt-subtitle {
            margin: 0;
            font-size: .75rem;
            color: rgba(255, 255, 255, .85);
        }

        .rt-glass-btn {
            background: rgba(255, 255, 255, .16);
            border: 1px solid rgba(255, 255, 255, .35);
            color: #fff;
            font-size: .82rem;
            font-weight: 600;
            padding: .42rem .95rem;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            gap: .4rem;
            transition: all .15s ease-in-out;
            cursor: pointer;
        }

        .rt-glass-btn:hover,
        .rt-glass-btn:focus {
            background: #fff;
            color: #246e47;
            border-color: #fff;
        }
        /* Filter Toolbar */
        .rt-toolbar {
            background: #fbfdfc;
            border: 1px solid var(--rt-line);
            border-radius: 8px;
            padding: .75rem .9rem;
            margin-bottom: .9rem;
        }

        .rt-search-addon {
            background: #fff;
            border-color: #cbdad1;
            color: #4f6b5b;
            font-weight: 600;
            font-size: .82rem;
        }

        .rt-search-input {
            border-color: #cbdad1;
            font-size: .85rem;
        }

        .rt-search-input:focus {
            border-color: var(--rt-green);
            box-shadow: 0 0 0 .2rem rgba(46, 139, 90, .15);
        }

        .rt-btn-filter {
            background: var(--rt-green);
            border-color: var(--rt-green);
            color: #fff;
            font-size: .82rem;
            font-weight: 600;
            padding: .42rem 1rem;
            display: inline-flex;
            align-items: center;
            gap: .35rem;
        }

        .rt-btn-filter:hover,
        .rt-btn-filter:focus {
            background: var(--rt-green-dark);
            border-color: var(--rt-green-dark);
            color: #fff;
        }

        /* Paging indicator badge */
        .rt-paging-badge {
            background: #fff;
            border: 1px solid #cbdad1;
            border-radius: 6px;
            padding: .42rem .75rem;
            display: inline-flex;
            align-items: center;
            gap: .45rem;
            font-size: .8rem;
            font-weight: 600;
            color: var(--rt-ink);
            width: 100%;
            justify-content: center;
            min-height: 38px;
        }

        .rt-paging-badge i {
            color: var(--rt-green);
            font-size: .9rem;
        }

        /* Grid Table Styling */
        .rt-table-wrap {
            border: 1px solid var(--rt-line);
            border-radius: 8px;
            overflow-x: auto;
            background: #fff;
        }

        .rt-page .gridviewGreen {
            width: 100%;
            margin: 0;
            border: 0;
            border-collapse: collapse;
            font-family: inherit !important;
            font-size: .82rem !important;
        }

        .rt-page .gridviewGreen th {
            background: var(--rt-green) !important;
            border-color: #256c46 !important;
            color: #fff !important;
            font-size: .74rem !important;
            font-weight: 700;
            letter-spacing: .04em;
            text-transform: uppercase;
            padding: .6rem .75rem;
            vertical-align: middle;
        }

        .rt-page .gridviewGreen td {
            border-color: var(--rt-line) !important;
            color: #2b3b33;
            font-size: .82rem;
            padding: .6rem .75rem;
            vertical-align: middle;
        }

        .rt-page .gridviewGreen tr.alt {
            background: #fbfdfc !important;
        }

        .rt-page .gridviewGreen tr:hover {
            background: #eef7f2 !important;
        }

        /* Action Column Button Wrap */
        .rt-action-btn-wrap {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 6px;
            background: var(--rt-soft);
            border: 1px solid #cfe6da;
            transition: all .15s ease-in-out;
        }

        .rt-action-btn-wrap:hover {
            background: var(--rt-green);
            border-color: var(--rt-green);
            transform: scale(1.06);
        }

        .rt-action-btn-wrap input[type="image"] {
            cursor: pointer;
            width: 18px;
            height: 18px;
        }

        .rt-action-btn-wrap:hover input[type="image"] {
            filter: brightness(0) invert(1);
        }

        /* Pager Styling */
        .rt-page .pgr {
            background: #fbfdfc !important;
            border-top: 1px solid var(--rt-line) !important;
        }

        .rt-page .pgr table {
            margin: .35rem auto !important;
        }

        .rt-page .pgr td {
            border: 0 !important;
            padding: 0 .2rem !important;
        }

        .rt-page .pgr a,
        .rt-page .pgr span {
            display: inline-block;
            min-width: 28px;
            height: 28px;
            line-height: 26px;
            text-align: center;
            padding: 0 .4rem;
            border-radius: 4px;
            font-size: .78rem;
            font-weight: 600;
            text-decoration: none;
        }

        .rt-page .pgr a {
            background: #fff;
            color: var(--rt-ink);
            border: 1px solid #cbdad1;
        }

        .rt-page .pgr a:hover {
            background: var(--rt-soft);
            color: var(--rt-green-dark);
            border-color: var(--rt-green);
        }

        .rt-page .pgr span {
            background: var(--rt-green);
            color: #fff;
            border: 1px solid var(--rt-green);
        }

        @media (max-width: 575.98px) {
            .rt-head {
                align-items: flex-start;
            }
            .rt-title {
                font-size: .98rem;
            }
            .rt-glass-btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>

    <div class="rt-page">
        <div class="card">

            <%-- ==================== PAGE HEADER ==================== --%>
            <div class="card-header rt-head">
                <div class="rt-title-wrap">
                    <div class="rt-title-icon">
                        <i class="bi bi-journal-bookmark-fill"></i>
                    </div>
                    <div>
                        <h2 class="rt-title">Reference Training Title List</h2>
                        <p class="rt-subtitle">Directory of master training titles, fees, and learning tracks</p>
                    </div>
                </div>

                <div>
                    <button runat="server" class="rt-glass-btn" id="btnAdd" title="Add New Training Reference">
                        <i class="bi bi-plus-circle-fill"></i>
                        <span>Add New Training</span>
                    </button>
                </div>
            </div>

            <%-- ==================== CARD BODY ==================== --%>
            <div class="card-body p-3">
                <asp:UpdatePanel ID="updatePanel5" runat="server">
                    <ContentTemplate>

                        <%-- Toolbar: Search & Record Status --%>
                        <div class="rt-toolbar">
                            <div class="row g-2 align-items-center">
                                <div class="col-12 col-md-8">
                                    <div class="input-group">
                                        <span runat="server" id="lblApplicationNameLabel" class="input-group-text rt-search-addon">
                                            <i class="bi bi-search me-1 text-success"></i>Search
                                        </span>
                                        <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control rt-search-input"
                                            Style="text-transform: uppercase" MaxLength="100"
                                            placeholder="Search by training title or description..."></asp:TextBox>
                                        <button runat="server" class="btn rt-btn-filter" id="btnSearch" title="Filter training records">
                                            <i class="bi bi-funnel-fill"></i>
                                            <span>Filter</span>
                                        </button>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4">
                                    <div class="rt-paging-badge" title="Paging status">
                                        <i class="bi bi-layers-fill"></i>
                                        <asp:Label runat="server" ID="lblPaging" CssClass="text-truncate"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- Grid Table --%>
                        <div class="rt-table-wrap">
                            <asp:GridView runat="server" ID="_gv"
                                CssClass="gridviewGreen table table-hover mb-0"
                                PageSize="15"
                                EmptyDataText="NO RECORD FOUND"
                                PagerStyle-CssClass="pgr"
                                AlternatingRowStyle-CssClass="alt"
                                AutoGenerateColumns="false"
                                GridLines="None"
                                ForeColor="#27372f"
                                AllowPaging="true">
                                <Columns>

                                    <asp:BoundField DataField="training_title" HeaderText="Title"
                                        ItemStyle-Width="22%" ItemStyle-HorizontalAlign="Left"
                                        ItemStyle-CssClass="fw-semibold text-dark" />

                                    <asp:BoundField DataField="training_description" HeaderText="Description"
                                        ItemStyle-Width="26%" ItemStyle-HorizontalAlign="Left"
                                        ItemStyle-CssClass="text-secondary" />

                                    <asp:BoundField DataField="learning_mode" HeaderText="Learning Mode"
                                        ItemStyle-Width="12%" ItemStyle-HorizontalAlign="Center"
                                        HeaderStyle-HorizontalAlign="Center" />

                                    <asp:BoundField DataField="trainingProgram" HeaderText="Training Program"
                                        ItemStyle-Width="16%" ItemStyle-HorizontalAlign="Center"
                                        HeaderStyle-HorizontalAlign="Center" />

                                    <asp:BoundField DataField="training_prog_fee_amount" HeaderText="Program Fee"
                                        ItemStyle-Width="14%" ItemStyle-HorizontalAlign="Right"
                                        HeaderStyle-HorizontalAlign="Right"
                                        DataFormatString="₱ {0:N2}"
                                        ItemStyle-CssClass="fw-bold" />

                                    <asp:BoundField DataField="is_active" HeaderText="Active"
                                        ItemStyle-Width="6%" ItemStyle-HorizontalAlign="Center"
                                        HeaderStyle-HorizontalAlign="Center" />

                                    <asp:TemplateField HeaderText="Action" HeaderStyle-Width="4%"
                                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <span class="rt-action-btn-wrap">
                                                <asp:ImageButton runat="server" ID="lnkEdit"
                                                    ImageUrl="~/images/editVerification.png"
                                                    OnCommand="cmdGVUpdate"
                                                    CommandArgument='<%# Bind("trans_id")%>'
                                                    ToolTip="Click to View / Edit Training Details" />
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>
    </div>

</asp:Content>
