<%@ Page Title="Trainings" Language="VB" AutoEventWireup="false" CodeFile="TrainingsAdd.aspx.vb"
    Inherits="Secured_TrainingManagement_TrainingsAdd" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <%-- ==================== PAGE SCOPED STYLES ==================== --%>
    <style>
        .tma-page { --tma-green: #2e8b5a; --tma-green-dark: #246e47; --tma-ink: #1a4a2e; --tma-soft: #eaf6ef; --tma-line: #e3ebe6; }
        .tma-page .card { border: 1px solid var(--tma-line); border-radius: 10px; box-shadow: none; }

        /* page header */
        .tma-head { background: linear-gradient(135deg, #2e8b5a 0%, #246e47 100%); color: #fff; border-bottom: 0;
            border-radius: 10px 10px 0 0; padding: .7rem 1rem; display: flex; align-items: center;
            justify-content: space-between; gap: .75rem; flex-wrap: wrap; }
        .tma-title { display: flex; align-items: center; gap: .5rem; margin: 0; font-size: 1.05rem;
            font-weight: 700; letter-spacing: .03em; color: #fff; }
        .tma-title i { font-size: 1.15rem; }
        .tma-glass { background: rgba(255,255,255,.16); border: 1px solid rgba(255,255,255,.35); color: #fff;
            font-size: .8rem; font-weight: 600; padding: .35rem .7rem; border-radius: 6px; }
        .tma-glass:hover, .tma-glass:focus { background: #fff; color: #246e47; border-color: #fff; }
        /* page header: keep Back + title grouped on the left (modal headers stay space-between) */
        .tma-head-start { justify-content: flex-start; gap: .85rem; }

        /* sections */
        .tma-section { border: 1px solid var(--tma-line); border-radius: 8px; overflow: hidden; margin-bottom: 1rem; }
        .tma-section-head { background: var(--tma-soft); border-bottom: 1px solid #d7e7de; color: var(--tma-ink);
            padding: .55rem .9rem; font-size: .74rem; font-weight: 700; letter-spacing: .08em;
            text-transform: uppercase; display: flex; align-items: center; justify-content: space-between;
            gap: .5rem; flex-wrap: wrap; }
        .tma-section-head i { color: var(--tma-green); font-size: .95rem; }
        .tma-section-head .tma-head-note { font-weight: 500; letter-spacing: 0; text-transform: none; color: #5c7568; }
        .tma-section-head.amber { background: #fff7e8; border-bottom-color: #f2e0c0; color: #8a5a11; }
        .tma-section-head.amber i { color: #c98a1a; }

        /* fields, buttons, tables */
        .tma-label { display: block; margin-bottom: .25rem; font-size: .78rem; font-weight: 600; color: var(--tma-ink); }
        .tma-page .form-control, .tma-page .form-select, .tma-page .input-group-text { font-size: .85rem; }
        .tma-page .form-control:focus, .tma-page .form-select:focus { border-color: var(--tma-green);
            box-shadow: 0 0 0 .2rem rgba(46,139,90,.15); }
        .tma-btn-g { background: var(--tma-green); border-color: var(--tma-green); color: #fff; font-size: .82rem; font-weight: 600; }
        .tma-btn-g:hover, .tma-btn-g:focus { background: var(--tma-green-dark); border-color: var(--tma-green-dark); color: #fff; }
        .tma-btn-o { background: #fff; border: 1px solid var(--tma-green); color: var(--tma-green); font-size: .82rem; font-weight: 600; }
        .tma-btn-o:hover, .tma-btn-o:focus { background: var(--tma-soft); border-color: var(--tma-green-dark); color: var(--tma-green-dark); }
        .tma-actions { border-top: 1px solid var(--tma-line); background: #fbfdfc; padding: .7rem .9rem;
            display: flex; align-items: center; justify-content: space-between; gap: .5rem; flex-wrap: wrap; }
        .tma-status { display: inline-block; padding: .25rem .7rem; border-radius: 999px; background: var(--tma-soft);
            border: 1px solid #cfe6da; color: var(--tma-green-dark); font-size: .72rem; font-weight: 700; }
        .tma-readonly { display: block; min-height: 32px; padding: .4rem .6rem; background: #fff;
            border: 1px solid var(--tma-line); border-radius: 6px; color: #33463c; font-size: .82rem; }
        .tma-table-wrap { border: 1px solid var(--tma-line); border-radius: 8px; overflow: auto; }
        .tma-page .gridviewGray { width: 100%; margin: 0; border: 0; border-collapse: collapse;
            font-family: inherit !important; font-size: .78rem !important; }
        .tma-page .gridviewGray th { background: var(--tma-green) !important; border-color: #256c46 !important;
            color: #fff !important; font-size: .7rem !important; font-weight: 600; letter-spacing: .04em;
            text-transform: uppercase; padding: .45rem .5rem; vertical-align: middle; }
        .tma-page .gridviewGray td { border-color: var(--tma-line) !important; color: #33463c;
            font-size: .78rem; padding: .4rem .5rem; vertical-align: middle; }
        .tma-page .gridviewGray .alt { background: #f7fbf9 !important; }
        .tma-page .gridviewGray tr:hover { background: #eef7f2 !important; }

        @media (max-width: 575.98px) {
            .tma-head { align-items: flex-start; }
            .tma-title { font-size: .95rem; }
            .tma-actions { flex-direction: column; align-items: stretch; }
            .tma-actions .btn { width: 100%; }
        }
    </style>

    <div class="tma-page">

        <%-- ==================== PAGE HEADER ==================== --%>
        <div class="card mb-3">
            <div class="card-header tma-head tma-head-start">
                <button runat="server" id="btnHome" class="tma-glass">
                    <i class="bi bi-chevron-double-left"></i>&nbsp;Back
                </button>
                <h2 class="tma-title"><i class="bi bi-mortarboard-fill"></i>Training Programs Details</h2>
            </div>

            <div class="card-body p-3">

                <%-- ==================== TRAINING INFO ==================== --%>
                <div class="card tma-section" runat="server" id="divTrainingInfo">
                    <div class="card-header tma-section-head">
                        <span class="d-inline-flex align-items-center gap-2">
                            <i class="bi bi-journal-text"></i>
                            <span runat="server" id="spanTainingHead">TRAINING INFO</span>
                        </span>
                        <span class="tma-head-note">Fields marked <span class="text-danger">*</span> are required</span>
                    </div>
                    <div class="card-body p-3">
                        <asp:UpdatePanel ID="updatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="row g-3">

                                    <%-- Training Title --%>
                                    <div class="col-12 col-lg-6">
                                        <label class="tma-label">Training Title <span class="text-danger">*</span></label>
                                        <asp:DropDownList runat="server" CssClass="form-select" ID="ddlTrainingTitle" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTrainingTitle" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Title required" ValidationGroup="DOC" />
                                    </div>

                                    <%-- Training Date / Training Date End --%>
                                    <div class="col-12 col-lg-6">
                                        <div class="row g-2">
                                            <div class="col-12 col-md-6">
                                                <label class="tma-label">Training Date <span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-white"><i class="bi bi-calendar-event text-success"></i></span>
                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpTrainingDate" />
                                                </div>
                                                <div class="form-check mt-1">
                                                    <asp:CheckBox runat="server" ID="chkTrainingDateTo" CssClass="form-check-input" ClientIDMode="Static" ToolTip="Check if training days is more than 1 day." AutoPostBack="true" />
                                                    <label class="form-check-label" for="chkTrainingDateTo" style="font-size: 12px">Training lasts more than 1 day</label>
                                                </div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="dtpTrainingDate" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Training date required" ValidationGroup="DOC" />
                                            </div>

                                            <div runat="server" id="divTrainingDateTo" class="col-12 col-md-6">
                                                <label class="tma-label">Training Date End <span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-white"><i class="bi bi-calendar-check text-success"></i></span>
                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpTrainingDateEnd" />
                                                </div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dtpTrainingDateEnd" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Date is required" ValidationGroup="DOC" />
                                            </div>
                                        </div>
                                    </div>

                                    <%-- Description / Training For --%>
                                    <div class="col-12 col-lg-8">
                                        <label class="tma-label">Description <span class="text-danger">*</span></label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtDescription" TextMode="MultiLine" Rows="2" placeholder="Short description of the training program" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescription" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Description is required" ValidationGroup="DOC" />
                                    </div>

                                    <div class="col-12 col-lg-4">
                                        <label class="tma-label">Training For <span class="text-danger">*</span></label>
                                        <asp:DropDownList runat="server" CssClass="form-select" ID="ddlTrainingType">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDescription" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Description is required" ValidationGroup="DOC" />
                                    </div>

                                    <%-- No. of Slots / Registration Fee / Registration Period --%>
                                    <div class="col-12 col-sm-6 col-lg-3">
                                        <label class="tma-label">No. of Slots <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white"><i class="bi bi-people text-success"></i></span>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtTrainingSlots" TextMode="Number" MaxLength="3" placeholder="0" />
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTrainingSlots" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Slots is required" ValidationGroup="DOC" />
                                    </div>

                                    <div class="col-12 col-sm-6 col-lg-3">
                                        <label class="tma-label">Registration Fee <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white fw-semibold" style="color: #2e8b5a">&#8369;</span>
                                            <asp:TextBox runat="server" CssClass="form-control text-end" ID="txtRegistrationFee" TextMode="Number" min="0.00" max="999999.99" MaxLength="9" step="any" Style="background-color: #f8f9fa" ReadOnly="true" placeholder="0.00"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtRegistrationFee" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Registration Fee is required" ValidationGroup="DOC" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtRegistrationFee" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" InitialValue="0.00" Display="Dynamic" Text="Registration Fee is required" ValidationGroup="DOC" />
                                    </div>

                                    <div class="col-12 col-lg-6">
                                        <label class="tma-label">Registration Period <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white"><i class="bi bi-calendar-range text-success"></i></span>
                                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpRegistrationDateFrom" />
                                            <span class="input-group-text bg-white text-muted">&ndash;</span>
                                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="dtpRegistrationDateTo" />
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="dtpRegistrationDateFrom" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Date is required" ValidationGroup="DOC" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="dtpRegistrationDateTo" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Date end is required" ValidationGroup="DOC" />
                                    </div>

                                    <%-- Training Venue --%>
                                    <div class="col-12">
                                        <label class="tma-label">Training Venue <span class="text-danger">*</span></label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtTrainingVenue" Rows="2" TextMode="MultiLine" placeholder="Venue / address where the training will be held" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTrainingVenue" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Venue is required" ValidationGroup="DOC" />
                                    </div>

                                    <%-- Links and Other Details --%>
                                    <div class="col-12">
                                        <label class="tma-label">Links and Other Details</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtOtherDetails" Rows="3" TextMode="MultiLine" placeholder="Links, payment details, reminders, etc." />
                                    </div>
                                </div>

                                <div class="tma-actions mt-3">
                                    <div class="d-flex align-items-center gap-2 flex-wrap">
                                        <asp:Button runat="server" Text="Save Training" class="btn tma-btn-g" ID="btnSaveTraining" ValidationGroup="DOC" />
                                        <asp:Button runat="server" Text="Check Attendance" class="btn tma-btn-o" ID="btnCheckAttendance" />
                                    </div>
                                    <div class="d-flex align-items-center gap-2 flex-wrap justify-content-sm-end">
                                        <span runat="server" id="lblTrainingStatus" class="tma-status"></span>
                                        <asp:Button runat="server" Text="Status" class="btn btn-sm btn-warning fw-semibold" ID="btnStatus" />
                                    </div>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>

                <%-- ==================== REGISTERED ATTENDEES ==================== --%>
                <div class="card tma-section" runat="server" id="divAttendees">
                    <asp:UpdatePanel ID="updatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="card-header tma-section-head">
                                <span class="d-inline-flex align-items-center gap-2">
                                    <i class="bi bi-people-fill"></i>
                                    <span runat="server" id="span1">Registered Attendees</span>
                                </span>
                                <span class="d-inline-flex align-items-center gap-2">
                                    <asp:Label runat="server" ID="lblPagingAtt" CssClass="tma-head-note"></asp:Label>
                                    <button type="button" runat="server" class="btn btn-sm btn-warning fw-semibold" id="btnPrintAttendance" tooltip="Click to Print Attendance"><i class="bi bi-printer-fill"></i>&nbsp;Print</button>
                                </span>
                            </div>
                            <div class="card-body p-3">
                                <div class="tma-table-wrap">
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

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- ==================== TRAINING APPLICANTS ==================== --%>
                <div class="card tma-section" runat="server" id="divApplicants">
                    <div class="card-header tma-section-head amber">
                        <span class="d-inline-flex align-items-center gap-2">
                            <i class="bi bi-person-lines-fill"></i>
                            <span runat="server" id="span2">Training Applicants</span>
                        </span>
                        <asp:Label runat="server" ID="lblPagingApp" CssClass="tma-head-note"></asp:Label>
                    </div>
                    <div class="card-body p-3">
                        <div class="tma-table-wrap">
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

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    <%-- ==================== MODAL: CHECK ATTENDANCE ==================== --%>
    <div id="mdlCheckAttendance" role="dialog" class="modal fade" aria-hidden="true" data-bs-backdrop="false" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                    <ContentTemplate>
                        <div class="modal-header tma-head">
                            <h5 class="modal-title tma-title" runat="server" id="H1"><i class="bi bi-clipboard2-check-fill"></i>Training Check Attendance</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body bg-light">
                            <div class="row g-2">
                                <div class="col-12 col-md-6">
                                    <span class="tma-label">Training Date</span>
                                    <asp:Label runat="server" CssClass="tma-readonly" ID="lblCheckTrainingDate"></asp:Label>
                                </div>

                                <div class="col-12 col-md-6">
                                    <span class="tma-label">Training Title</span>
                                    <asp:Label runat="server" CssClass="tma-readonly" ID="lblCheckTrainingTitle"></asp:Label>
                                </div>

                                <div class="col-12 col-md-6">
                                    <span class="tma-label">Current Status</span>
                                    <asp:Label runat="server" CssClass="tma-readonly" ID="lblCheckStatus"></asp:Label>
                                </div>

                                <div class="col-12">
                                    <span class="tma-label">Remarks</span>
                                    <asp:Label runat="server" CssClass="tma-readonly" ID="lblCheckRemarks"></asp:Label>
                                </div>
                            </div>

                            <div class="d-flex align-items-center gap-2 mt-3 mb-1">
                                <i class="bi bi-list-check text-success"></i>
                                <span class="tma-label mb-0">Attendance List</span>
                            </div>
                            <div class="tma-table-wrap">
                                <asp:GridView runat="server" ID="_gvCheckAttendance" HeaderStyle-Font-Size="14px" CssClass="gridviewGray table table-sm table-bordered table-striped table-hover align-middle mb-0" PageSize="15" EmptyDataText="NO RECORD"
                                    PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false"
                                    GridLines="None" Font-Names="Arial" Font-Size="12px" ForeColor="#000000" AllowPaging="false">
                                    <Columns>

                                        <asp:TemplateField HeaderText="Present" HeaderStyle-Width="3%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:CheckBox runat="server" transId='<%# Eval("trans_id")%>' ID="chkAtt" ToolTip="Check if Present" Checked='<%# Eval("isAttendanceChecked")%>' CssClass="form-check-input" />

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
                                <button runat="server" class="btn tma-btn-g" id="btnSaveCheckAttendance" tooltip="Click to Save"><i class="bi bi-check2-circle"></i>&nbsp;Save Attendance</button>
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

                        <div class="modal-header tma-head">
                            <h5 class="modal-title tma-title" runat="server" id="lblReturnHeaderText"><i class="bi bi-arrow-repeat"></i>Training Status</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body bg-light">
                            <div class="row g-2">
                                <div class="col-12 col-md-6">
                                    <span class="tma-label">Training Date</span>
                                    <asp:Label runat="server" CssClass="tma-readonly" ID="lblTrainingDate"></asp:Label>
                                </div>

                                <div class="col-12 col-md-6">
                                    <span class="tma-label">Training Title</span>
                                    <asp:Label runat="server" CssClass="tma-readonly" ID="lblTrainingTitle"></asp:Label>
                                </div>

                                <div class="col-12 col-md-6">
                                    <span class="tma-label">Status <span class="text-danger">*</span></span>
                                    <asp:DropDownList runat="server" ID="ddlTrainingStatus" CssClass="form-select" ValidationGroup="DOCSTATUS"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlTrainingStatus" SetFocusOnError="true" CssClass="text-danger fst-italic" Style="font-size: 12px" Display="Dynamic" Text="Status is required" ValidationGroup="DOCSTATUS" />
                                </div>

                                <div class="col-12">
                                    <span class="tma-label">Remarks</span>
                                    <asp:TextBox runat="server" ID="txtStatusRemarks" CssClass="form-control" TextMode="MultiLine" Rows="3" ValidationGroup="DOCSTATUS"></asp:TextBox>
                                </div>
                            </div>

                            <div class="d-flex justify-content-end mt-3">
                                <button runat="server" class="btn tma-btn-g" id="btnSaveStatus" tooltip="Click to Save" validationgroup="DOCSTATUS"><i class="bi bi-save"></i>&nbsp;Save Status</button>
                            </div>

                            <div class="d-flex align-items-center gap-2 mt-3 mb-1">
                                <i class="bi bi-clock-history text-success"></i>
                                <span class="tma-label mb-0">Status List</span>
                            </div>
                            <div class="tma-table-wrap">
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
                        <div class="modal-header tma-head">
                            <h5 class="modal-title tma-title">
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
            <asp:HiddenField runat="server" ID="hfStatus"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>

    </div>
    <%-- ==================== /tma-page ==================== --%>

</asp:Content>
