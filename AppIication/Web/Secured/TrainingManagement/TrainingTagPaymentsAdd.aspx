<%@ Page Title="Trainings" Language="VB" AutoEventWireup="false" CodeFile="TrainingTagPaymentsAdd.aspx.vb"
    Inherits="Secured_TrainingManagement_TrainingTagPaymentsAdd" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <%-- ==================== PAGE SCOPED STYLES ==================== --%>
    <style>
        .ttp-page { --ttp-green: #2e8b5a; --ttp-green-dark: #246e47; --ttp-ink: #1a4a2e; --ttp-soft: #eaf6ef; --ttp-line: #e3ebe6; }
        .ttp-page .card { border: 1px solid var(--ttp-line); border-radius: 10px; box-shadow: none; }

        /* page header */
        .ttp-head { background: linear-gradient(135deg, #2e8b5a 0%, #246e47 100%); color: #fff; border-bottom: 0;
            border-radius: 10px 10px 0 0; padding: .7rem 1rem; display: flex; align-items: center;
            justify-content: space-between; gap: .75rem; flex-wrap: wrap; }
        .ttp-title { display: flex; align-items: center; gap: .5rem; margin: 0; font-size: 1.05rem;
            font-weight: 700; letter-spacing: .03em; color: #fff; }
        .ttp-title i { font-size: 1.15rem; }
        .ttp-glass { background: rgba(255,255,255,.16); border: 1px solid rgba(255,255,255,.35); color: #fff;
            font-size: .8rem; font-weight: 600; padding: .35rem .7rem; border-radius: 6px; }
        .ttp-glass:hover, .ttp-glass:focus { background: #fff; color: #246e47; border-color: #fff; }
        /* page header: keep Back + title grouped on the left (modal headers stay space-between) */
        .ttp-head-start { justify-content: flex-start; gap: .85rem; }

        /* sections */
        .ttp-section { border: 1px solid var(--ttp-line); border-radius: 8px; overflow: hidden; margin-bottom: 1rem; }
        .ttp-section-head { background: var(--ttp-soft); border-bottom: 1px solid #d7e7de; color: var(--ttp-ink);
            padding: .55rem .9rem; font-size: .74rem; font-weight: 700; letter-spacing: .08em;
            text-transform: uppercase; display: flex; align-items: center; justify-content: space-between;
            gap: .5rem; flex-wrap: wrap; }
        .ttp-section-head i { color: var(--ttp-green); font-size: .95rem; }
        .ttp-section-head .ttp-head-note { font-weight: 500; letter-spacing: 0; text-transform: none; color: #5c7568; }
        .ttp-section-head.amber { background: #fff7e8; border-bottom-color: #f2e0c0; color: #8a5a11; }
        .ttp-section-head.amber i { color: #c98a1a; }

        /* fields, buttons, tables */
        .ttp-label { display: block; margin-bottom: .25rem; font-size: .78rem; font-weight: 600; color: var(--ttp-ink); }
        .ttp-page .form-control, .ttp-page .form-select, .ttp-page .input-group-text { font-size: .85rem; }
        .ttp-page .form-control:focus, .ttp-page .form-select:focus { border-color: var(--ttp-green);
            box-shadow: 0 0 0 .2rem rgba(46,139,90,.15); }
        .ttp-btn-g { background: var(--ttp-green); border-color: var(--ttp-green); color: #fff; font-size: .82rem; font-weight: 600; }
        .ttp-btn-g:hover, .ttp-btn-g:focus { background: var(--ttp-green-dark); border-color: var(--ttp-green-dark); color: #fff; }
        .ttp-btn-o { background: #fff; border: 1px solid var(--ttp-green); color: var(--ttp-green); font-size: .82rem; font-weight: 600; }
        .ttp-btn-o:hover, .ttp-btn-o:focus { background: var(--ttp-soft); border-color: var(--ttp-green-dark); color: var(--ttp-green-dark); }
        .ttp-actions { border-top: 1px solid var(--ttp-line); background: #fbfdfc; padding: .7rem .9rem;
            display: flex; align-items: center; justify-content: space-between; gap: .5rem; flex-wrap: wrap; }
        .ttp-status { display: inline-block; padding: .25rem .7rem; border-radius: 999px; background: var(--ttp-soft);
            border: 1px solid #cfe6da; color: var(--ttp-green-dark); font-size: .72rem; font-weight: 700; }
        .ttp-readonly { display: block; min-height: 32px; padding: .4rem .6rem; background: #fff;
            border: 1px solid var(--ttp-line); border-radius: 6px; color: #33463c; font-size: .82rem; }
        .ttp-table-wrap { border: 1px solid var(--ttp-line); border-radius: 8px; overflow: auto; }
        .ttp-page .gridviewGray { width: 100%; margin: 0; border: 0; border-collapse: collapse;
            font-family: inherit !important; font-size: .78rem !important; }
        .ttp-page .gridviewGray th { background: var(--ttp-green) !important; border-color: #256c46 !important;
            color: #fff !important; font-size: .7rem !important; font-weight: 600; letter-spacing: .04em;
            text-transform: uppercase; padding: .45rem .5rem; vertical-align: middle; }
        .ttp-page .gridviewGray td { border-color: var(--ttp-line) !important; color: #33463c;
            font-size: .78rem; padding: .4rem .5rem; vertical-align: middle; }
        .ttp-page .gridviewGray .alt { background: #f7fbf9 !important; }
        .ttp-page .gridviewGray tr:hover { background: #eef7f2 !important; }
        .ttp-page .ttp-table-wrap input[type="image"] { cursor: pointer; }
        .ttp-page .ttp-table-wrap .form-check-input { cursor: pointer; }

        @media (max-width: 575.98px) {
            .ttp-head { align-items: flex-start; }
            .ttp-title { font-size: .95rem; }
            .ttp-actions { flex-direction: column; align-items: stretch; }
            .ttp-actions .btn { width: 100%; }
        }
    </style>

    <div class="ttp-page">

        <%-- ==================== PAGE HEADER ==================== --%>
        <div class="card mb-3">
            <div class="card-header ttp-head ttp-head-start">
                <button runat="server" id="btnHome" class="ttp-glass">
                    <i class="bi bi-chevron-double-left"></i>&nbsp;Back
                </button>
                <h2 class="ttp-title"><i class="bi bi-mortarboard-fill"></i>Training Programs Details</h2>
            </div>

            <div class="card-body p-3">

                <%-- ==================== TRAINING INFO ==================== --%>
                <div class="card ttp-section" runat="server" id="divTrainingInfo">
                    <div class="card-header ttp-section-head">
                        <span class="d-inline-flex align-items-center gap-2">
                            <i class="bi bi-journal-text"></i>
                            <span runat="server" id="spanTainingHead">TRAINING INFO</span>
                        </span>
                        <span class="ttp-head-note">Training details</span>
                    </div>
                    <div class="card-body p-3">
                        <asp:UpdatePanel ID="updatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="row g-3">

                                    <%-- Training Date --%>
                                    <div class="col-12 col-lg-4">
                                        <label class="ttp-label">Training Date <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white"><i class="bi bi-calendar-event text-success"></i></span>
                                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpTrainingDate" required />
                                        </div>
                                    </div>

                                    <%--<div class="col-12 col-lg-3">
                                        <label class="ttp-label">Training Time</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white"><i class="bi bi-clock text-success"></i></span>
                                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpTrainingTime" />
                                        </div>
                                    </div>--%>

                                    <%-- Training Title --%>
                                    <div class="col-12 col-lg-8">
                                        <label class="ttp-label">Training Title <span class="text-danger">*</span></label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtTrainingTitle" placeholder="Title of the training program" required />
                                    </div>

                                    <%-- Description --%>
                                    <div class="col-12">
                                        <label class="ttp-label">Description <span class="text-danger">*</span></label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtDescription" placeholder="Short description of the training program" required />
                                    </div>

                                    <%-- No. of Slots --%>
                                    <div class="col-12 col-md-6 col-lg-4">
                                        <label class="ttp-label">No. of Slots <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white"><i class="bi bi-people text-success"></i></span>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtTrainingSlots" TextMode="Number" MaxLength="3" required />
                                        </div>
                                    </div>

                                    <%-- Registration Fee --%>
                                    <div class="col-12 col-md-6 col-lg-4">
                                        <label class="ttp-label">Registration Fee <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white"><i class="bi bi-cash-coin text-success"></i></span>
                                            <asp:TextBox runat="server" CssClass="form-control text-end" ID="txtRegistrationFee" TextMode="Number" min="0.00" max="999999.99" MaxLength="9" step="any" required></asp:TextBox>
                                        </div>
                                    </div>

                                    <%-- Links and Other Details --%>
                                    <div class="col-12">
                                        <label class="ttp-label">Links and Other Details</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtOtherDetails" Rows="3" TextMode="MultiLine" placeholder="Links, payment details, reminders, etc." />
                                    </div>
                                </div>

                                <div class="ttp-actions mt-3">
                                    <div class="d-flex align-items-center gap-2 flex-wrap">
                                        <asp:Button runat="server" Text="Save Training" class="btn ttp-btn-g" ID="btnSaveTraining" Visible="false" />
                                        <asp:Button runat="server" Text="Check Attendance" class="btn ttp-btn-o" ID="btnCheckAttendance" Visible="false" />
                                    </div>
                                    <div class="d-flex align-items-center gap-2 flex-wrap justify-content-sm-end">
                                        <span runat="server" id="lblTrainingStatus" class="ttp-status"></span>
                                        <asp:Button runat="server" Text="Status" class="btn btn-sm btn-warning fw-semibold" ID="btnStatus" />
                                    </div>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>

                <%-- ==================== REGISTERED ATTENDEES ==================== --%>
                <div class="card ttp-section" runat="server" id="divAttendees">
                    <asp:UpdatePanel ID="updatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="card-header ttp-section-head">
                                <span class="d-inline-flex align-items-center gap-2">
                                    <i class="bi bi-people-fill"></i>
                                    <span runat="server" id="span1">Registered Attendees</span>
                                </span>
                                <span class="d-inline-flex align-items-center gap-2">
                                    <asp:Label runat="server" ID="lblPagingAtt" CssClass="ttp-head-note"></asp:Label>
                                    <button runat="server" class="btn btn-sm btn-warning fw-semibold" id="btnPrintAttendance" tooltip="Click to Print Attendance"><i class="bi bi-printer-fill"></i>&nbsp;Print</button>
                                </span>
                            </div>
                            <div class="card-body p-2">
                                <div class="ttp-table-wrap">
                                    <asp:GridView runat="server" ID="_gvAttendees" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table table-sm table-bordered table-striped table-hover align-middle mb-0" PageSize="15" EmptyDataText="NO RECORD FOUND"
                                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                                        <Columns>

                                            <asp:BoundField DataField="lname" HeaderText="Last Name" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="fname" HeaderText="First Name" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="mname" HeaderText="Middle Name" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Contact No." ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="email_add" HeaderText="Email Address" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="prc_no" HeaderText="PRC ID #" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="prc_expiration" HeaderText="PRC Expiration Date" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="is_present" HeaderText="IsPresent" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="CENTER" />
                                            <asp:TemplateField HeaderText="" HeaderStyle-Width="1%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" ID="lnkEdit" ImageUrl="~/images/useredit.png" OnCommand="cmdGVTagStatus"
                                                        CommandArgument='<%# Bind("application_id")%>' applicantId='<%# Eval("applicant_id")%>' applicantName='<%# Eval("applicantName")%>' appProfession='<%# Eval("profession")%>' appStatus='<%# Eval("application_status")%>' ToolTip="Click to Tag Payment" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- ==================== TRAINING APPLICANTS ==================== --%>
                <div class="card ttp-section" runat="server" id="divApplicants">
                    <div class="card-header ttp-section-head amber">
                        <span class="d-inline-flex align-items-center gap-2">
                            <i class="bi bi-person-lines-fill"></i>
                            <span runat="server" id="span2">Training Applicants</span>
                        </span>
                    </div>
                    <div class="card-body p-2">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel7">
                            <ContentTemplate>
                                <div class="d-flex align-items-center justify-content-end mb-2">
                                    <asp:Label runat="server" ID="lblPagingApp" CssClass="ttp-head-note"></asp:Label>
                                </div>
                                <div class="ttp-table-wrap">
                                    <asp:GridView runat="server" ID="_gvApplicants" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table table-sm table-bordered table-striped table-hover align-middle mb-0" PageSize="15" EmptyDataText="NO RECORD FOUND"
                                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                                        <Columns>

                                            <asp:BoundField DataField="lname" HeaderText="Last Name" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="fname" HeaderText="First Name" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="mname" HeaderText="Middle Name" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Contact No." ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="email_add" HeaderText="Email Address" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="prc_no" HeaderText="PRC ID #" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="prc_expiration" HeaderText="PRC Expiration Date" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="application_status" HeaderText="Status" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />

                                            <asp:TemplateField HeaderText="" HeaderStyle-Width="1%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" ID="lnkEdit" ImageUrl="~/images/useredit.png" OnCommand="cmdGVTagPayment"
                                                        CommandArgument='<%# Bind("application_id")%>' applicantId='<%# Eval("applicant_id")%>' applicantName='<%# Eval("applicantName")%>' appProfession='<%# Eval("profession")%>' appStatus='<%# Eval("application_status")%>' ToolTip="Click to Tag Payment" />
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

        </div>

        <!-- ==================== MODAL: TAG STATUS ==================== -->
        <div id="mdlPayment" role="dialog" class="modal fade" aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="false">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                        <ContentTemplate>

                            <div class="modal-header ttp-head">
                                <h5 class="modal-title ttp-title" runat="server" id="H2"><i class="bi bi-tag-fill"></i>Tag Status</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body bg-light">
                                <div class="row g-2">
                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Training Date</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblTagTrainingDate"></asp:Label>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Training Title</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblTagTrainingTitle"></asp:Label>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Name</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblTagName"></asp:Label>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Profession</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblTagProfession"></asp:Label>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Status</span>
                                        <asp:DropDownList runat="server" ID="ddlTagStatus" CssClass="form-select" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-12">
                                        <span class="ttp-label">Remarks</span>
                                        <asp:TextBox runat="server" ID="txtTagRemarks" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Remarks / notes"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row g-2 mt-2" runat="server" id="divTagPayment">
                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Payment OR</span>
                                        <asp:TextBox runat="server" ID="txtTagOR" CssClass="form-control" placeholder="OR number"></asp:TextBox>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">OR Date</span>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white"><i class="bi bi-calendar-check text-success"></i></span>
                                            <asp:TextBox runat="server" ID="dtpTagORDate" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-end mt-3">
                                    <button runat="server" class="btn ttp-btn-g" id="btnTagSaveStatus" tooltip="Click to Save" validationgroup="DOCSTAGTATUS"><i class="bi bi-check2-circle"></i>&nbsp;Save Status</button>
                                </div>

                                <div class="d-flex align-items-center gap-2 mt-3 mb-1">
                                    <i class="bi bi-clock-history text-success"></i>
                                    <span class="ttp-label mb-0">Status List</span>
                                </div>
                                <div class="ttp-table-wrap">
                                    <asp:GridView runat="server" ID="_gvAppStatus" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table table-sm table-bordered table-striped table-hover align-middle mb-0" PageSize="15" EmptyDataText="NO RECORD"
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

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-sm btn-outline-secondary fw-semibold" runat="server" id="Button3" data-bs-dismiss="modal"><i class="bi bi-x-lg"></i>&nbsp;Close</button>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <!-- ==================== MODAL: CHECK ATTENDANCE ==================== -->
        <div id="mdlCheckAttendance" role="dialog" class="modal fade" aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="false">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                        <ContentTemplate>

                            <div class="modal-header ttp-head">
                                <h5 class="modal-title ttp-title" runat="server" id="H1"><i class="bi bi-clipboard2-check-fill"></i>Training Check Attendance</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body bg-light">
                                <div class="row g-2">
                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Training Date</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblCheckTrainingDate"></asp:Label>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Training Title</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblCheckTrainingTitle"></asp:Label>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Current Status</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblCheckStatus"></asp:Label>
                                    </div>

                                    <div class="col-12">
                                        <span class="ttp-label">Remarks</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblCheckRemarks"></asp:Label>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center gap-2 mt-3 mb-1">
                                    <i class="bi bi-list-check text-success"></i>
                                    <span class="ttp-label mb-0">Attendance List</span>
                                </div>
                                <div class="ttp-table-wrap">
                                    <asp:GridView runat="server" ID="_gvCheckAttendance" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table table-sm table-bordered table-striped table-hover align-middle mb-0" PageSize="15" EmptyDataText="NO RECORD"
                                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                        GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Present" HeaderStyle-Width="3%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>

                                                    <asp:CheckBox runat="server" transId='<%# Eval("trans_id")%>' ID="chkAtt" CssClass="form-check-input" ToolTip="Check if Present" Checked='<%# Eval("isAttendanceChecked")%>' />

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="applicantName" HeaderText="Name" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Contact No." ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="email_add" HeaderText="Email Address" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="prc_no" HeaderText="PRC ID #" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="left" />
                                            <asp:BoundField DataField="prc_expiration" HeaderText="PRC Expiration Date" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="left" />

                                        </Columns>
                                    </asp:GridView>
                                </div>

                                <div class="d-flex justify-content-end mt-3">
                                    <button runat="server" class="btn ttp-btn-g" id="btnSaveCheckAttendance" tooltip="Click to Save"><i class="bi bi-check2-circle"></i>&nbsp;Save Attendance</button>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-sm btn-outline-secondary fw-semibold" runat="server" id="Button2" data-bs-dismiss="modal"><i class="bi bi-x-lg"></i>&nbsp;Close</button>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <!-- ==================== MODAL: TRAINING STATUS ==================== -->
        <div id="mdlStatus" role="dialog" class="modal fade" aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="false">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel9">
                        <ContentTemplate>

                            <div class="modal-header ttp-head">
                                <h5 class="modal-title ttp-title" runat="server" id="lblReturnHeaderText"><i class="bi bi-arrow-repeat"></i>Training Status</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body bg-light">
                                <div class="row g-2">
                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Training Date</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblTrainingDate"></asp:Label>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Training Title</span>
                                        <asp:Label runat="server" CssClass="ttp-readonly" ID="lblTrainingTitle"></asp:Label>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <span class="ttp-label">Status</span>
                                        <asp:DropDownList runat="server" ID="ddlTrainingStatus" CssClass="form-select" ValidationGroup="DOCSTATUS"></asp:DropDownList>
                                    </div>

                                    <div class="col-12">
                                        <span class="ttp-label">Remarks</span>
                                        <asp:TextBox runat="server" ID="txtStatusRemarks" CssClass="form-control" TextMode="MultiLine" Rows="3" ValidationGroup="DOCSTATUS" placeholder="Remarks / notes"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-end mt-3">
                                    <button runat="server" class="btn ttp-btn-g" id="btnSaveStatus" tooltip="Click to Save" validationgroup="DOCSTATUS"><i class="bi bi-save"></i>&nbsp;Save Status</button>
                                </div>

                                <div class="d-flex align-items-center gap-2 mt-3 mb-1">
                                    <i class="bi bi-clock-history text-success"></i>
                                    <span class="ttp-label mb-0">Status List</span>
                                </div>
                                <div class="ttp-table-wrap">
                                    <asp:GridView runat="server" ID="_gvStatus" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table table-sm table-bordered table-striped table-hover align-middle mb-0" PageSize="15" EmptyDataText="NO RECORD"
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

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-sm btn-outline-secondary fw-semibold" runat="server" id="btnCloseView" data-bs-dismiss="modal"><i class="bi bi-x-lg"></i>&nbsp;Close</button>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <!-- ==================== MODAL: PRINT REPORT ==================== -->

        <div id="mdlPrintReport" role="dialog" class="modal fade" data-bs-backdrop="false" data-bs-keyboard="false">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <asp:UpdatePanel ID="updatePanel6" runat="server">
                        <ContentTemplate>
                            <div class="modal-header ttp-head">
                                <h5 class="modal-title ttp-title">
                                    <i class="bi bi-file-earmark-pdf-fill"></i>
                                    <asp:Label runat="server" ID="lblReportHeadName" Text="Attendance"></asp:Label>
                                </h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body bg-light p-2">
                                <asp:Literal ID="ltEmbed" runat="server" />
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="Button4" runat="server" class="btn btn-sm btn-outline-secondary fw-semibold" data-bs-dismiss="modal"><i class="bi bi-x-lg"></i>&nbsp;Close</button>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>

        </div>

        <asp:UpdatePanel ID="updatePanel3" runat="server">
            <ContentTemplate>
                <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
                <asp:HiddenField runat="server" ID="hfApplicationId"></asp:HiddenField>
                <asp:HiddenField runat="server" ID="hfApplicantId"></asp:HiddenField>
                <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
    <%-- ==================== /ttp-page ==================== --%>

</asp:Content>

