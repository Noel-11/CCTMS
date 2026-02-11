Imports System.Data
Imports Microsoft.Reporting.WebForms
Partial Class Secured_TrainingManagement_RegistrationReport
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Session.Remove("TRAINING_ID")

            _clsDB.populateDDLB(ddlLearningTracks, "description", "trans_id", "tbl_ref_learning_tracks", "description", " WHERE is_active = 'Y'", "ALL", "")
            _clsDB.populateDDLB(ddlLearningMode, "description", "trans_id", "tbl_ref_learning_mode", "description", " WHERE is_active = 'Y'", "ALL", "")
            _clsDB.populateDDLB(ddlPreferredSched, "description", "trans_id", "tbl_ref_preferred_schedule", "description", " WHERE is_active = 'Y'", "ALL", "")
            _clsDB.populateDDLB(ddlGender, "description", "trans_id", "tbl_ref_gender", "description", " WHERE is_active = 'Y'", "ALL", "")


            dtpDateFrom.Text = DateTime.Now.Year & "-" & DateTime.Now.Month.ToString("00") & "-01"
            dtpDateTo.Text = DateTime.Now.Year & "-" & DateTime.Now.Month.ToString("00") & "-" & DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month).ToString("00")

            fillGv()

        End If

    End Sub

    Protected Sub fillGv()

        Dim dt As New DataTable

        dt = getDetails()

        _gv.DataSource = dt
        _gv.DataBind()

        lblPaging.Text = setCurrentPage(0, dt)

    End Sub

    Protected Sub _gv_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles _gv.PageIndexChanging
        Session("NewPageIndex") = e.NewPageIndex
        _gv.PageIndex = e.NewPageIndex
        fillGv()
    End Sub

    Protected Sub btnSearch_ServerClick(sender As Object, e As EventArgs) Handles btnSearch.ServerClick
        fillGv()
    End Sub

#Region "REPORT"

    Protected Sub btnPrint_ServerClick(sender As Object, e As EventArgs) Handles btnPrint.ServerClick

        generateReport()
        lblReportHeadName.Text = "Registration List"
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
            rvPrint.LocalReport.ReportPath = Server.MapPath("~/Secured/Report/rptApplicantList.rdlc")

            Dim dsApplicants As New ReportDataSource("dsApplicants", getDetails())

            rvPrint.LocalReport.DataSources.Clear()
            rvPrint.LocalReport.DataSources.Add(dsApplicants)

            Dim datePeriod As String = ""

            If dtpDateFrom.Text.Trim = dtpDateTo.Text.Trim Then
                datePeriod = dtpDateFrom.Text.Trim
            Else
                datePeriod = CDate(dtpDateFrom.Text).ToString("MM/dd/yyyy") & "-" & CDate(dtpDateTo.Text).ToString("MM/dd/yyyy")
            End If


            Dim paramDate As New ReportParameter("paramDate", datePeriod)
            Dim paramGender As New ReportParameter("paramGender", IIf(ddlGender.SelectedValue = "", "ALL", ddlGender.SelectedItem.Text.ToString).ToString)
            Dim paramTracks As New ReportParameter("paramTracks", IIf(ddlLearningTracks.SelectedValue = "", "ALL", ddlLearningTracks.SelectedItem.Text.ToString).ToString)
            Dim paramMode As New ReportParameter("paramMode", IIf(ddlLearningMode.SelectedValue = "", "ALL", ddlLearningMode.SelectedItem.Text.ToString).ToString)
            Dim paramSchedule As New ReportParameter("paramSchedule", IIf(ddlPreferredSched.SelectedValue = "", "ALL", ddlPreferredSched.SelectedItem.Text.ToString).ToString)

            rvPrint.LocalReport.SetParameters(New ReportParameter() {paramDate, paramGender, paramTracks, paramMode, paramSchedule})

            rvPrint.LocalReport.Refresh()

            Dim bytes() As Byte = rvPrint.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamIds, warnings)

            Session("pdfBytes") = bytes

            ltEmbed.Text = String.Format("<object data=""{0}{1}"" type=""application/pdf"" width=""100%"" height=""700px""></object>", ResolveUrl("~/ReportHandler.ashx"), "")

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        'ReportsMsgBox.show("PAYROLL")
    End Sub

    Private Function getDetails() As DataTable

        Dim sql As String = ""

        Dim sqlWhere As String = ""

        If dtpDateFrom.Text <> "" And dtpDateTo.Text <> "" Then
            sqlWhere += "AND (registration_date BETWEEN '" & dtpDateFrom.Text & "' AND '" & dtpDateTo.Text & "') "
        End If

        If ddlLearningTracks.SelectedValue <> "" Then
            sqlWhere += "AND  tbl_training_applicants_learning_tracks.tracks_id = '" & ddlLearningTracks.SelectedValue & "'"
        End If

        If ddlPreferredSched.SelectedValue <> "" Then
            sqlWhere += "AND  tbl_training_applicants.pref_sched = '" & ddlPreferredSched.SelectedValue & "'"
        End If

        If ddlGender.SelectedValue <> "" Then
            sqlWhere += "AND  tbl_training_applicants.gender = '" & ddlGender.SelectedValue & "'"
        End If

        If ddlLearningMode.SelectedValue <> "" Then
            sqlWhere += "AND  tbl_training_applicants.pref_learn_mode = '" & ddlLearningMode.SelectedValue & "'"
        End If

        sql = "SELECT tbl_training_applicants.trans_id,lname,CONCAT(fname,' ',ename) AS fname,mname,ename,tbl_ref_gender.`description` AS gender,contact_no,email_add, " & _
              "tbl_training_applicants.home_addr, tbl_training_applicants.profession, tbl_training_applicants.prc_no, DATE_FORMAT(tbl_training_applicants.prc_expiration,'%m/%d/%Y') AS prc_expiration, " & _
              "CONCAT(GROUP_CONCAT(tbl_ref_learning_tracks.`description`),', ',tbl_training_applicants.pref_learn_tracks_others) AS learningTracks,tbl_ref_learning_mode.`description` AS learningMode, " & _
              "tbl_ref_preferred_schedule.`description` AS preferredSched FROM  tbl_training_applicants " & _
              "INNER JOIN tbl_ref_gender ON tbl_training_applicants.gender = tbl_ref_gender.trans_id " & _
              "INNER JOIN tbl_ref_learning_mode ON tbl_training_applicants.pref_learn_mode = tbl_ref_learning_mode.trans_id " & _
              "LEFT JOIN tbl_training_applicants_learning_tracks ON tbl_training_applicants.trans_id = tbl_training_applicants_learning_tracks.applicant_id " & _
              "LEFT JOIN tbl_ref_learning_tracks ON tbl_training_applicants_learning_tracks.tracks_id = tbl_ref_learning_tracks.trans_id " & _
              "INNER JOIN tbl_ref_preferred_schedule ON tbl_training_applicants.pref_sched = tbl_ref_preferred_schedule.trans_id " & _
              "WHERE tbl_training_applicants.is_active = 'Y' " & sqlWhere & _
              "GROUP BY tbl_training_applicants.trans_id " & _
              "ORDER BY lname,fname"

        Dim dt As New DataTable

        dt = _clsDB.Fill_DataTable(sql, "tbl_applicants")

        Return dt

    End Function


  

#End Region

    
End Class
