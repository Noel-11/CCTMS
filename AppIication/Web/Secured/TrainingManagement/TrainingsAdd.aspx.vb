Imports System.Data
Imports Microsoft.Reporting.WebForms
Partial Class Secured_TrainingManagement_TrainingsAdd
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton

    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            hfTransId.Value = Session("TRAINING_ID")

            _clsDB.populateDDLB(ddlTrainingTitle, "training_title", "trans_id", "tbl_ref_trainings", "training_description", " WHERE is_active = 'Y'", , "")

            _clsDB.populateDDLB(ddlTrainingType, "type_desc", "trans_id", "tbl_ref_training_applicant_type", "type_desc", " WHERE is_active = 'Y'", , "")
            ddlTrainingType.Items.RemoveAt(0)

            dtpTrainingDate.Text = DateTime.Now.Date.ToString("yyyy-MM-dd")
            dtpTrainingDateEnd.Text = DateTime.Now.Date.AddDays(1).ToString("yyyy-MM-dd")
            dtpRegistrationDateFrom.Text = DateTime.Now.Date.ToString("yyyy-MM-dd")
            dtpRegistrationDateTo.Text = DateTime.Now.Date.ToString("yyyy-MM-dd")

            isChkDateTo()

            flllInfo()

        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

        _btnNo = thisMsgBox.FindControl("btnMsgBoxNo")
        AddHandler _btnNo.ServerClick, AddressOf btnNo_Click

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If thisMsgBox.getModalType = "SAVE TRAINING" Then
            saveTraining()
            Response.Redirect("TrainingsAdd.aspx")

        ElseIf thisMsgBox.getModalType = "SAVE STATUS" Then
            saveStatus(hfStatus.Value)

            fillGvStatus()
            loadStatus()

            thisMsgBox.setInfo(, "Status Updated!")
            thisMsgBox.showConfirmBox()

        ElseIf thisMsgBox.getModalType = "CHECK ATTENDANCE" Then
            checkAttendance()
            fillGvAttendees()
            thisMsgBox.setInfo(, "Attendance Checked!")
            thisMsgBox.showConfirmBox()

        End If

    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub btnHome_ServerClick(sender As Object, e As EventArgs) Handles btnHome.ServerClick
        Response.Redirect("Trainings.aspx")
    End Sub

    Private Sub getTrainingTitleDetails()

        If hfTransId.Value = "" Then
            Dim _clsRefTrainings As New clsRefTrainings

            With _clsRefTrainings
                .getRefTrainings(ddlTrainingTitle.SelectedValue)
                txtDescription.Text = .trainingDescription

            End With

        End If

    End Sub

    Protected Sub ddlTrainingTitle_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlTrainingTitle.SelectedIndexChanged
        getTrainingTitleDetails()
    End Sub

    Private Sub isChkDateTo()

        divTrainingDateTo.Visible = False
        If chkTrainingDateTo.Checked Then
            divTrainingDateTo.Visible = True
        End If

    End Sub

    Protected Sub chkTrainingDateTo_CheckedChanged(sender As Object, e As EventArgs) Handles chkTrainingDateTo.CheckedChanged
        isChkDateTo()
    End Sub

    Private Sub setStatusCtrls(ByVal _thisBol As Boolean)

        ddlTrainingTitle.Enabled = _thisBol
        ddlTrainingType.Enabled = _thisBol
        chkTrainingDateTo.Enabled = _thisBol

        Dim _thisBolRead As Boolean = IIf(_thisBol, False, True)

        dtpTrainingDate.ReadOnly = _thisBolRead
        dtpTrainingDateEnd.ReadOnly = _thisBolRead
        txtDescription.ReadOnly = _thisBolRead

        txtTrainingSlots.ReadOnly = _thisBolRead
        txtRegistrationFee.ReadOnly = _thisBolRead
        dtpRegistrationDateFrom.ReadOnly = _thisBolRead
        dtpRegistrationDateTo.ReadOnly = _thisBolRead
        txtTrainingVenue.ReadOnly = _thisBolRead
        txtOtherDetails.ReadOnly = _thisBolRead

        btnSaveTraining.Visible = _thisBol

    End Sub

    Private Sub flllInfo()

        Dim _clsTraining As New clsTraining

        setStatusCtrls(True)

        btnStatus.Visible = False
        btnCheckAttendance.Visible = False

        divAttendees.Visible = False
        divApplicants.Visible = False

        If hfTransId.Value <> "" Then

            spanTainingHead.InnerText = "UPDATE TRAINING"

            btnStatus.Visible = True

            With _clsTraining
                .getTraining(hfTransId.Value)
                ddlTrainingType.SelectedValue = .trainingType
                dtpTrainingDate.Text = CDate(.trainingDate).ToString("yyyy-MM-dd")
                dtpTrainingDateEnd.Text = CDate(.trainingDateTo).ToString("yyyy-MM-dd")

                chkTrainingDateTo.Checked = IIf(CDate(.trainingDate).ToString("yyyy-MM-dd") = CDate(.trainingDateTo).ToString("yyyy-MM-dd"), False, True)

                isChkDateTo()

                dtpRegistrationDateFrom.Text = CDate(.regFrom).ToString("yyyy-MM-dd")
                dtpRegistrationDateTo.Text = CDate(.regTo).ToString("yyyy-MM-dd")

                ddlTrainingTitle.SelectedValue = .trainingId
                txtDescription.Text = .trainingDesc
                txtTrainingSlots.Text = .trainingSlots
                txtTrainingVenue.Text = .trainingVenue
                txtOtherDetails.Text = .otherDetails
                txtRegistrationFee.Text = .registrationFee

                If .trainingStatus = "COMPLETED" Then
                    btnCheckAttendance.Visible = True
                End If

                hfStatus.Value = .trainingStatus


            End With

            divAttendees.Visible = True
            divApplicants.Visible = True

            'STATUS DISPLAY
            loadStatus()

            fillGvAttendees()
            fillGvApplicantions()

        Else
            spanTainingHead.InnerText = "CREATE TRAINING"

        End If

    End Sub

    Private Sub loadStatus()
        Dim dt As New DataTable

        dt = _clsDB.Fill_DataTable("SELECT reg_status,remarks,last_user, DATE_FORMAT(last_date,'%m/%d/%Y %h:%i %p') AS last_date FROM tbl_training_details WHERE training_id = '" & hfTransId.Value & "' ORDER BY counter DESC LIMIT 1")

        setStatusCtrls(True)
        For Each dr As DataRow In dt.Rows
            lblTrainingStatus.InnerText = "Current Status : " & dr("reg_status") & " - " & dr("last_user") & " " & dr("last_date")

            If dr("Reg_status") = "COMPLETED" Then
                btnCheckAttendance.Visible = True
            Else
              
                btnCheckAttendance.Visible = False
            End If

            If dr("Reg_status") <> "DRAFTING" Then
                setStatusCtrls(False)
            End If

        Next
    End Sub

    Private Sub saveTraining()

        Dim _clsRecord As New clsTraining

        With _clsRecord
            .initialize()
            .transId = hfTransId.Value
            .trainingType = ddlTrainingType.SelectedValue
            .trainingDate = CDate(dtpTrainingDate.Text).ToString("yyyy-MM-dd")
            .trainingDateTo = IIf(chkTrainingDateTo.Checked, CDate(dtpTrainingDateEnd.Text).ToString("yyyy-MM-dd"), CDate(dtpTrainingDate.Text).ToString("yyyy-MM-dd"))
            .regFrom = CDate(dtpRegistrationDateFrom.Text).ToString("yyyy-MM-dd")
            .regTo = CDate(dtpRegistrationDateTo.Text).ToString("yyyy-MM-dd")
            .trainingTime = ""
            .trainingId = ddlTrainingTitle.SelectedValue
            .trainingTitle = ddlTrainingTitle.SelectedItem.Text.Trim.ToUpper
            .trainingDesc = txtDescription.Text.Trim.ToUpper
            .trainingSlots = txtTrainingSlots.Text.Trim.ToUpper
            .trainingVenue = txtTrainingVenue.Text.Trim.ToUpper
            .otherDetails = txtOtherDetails.Text.Trim
            .registrationFee = txtRegistrationFee.Text.Trim
            .lastUser = Session("UserName")
            .saveTraining()

            Session("TRAINING_ID") = .transId

        End With

        If hfTransId.Value = "" Then
            'Dim _clsTrainingDetails As New clsTrainingDetails
            'With _clsTrainingDetails
            '    .initialize()
            '    .trainingId = Session("TRAINING_ID")
            '    .regStatus = "UPCOMING"
            '    .remarks = "NEW TRAINING"
            '    .lastUser = Session("UserName")
            '    .saveRegistrationDetails()
            'End With
            hfTransId.Value = Session("TRAINING_ID")
            saveStatus("DRAFTING")

        End If

    End Sub

    Protected Sub btnSaveTraining_Click(sender As Object, e As EventArgs) Handles btnSaveTraining.Click
        thisMsgBox.setModalType("SAVE TRAINING")
        thisMsgBox.setConfirm(, "Are you sure to save Training Info?")
        thisMsgBox.showConfirmBox()
    End Sub

