Imports Microsoft.VisualBasic
Imports System.Data
Imports Microsoft.Reporting.WebForms
Partial Class Secured_Applicant_AppAvailable
    Inherits cPageInit_Secured_Client
    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton
    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            hfApplicantId.Value = Session("APPLICANTID")

            Dim _clsApplications As New clsTrainingApplications

            _clsApplications.getExpiredApplications(24, hfApplicantId.Value)

            fillCounts()
            fillGVTrainings()

        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

        _btnNo = thisMsgBox.FindControl("btnMsgBoxNo")
        AddHandler _btnNo.ServerClick, AddressOf btnNo_Click

    End Sub


    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If thisMsgBox.getModalType = "REGISTER" Then
            trainingRegistration()
            generateReport()
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlPrintReport", "var myModal = new bootstrap.Modal(document.getElementById('mdlPrintReport'), {});  myModal.show();", True)
            fillGVTrainings()
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlViewClose", "document.getElementById('ctl00_cpConTent_btnCloseView').click();", True)
            ' Response.Redirect("AppDashBoard.aspx")
        End If

    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub fillCounts()

        spanUpcomingCount.InnerText = getTrainingCounts("UPCOMING", hfApplicantId.Value).Rows.Count

        spanCompleted.InnerText = getTrainingCounts("COMPLETED", hfApplicantId.Value).Rows.Count

    End Sub


    Private Function getTrainingCounts(ByVal _thisStatus As String, ByVal _thisApplicant As String) As DataTable

        Dim _dt As New DataTable
        Dim sql As String = ""

        If _thisStatus = "UPCOMING" Then
            sql = "SELECT tbl_training.trans_id FROM tbl_training " & _
             "INNER JOIN tbl_training_applications ON tbl_training.trans_id = tbl_training_applications.training_id AND " & _
             "tbl_training_applications.applicant_id = '" & _thisApplicant & "' AND tbl_training_applications.is_active = 'Y' " & _
             "WHERE tbl_training.is_active = 'Y' AND tbl_training.training_status = '" & _thisStatus & "' AND tbl_training_applications.application_status = 'PAID' " & _
             "GROUP BY tbl_training.trans_id "
        ElseIf _thisStatus = "COMPLETED" Then
            sql = "SELECT tbl_training.trans_id FROM tbl_training " & _
           "INNER JOIN tbl_training_attendance ON tbl_training.trans_id = tbl_training_attendance.training_id AND " & _
           "tbl_training_attendance.applicant_id = '" & _thisApplicant & "' AND tbl_training_attendance.is_active = 'Y' " & _
           "WHERE tbl_training.is_active = 'Y' AND tbl_training.training_status = '" & _thisStatus & "' " & _
           "GROUP BY tbl_training.trans_id "
        End If



        _dt = _clsDB.Fill_DataTable(sql)

        Return _dt

    End Function

    Protected Sub fillGVTrainings()

        Dim dt As New DataTable

        Dim _clsRecord As New clsTraining

        dt = _clsRecord.browseTrainingApplicant(hfApplicantId.Value, Session("APPLICANTTYPE"))

        _gvTraining.DataSource = dt
        _gvTraining.DataBind()

    End Sub

