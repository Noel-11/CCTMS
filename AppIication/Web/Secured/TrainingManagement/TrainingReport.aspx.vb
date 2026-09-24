Imports System.Data
Imports Microsoft.Reporting.WebForms
Partial Class Secured_TrainingManagement_TrainingReport
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Session.Remove("TRAINING_ID")

            _clsDB.populateDDLB(ddlTrainingStatus, "status_desc", "trans_id", "tbl_ref_training_status", "sort_order", " WHERE is_active = 'Y'", "ALL", "")

            dtpDateFrom.Text = DateTime.Now.Year & "-" & DateTime.Now.Month.ToString("00") & "-01"
            dtpDateTo.Text = DateTime.Now.Year & "-" & DateTime.Now.Month.ToString("00") & "-" & DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month).ToString("00")

            fillGv()

        End If

    End Sub

    Protected Sub fillGv()

        Dim dt As New DataTable

        Dim _clsRecord As New clsTraining

        dt = _clsRecord.browseTrainingWAttendance("", CDate(dtpDateFrom.Text).ToString("yyyy-MM-dd"), CDate(dtpDateTo.Text).ToString("yyyy-MM-dd"))

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

    Protected Sub cmdGVExcel(ByVal sender As Object, ByVal e As CommandEventArgs)
        generateReport(e.CommandArgument.ToString, "excel")
        'generateReport2()
    End Sub

    Protected Sub cmdGVPrint(ByVal sender As Object, ByVal e As CommandEventArgs)
        generateReport(e.CommandArgument.ToString)

        ' generateReport2()

        lblReportHeadName.Text = "TRAINING ATTENDANCE"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlPrintReport", "var myModal = new bootstrap.Modal(document.getElementById('mdlPrintReport'), {});  myModal.show();", True)
    End Sub

    Public Sub generateReport(ByVal _thisId As String, Optional _thisType As String = "pdf")
        Try
            Dim warnings() As Warning
            Dim streamIds() As String
            Dim mimeType As String = String.Empty
            Dim encoding As String = String.Empty
            Dim extension As String = String.Empty
            'Dim agerange As String
            Dim rvPrint As ReportViewer = New ReportViewer

            rvPrint.ProcessingMode = ProcessingMode.Local
            rvPrint.LocalReport.ReportPath = Server.MapPath("~/Secured/Report/rptTrainingAttendance.rdlc")

            Dim dsTraining As New ReportDataSource("dsTraining", getTraining(_thisId))
            Dim dsAttendance As New ReportDataSource("dsAttendance", getAttendance(_thisId))
            Dim dsSignatory As New ReportDataSource("dsSignatory", getSignatory())

            rvPrint.LocalReport.DataSources.Clear()
            rvPrint.LocalReport.DataSources.Add(dsTraining)
            rvPrint.LocalReport.DataSources.Add(dsAttendance)
            rvPrint.LocalReport.DataSources.Add(dsSignatory)

            rvPrint.LocalReport.Refresh()

            If _thisType = "excel" Then
                Dim bytes() As Byte = rvPrint.LocalReport.Render("EXCEL", Nothing, mimeType, encoding, extension, streamIds, warnings)
                Response.Clear()
                Response.Buffer = True

                Response.ContentType = mimeType
                Response.AddHeader("content-disposition", ("attachment; filename=CCTMSAttendance" & DateTime.Now.ToString("yyyyMMddHHss") & ".xls"))
                Response.BinaryWrite(bytes)
                '' create the file
                Response.Flush()
                HttpContext.Current.ApplicationInstance.CompleteRequest()
            Else
                Dim bytes() As Byte = rvPrint.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamIds, warnings)

                Session("pdfBytes") = bytes

                ltEmbed.Text = String.Format("<object data=""{0}{1}"" type=""application/pdf"" width=""100%"" height=""700px""></object>", ResolveUrl("~/ReportHandler.ashx"), "")

            End If

        Catch ex As Exception
            thisMsgBox.setModalType("XXX")
            thisMsgBox.setError(, ex.Message)
            thisMsgBox.showConfirmBox()
        End Try

        'ReportsMsgBox.show("PAYROLL")
    End Sub

    Private Function getTraining(ByVal _thisId As String) As DataTable

        Dim sql As String = ""

        sql = "SELECT trans_id, training_title,training_desc, DATE_FORMAT(training_date,'%m/%d/%Y') AS training_date " & _
              "FROM tbl_training " & _
              "WHERE trans_id = '" & _thisId & "' " & _
              "LIMIT 1"

        Dim dt As New DataTable

        dt = _clsDB.Fill_DataTable(sql, "tbl_training")

        Return dt

    End Function

    Private Function getAttendance(ByVal _thisId As String) As DataTable

        Dim sql As String = ""

        sql = "SELECT CONCAT(tbl_training_applicants.lname,', ',fname,' ', ename,' ', mname) AS applicantName,home_addr, email_add, " & _
              "contact_no,profession,position,contact_no,attendee_no,prc_no  FROM tbl_training_attendance " & _
              "INNER JOIN tbl_training_applicants ON tbl_training_attendance.applicant_id = tbl_training_applicants.trans_id " & _
              "WHERE tbl_training_attendance.training_id = '" & _thisId & "' AND tbl_training_attendance.is_active = 'Y' " & _
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