#Region "ATTENDEES"

    Protected Sub fillGvAttendees()

        Dim dt As New DataTable

        Dim _clsRecords As New clsTrainingAttendance

        dt = _clsRecords.browseTrainingAttendance(hfTransId.Value)

        _gvAttendees.DataSource = dt
        _gvAttendees.DataBind()

        lblPagingAtt.Text = setCurrentPage(0, dt, False)
    End Sub

#End Region

#Region "CHECK ATTENDANCE"

    Protected Sub fillGvCheckAttendance()

        Dim dt As New DataTable

        Dim _clsRecords As New clsTrainingAttendance

        dt = _clsRecords.browseTrainingAttendance(hfTransId.Value)

        _gvCheckAttendance.DataSource = dt
        _gvCheckAttendance.DataBind()


    End Sub


    Protected Sub btnCheckAttendance_Click(sender As Object, e As EventArgs) Handles btnCheckAttendance.Click

        Dim _clsTraining As New clsTraining

        With _clsTraining

            .getTraining(hfTransId.Value)
            lblCheckTrainingDate.Text = .trainingDate
            lblCheckTrainingTitle.Text = .trainingTitle
            lblCheckStatus.Text = .trainingStatus
            lblCheckRemarks.Text = .trainingRemarks

        End With

        fillGvCheckAttendance()

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlCheckAttendance", "var myModal = new bootstrap.Modal(document.getElementById('mdlCheckAttendance'), {});  myModal.show();", True)
    End Sub


    Private Sub checkAttendance()

        Dim _clsAttendance As New clsTrainingAttendance

        For Each _gvRow As GridViewRow In _gvCheckAttendance.Rows

            Dim _chkBox As CheckBox = CType(_gvRow.FindControl("chkAtt"), CheckBox)

            With _clsAttendance
                .transId = _chkBox.Attributes("transId")
                .isPresent = IIf(_chkBox.Checked = True, "Y", "N")
                .updateAttendanceIsPresent()
            End With

        Next

    End Sub

    Protected Sub btnSaveCheckAttendance_ServerClick(sender As Object, e As EventArgs) Handles btnSaveCheckAttendance.ServerClick

        thisMsgBox.setModalType("CHECK ATTENDANCE")
        thisMsgBox.setConfirm(, "Save Attendance status?")
        thisMsgBox.showConfirmBox()

    End Sub