#Region "REGISTER"

    Protected Sub cmdGVRegister(ByVal sender As Object, ByVal e As CommandEventArgs)

        hfTrainingId.Value = e.CommandArgument

        lblTrainingDate.Text = CType(sender, Button).Attributes("trainingDate")
        lblTrainingTitle.Text = CType(sender, Button).Attributes("title")
        lblDescription.Text = CType(sender, Button).Attributes("description")
        lblOtherDescription.Text = CType(sender, Button).Attributes("otherDetails")
        lblTrainingSlots.Text = CType(sender, Button).Attributes("availableSlots")
        hfAvailableSlots.Value = CType(sender, Button).Attributes("availableSlots")
        lblVenue.Text = CType(sender, Button).Attributes("venue")
        lblTrainingFee.Text = CType(sender, Button).Attributes("registrationFee")

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlView", "var myModal = new bootstrap.Modal(document.getElementById('mdlView'), {});  myModal.show();", True)

    End Sub


    Protected Sub btnApply_ServerClick(sender As Object, e As EventArgs) Handles btnApply.ServerClick


        Dim _slots As Integer = 0

        Try
            _slots = hfAvailableSlots.Value
        Catch ex As Exception
            _slots = 0
        End Try

        thisMsgBox.setModalType("REGISTERXX")

        If _slots <= 0 Then

            thisMsgBox.setError("Cannot Apply", "No slots remaining! ")
        Else
            Dim dtExist As New DataTable

            dtExist = _clsDB.Fill_DataTable("SELECT trans_id, DATE_FORMAT(application_datetime,'%m/%d/%Y %h:%i %p') AS application_datetime,application_status FROM tbl_training_applications " & _
                                            "WHERE training_id = '" & hfTrainingId.Value & "' AND applicant_id = '" & hfApplicantId.ID & "' AND is_active = 'Y' LIMIT 1")

            If dtExist.Rows.Count > 0 Then
                thisMsgBox.setError("REGISTERED", "You're already applied on this training!" & _
                                                  "Schedule: " & lblTrainingDate.Text & "<br/>" & _
                                                  "Title: " & lblTrainingTitle.Text & "<br/>" & _
                                                  "DateTime Applied: " & dtExist.Rows(0)("application_datetime") & "<br/>" & _
                                                  "Status : " & dtExist.Rows(0)("application_status"))

            Else


                thisMsgBox.setModalType("REGISTER")
                thisMsgBox.setConfirm(, "Do you want to register on this Training? <br/> " & _
                                        "Schedule: " & lblTrainingDate.Text & "<br/>" & _
                                        "Title: " & lblTrainingTitle.Text & "<br/>" & _
                                        "Description: " & lblDescription.Text & "<br/>" & _
                                        "Available Slots: " & lblTrainingSlots.Text & "<br/>" & _
                                        "Click yes to proceed.")

            End If

        End If

        thisMsgBox.showConfirmBox()

    End Sub


    Private Sub trainingRegistration()

        Dim _clsApplicant As New clsTrainingApplicants

        Dim _clsTrainingApplication As New clsTrainingApplications
        Dim _clsTraining As New clsTraining

        _clsApplicant.getTrainingApplicants(hfApplicantId.Value)

        With _clsTrainingApplication
            .initialize()
            .trainingId = hfTrainingId.Value
            .applicantId = hfApplicantId.Value
            .applicantName = _clsApplicant.lname & ", " & _clsApplicant.fname & IIf(_clsApplicant.ename <> "", " " & _clsApplicant.ename, "") & " " & _clsApplicant.mname
            .applicantContact = _clsApplicant.contactNo
            .applicationStatus = "FOR PAYMENT"
            .applicationRemarks = "Pay to secure slot"
            .applicationDatetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm")
            .applicationFee = CDec(lblTrainingFee.Text)
            .lastUser = Session("UserName")
            .saveTrainingApplications()

        End With

        _clsTraining.updateAttendance(hfTrainingId.Value)

    End Sub

#End Region


#Region "BILLING"

    'Protected Sub btnPrintAttendance_ServerClick(sender As Object, e As EventArgs) Handles btnPrintAttendance.ServerClick
    '    generateReport()
    '    lblReportHeadName.Text = "TRAINING ATTENDANCE"
    '    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlPrintReport", "var myModal = new bootstrap.Modal(document.getElementById('mdlPrintReport'), {});  myModal.show();", True)
    'End Sub

    Protected Sub cmdGVPrintBill(ByVal sender As Object, ByVal e As CommandEventArgs)
        hfTrainingId.Value = e.CommandArgument.ToString
        generateReport()
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlPrintReport", "var myModal = new bootstrap.Modal(document.getElementById('mdlPrintReport'), {});  myModal.show();", True)
    End Sub

    Public Sub generateReport()
        Try
            Dim warnings() As Warning
            Dim streamIds() As String
            Dim mimeType As String = String.Empty
            Dim encoding As String = String.Empty
            Dim extension As String = String.Empty
            'Dim agerange As String
            Dim rvPrint As ReportViewer = New ReportViewer

            rvPrint.ProcessingMode = ProcessingMode.Local
            rvPrint.LocalReport.ReportPath = Server.MapPath("~/Secured/Report/rptBilling.rdlc")

            Dim dsTrainingApplication As New ReportDataSource("dsTrainingApplication", getBilling())


            rvPrint.LocalReport.DataSources.Clear()
            rvPrint.LocalReport.DataSources.Add(dsTrainingApplication)

            rvPrint.LocalReport.Refresh()

            Dim bytes() As Byte = rvPrint.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamIds, warnings)

            Session("pdfBytes") = bytes

            ltEmbed.Text = String.Format("<object data=""{0}{1}"" type=""application/pdf"" width=""100%"" height=""700px""></object>", ResolveUrl("~/ReportHandler.ashx"), "")

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        'ReportsMsgBox.show("PAYROLL")
    End Sub

    Private Function getBilling() As DataTable

        Dim sql As String = ""

        sql = "SELECT tbl_training_applications.trans_id,tbl_training_applications.app_code,tbl_training_applications.applicant_name,application_fee, " & _
              "tbl_training_applications.applicant_contact AS contact_no,CONCAT(tbl_training.training_title,': ',tbl_training.training_desc) AS training_description FROM tbl_training_applications " & _
              "INNER JOIN tbl_training ON tbl_training_applications.training_id = tbl_training.trans_id " & _
              "WHERE tbl_training_applications.applicant_id = '" & hfApplicantId.Value & "' AND " & _
              "tbl_training_applications.training_id = '" & hfTrainingId.Value & "'"

        Dim dt As New DataTable

        dt = _clsDB.Fill_DataTable(sql, "tbl_training")

        Return dt

    End Function

#End Region

End Class
