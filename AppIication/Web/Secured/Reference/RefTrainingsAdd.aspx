<%@ Page Title="Trainings" Language="VB" AutoEventWireup="false" CodeFile="RefTrainingsAdd.aspx.vb"
    Inherits="Secured_Reference_RefTrainingsAdd" Theme="Skins"
    MasterPageFile="~/MasterPage/Admin.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
    <%-- ==================== PAGE SCOPED STYLES ==================== --%>
    <style>
        .rta-page {
            --rta-green: #2e8b5a;
            --rta-green-dark: #246e47;
            --rta-ink: #1a4a2e;
            --rta-soft: #eaf6ef;
            --rta-line: #e3ebe6;
        }

        .rta-page .card {
            border: 1px solid var(--rta-line);
            border-radius: 10px;
            box-shadow: none;
            background: #fff;
        }

        /* Page Banner Header */
        .rta-head {
            background: linear-gradient(135deg, #2e8b5a 0%, #246e47 100%);
            color: #fff;
            border-bottom: 0;
            border-radius: 10px 10px 0 0;
            padding: .75rem 1.1rem;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            gap: .85rem;
            flex-wrap: wrap;
        }

        .rta-glass {
            background: rgba(255, 255, 255, .16);
            border: 1px solid rgba(255, 255, 255, .35);
            color: #fff;
            font-size: .82rem;
            font-weight: 600;
            padding: .38rem .85rem;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            gap: .35rem;
            transition: all .15s ease-in-out;
            cursor: pointer;
        }

        .rta-glass:hover,
        .rta-glass:focus {
            background: #fff;
            color: #246e47;
            border-color: #fff;
        }

        .rta-title {
            display: flex;
            align-items: center;
            gap: .55rem;
            margin: 0;
            font-size: 1.1rem;
            font-weight: 700;
            letter-spacing: .02em;
            color: #fff;
        }

        .rta-title i {
            font-size: 1.15rem;
        }

        /* Section Container */
        .rta-section {
            border: 1px solid var(--rta-line);
            border-radius: 8px;
            overflow: hidden;
        }

        .rta-section-head {
            background: var(--rta-soft);
            border-bottom: 1px solid #d7e7de;
            color: var(--rta-ink);
            padding: .6rem .95rem;
            font-size: .75rem;
            font-weight: 700;
            letter-spacing: .08em;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: .5rem;
            flex-wrap: wrap;
        }

        .rta-section-head i {
            color: var(--rta-green);
            font-size: .95rem;
        }

        .rta-head-note {
            font-weight: 500;
            letter-spacing: 0;
            text-transform: none;
            color: #5c7568;
            font-size: .75rem;
        }

        .rta-label {
            display: block;
            margin-bottom: .3rem;
            font-size: .8rem;
            font-weight: 600;
            color: var(--rta-ink);
        }

        .rta-page .form-control,
        .rta-page .form-select,
        .rta-page .input-group-text {
            font-size: .85rem;
            border-color: #cbdad1;
        }

        .rta-page .form-control:focus,
        .rta-page .form-select:focus {
            border-color: var(--rta-green);
            box-shadow: 0 0 0 .2rem rgba(46, 139, 90, .15);
        }

        .rta-currency-badge {
            background: #eaf6ef;
            color: #246e47;
            border-color: #cbdad1;
            font-weight: 700;
            font-size: .9rem;
        }

        /* Radio Button List */
        .rta-radio-card {
            background: #fbfdfc;
            border: 1px solid #cbdad1;
            border-radius: 6px;
            padding: .45rem .85rem;
            display: flex;
            align-items: center;
            gap: 1.25rem;
        }

        .rta-radio-card input[type="radio"] {
            margin-right: .3rem;
            cursor: pointer;
            accent-color: var(--rta-green);
        }

        .rta-radio-card label {
            margin: 0;
            font-size: .82rem;
            font-weight: 600;
            color: #2b3b33;
            cursor: pointer;
        }

        /* Footer Action Bar */
        .rta-actions {
            border-top: 1px solid var(--rta-line);
            background: #fbfdfc;
            padding: .75rem 1rem;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: .5rem;
        }

        .rta-btn-save {
            background: var(--rta-green);
            border-color: var(--rta-green);
            color: #fff;
            font-size: .84rem;
            font-weight: 600;
            padding: .45rem 1.6rem;
            border-radius: 6px;
            transition: all .15s ease-in-out;
        }

        .rta-btn-save:hover,
        .rta-btn-save:focus {
            background: var(--rta-green-dark);
            border-color: var(--rta-green-dark);
            color: #fff;
        }

        @media (max-width: 575.98px) {
            .rta-head {
                align-items: flex-start;
            }
            .rta-title {
                font-size: .98rem;
            }
            .rta-actions .btn {
                width: 100%;
            }
        }
    </style>


    <div class="rta-page">
        <div class="card">
            <asp:UpdatePanel ID="updatePanel2" runat="server">
                <ContentTemplate>

                    <%-- ==================== PAGE HEADER ==================== --%>
                    <div class="card-header rta-head">
                        <button runat="server" id="btnHome" class="rta-glass" title="Go back to Reference Training List">
                            <i class="bi bi-chevron-double-left"></i><span>Back</span>
                        </button>
                        <h2 class="rta-title">
                            <i class="bi bi-journal-text"></i><span>Training Title Details</span>
                        </h2>
                    </div>

                    <%-- ==================== BODY CONTENT ==================== --%>
                    <div class="card-body p-3">
                        <div class="card rta-section">
                            <div class="card-header rta-section-head">
                                <span class="d-inline-flex align-items-center gap-2">
                                    <i class="bi bi-info-circle-fill"></i>
                                    <span>Training Information</span>
                                </span>
                                <span class="rta-head-note">Fields marked <span class="text-danger">*</span> are required</span>
                            </div>
                            <div class="card-body p-3">
                                <div class="row g-3">

                                <%-- Training Title --%>
                                <div class="col-12">
                                    <label class="rta-label">
                                        Training Title <span class="text-danger">*</span>
                                    </label>
                                    <asp:TextBox runat="server" ID="txtTrainingTitle"
                                        CssClass="form-control" TextMode="MultiLine" Rows="2"
                                        placeholder="Enter training title"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                        ControlToValidate="txtTrainingTitle" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Title is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Description --%>
                                <div class="col-12">
                                    <label class="rta-label">
                                        Description <span class="text-danger">*</span>
                                    </label>
                                    <asp:TextBox runat="server" ID="txtDescription"
                                        CssClass="form-control" TextMode="MultiLine" Rows="2"
                                        placeholder="Enter description"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txtDescription" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Description is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Learning Mode --%>
                                <div class="col-12 col-md-6">
                                    <label class="rta-label">
                                        Learning Mode <span class="text-danger">*</span>
                                    </label>
                                    <asp:DropDownList runat="server" ID="ddlPreferredMode"
                                        CssClass="form-select">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="ddlPreferredMode" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Mode is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Learning Tracks --%>
                                <div class="col-12 col-md-6">
                                    <label class="rta-label">
                                        Learning Tracks <span class="text-danger">*</span>
                                    </label>
                                    <asp:DropDownList runat="server" ID="ddlLearningTracks"
                                        CssClass="form-select"
                                        AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="ddlLearningTracks" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Tracks is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Learning Tracks Other --%>
                                <div runat="server" id="divTracksOther" class="col-12">
                                    <label class="rta-label">
                                        Learning Tracks — Other (specify)
                                    </label>
                                    <asp:TextBox runat="server" ID="txtLearningTracksOther"
                                        CssClass="form-control"
                                        placeholder="Please specify other learning track"></asp:TextBox>
                                </div>

                                <%-- Training Program Fee --%>
                                <div class="col-12 col-md-6">
                                    <label class="rta-label">
                                        Training Program Fee <span class="text-danger">*</span>
                                    </label>
                                    <asp:DropDownList runat="server" ID="ddlTrainingProgFee"
                                        CssClass="form-select"
                                        AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="ddlTrainingProgFee" SetFocusOnError="true"
                                        CssClass="text-danger fst-italic mt-1"
                                        Style="font-size: 12px"
                                        Display="Dynamic" Text="Training Program Fee is required"
                                        ValidationGroup="DOC" />
                                </div>

                                <%-- Registration Fee --%>
                                <div class="col-12 col-md-6">
                                    <label class="rta-label">
                                        Registration Fee
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text rta-currency-badge">₱</span>
                                        <asp:TextBox runat="server" ID="txtRegistrationFee"
                                            CssClass="form-control text-end fw-semibold"
                                            TextMode="Number"
                                            min="0.00" max="999999.99"
                                            MaxLength="9" step="any"
                                            Style="background-color: #f8fbf9"
                                            ReadOnly="true"
                                            required="required"
                                            placeholder="0.00"></asp:TextBox>
                                    </div>
                                </div>

                                <%-- Is Active --%>
                                <div class="col-12">
                                    <label class="rta-label mb-2">
                                        Is Active?
                                    </label>
                                    <div class="d-inline-flex rta-radio-card">
                                        <asp:RadioButtonList runat="server" ID="rblIsactive"
                                            RepeatDirection="Horizontal"
                                            RepeatLayout="Flow">
                                            <asp:ListItem Text="Yes" Value="Y" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <%-- ==================== FOOTER ==================== --%>
                        <div class="rta-actions">
                            <asp:Button runat="server" ID="btnSave"
                                Text="Save Training"
                                CssClass="btn rta-btn-save"
                                ValidationGroup="DOC" />
                        </div>

                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</div>


    <asp:UpdatePanel ID="updatePanel3" runat="server">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfTransId"></asp:HiddenField>
            <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