#End Region

#Region "APPLICANTS"

    Protected Sub fillGvApplicantions()

        Dim dt As New DataTable

        Dim _clsRecords As New clsTrainingApplications

        dt = _clsRecords.browseTrainingApplications(hfTransId.Value)

        _gvApplicants.DataSource = dt
        _gvApplicants.DataBind()

        lblPagingApp.Text = setCurrentPage(0, dt, False)

    End Sub

#End Region

#Region "STATUS"

    Private Sub fillGvStatus()

        Dim _clsStatus As New clsTrainingDetails

        Dim dt As New DataTable

        dt = _clsStatus.browseRegistrationDetails(hfTransId.Value)

        _gvStatus.DataSource = dt
        _gvStatus.DataBind()

    End Sub

    Protected Sub btnStatus_Click(sender As Object, e As EventArgs) Handles btnStatus.Click

        lblTrainingDate.Text = dtpTrainingDate.Text
        lblTrainingTitle.Text = ddlTrainingTitle.SelectedItem.Text.ToUpper

        _clsDB.populateDDLB(ddlTrainingStatus, "status_desc", "trans_id", "tbl_ref_training_status", "sort_order", " WHERE is_active = 'Y'", , "")

        fillGvStatus()

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlStatus", "var myModal = new bootstrap.Modal(document.getElementById('mdlStatus'), {});  myModal.show();", True)

    End Sub

    Private Sub saveStatus(ByVal _thisStatus As String)

        Dim _clsStatus As New clsTrainingDetails

        With _clsStatus
            .initialize()
            .trainingId = hfTransId.Value
            .regStatus = _thisStatus
            .remarks = txtStatusRemarks.Text
            .lastUser = Session("UserName")
            .saveRegistrationDetails()
        End With

        Dim _clsTraining As New clsTraining

        With _clsTraining

            .transId = hfTransId.Value
            .trainingStatus = _clsStatus.regStatus
            .trainingRemarks = _clsStatus.remarks
            .lastUser = Session("UserName")
            .updateStatus()

        End With

    End Sub

    Protected Sub btnSaveStatus_ServerClick(sender As Object, e As EventArgs) Handles btnSaveStatus.ServerClick

        hfStatus.Value = ddlTrainingStatus.SelectedValue

        thisMsgBox.setModalType("SAVE STATUS")
        thisMsgBox.setConfirm(, "Are you to save status to " & ddlTrainingStatus.SelectedItem.Text.Trim.ToUpper & " ?")
        thisMsgBox.showConfirmBox()

    End Sub

#End Region

#Region "REPORT"

    Protected Sub btnPrintAttendance_ServerClick(sender As Object, e As EventArgs) Handles btnPrintAttendance.ServerClick
        generateReport()
        lblReportHeadName.Text = "TRAINING ATTENDANCE"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlPrintReport", "var myModal = new bootstrap.Modal(document.getElementById('mdlPrintReport'), {});  myModal.show();", True)
    End Sub

    Public Sub generateReport()
        Try
            Dim warnings(-1) As Warning
            Dim streamIds(-1) As String
            Dim mimeType As String = String.Empty
            Dim encoding As String = String.Empty
            Dim extension As String = String.Empty
            'Dim agerange As String
            Dim rvPrint As ReportViewer = New ReportViewer

            rvPrint.ProcessingMode = ProcessingMode.Local
            rvPrint.LocalReport.ReportPath = Server.MapPath("~/Secured/Report/rptTrainingAttendance.rdlc")

            Dim dsTraining As New ReportDataSource("dsTraining", getTraining())
            Dim dsAttendance As New ReportDataSource("dsAttendance", getAttendance())
            Dim dsSignatory As New ReportDataSource("dsSignatory", getSignatory())

            rvPrint.LocalReport.DataSources.Clear()
            rvPrint.LocalReport.DataSources.Add(dsTraining)
            rvPrint.LocalReport.DataSources.Add(dsAttendance)
            rvPrint.LocalReport.DataSources.Add(dsSignatory)

            rvPrint.LocalReport.Refresh()

            Dim bytes() As Byte = rvPrint.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamIds, warnings)

            Session("pdfBytes") = bytes

            ltEmbed.Text = String.Format("<object data=""{0}{1}"" type=""application/pdf"" width=""100%"" height=""700px""></object>", ResolveUrl("~/ReportHandler.ashx"), "")

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        'ReportsMsgBox.show("PAYROLL")
    End Sub

    Private Function getTraining() As DataTable

        Dim sql As String = ""

        sql = "SELECT trans_id, training_title,training_desc, DATE_FORMAT(training_date,'%m/%d/%Y') AS training_date " & _
              "FROM tbl_training " & _
              "WHERE trans_id = '" & hfTransId.Value & "' " & _
              "LIMIT 1"

        Dim dt As New DataTable

        dt = _clsDB.Fill_DataTable(sql, "tbl_training")

        Return dt

    End Function

    Private Function getAttendance() As DataTable

        Dim sql As String = ""

        sql = "SELECT CONCAT(tbl_training_applicants.lname,', ',fname,' ', ename,' ', mname) AS applicantName,home_addr, contact_no FROM tbl_training_attendance " & _
              "INNER JOIN tbl_training_applicants ON tbl_training_attendance.applicant_id = tbl_training_applicants.trans_id " & _
              "WHERE tbl_training_attendance.training_id = '" & hfTransId.Value & "' AND tbl_training_attendance.is_active = 'Y' " & _
              "ORDER BY lname,fname"

        Dim dt As New DataTable

        dt = _clsDB.Fill_DataTable(sql, "tbl_attendance")

        Return dt

    End Function

    Private Function getSignatory() As DataTable
        Dim sql As String = ""

        sql = "SELECT * FROM tbl_ref_signatories " & _
              "WHERE sig_form = 'ATTENDANCE' AND sig_type = 'NOTEDBY' LIMIT 1"

        Dim dt As New DataTable

        dt = _clsDB.Fill_DataTable(sql, "tbl_signatory")

        Return dt
    End Function

#End Region

    
    
End Class

