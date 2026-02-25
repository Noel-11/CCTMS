Imports System.Data
Partial Class Secured_DashBoard
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase

    Dim _dtGVForInspection As New DataTable
    Dim _dtGVReturnInspection As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Dim thisYear As Integer = DateTime.Now.Year + 1

            For i = thisYear To (thisYear - 5) Step -1
                ddlChartYear.Items.Add(New ListItem(i, i))
            Next

            ddlChartYear.SelectedValue = DateTime.Now.Year

            getDetails()

            getColumnChart()

        End If

    End Sub

    Private Sub getDetails()

        ddlUpcomingFilter.SelectedValue = "Month"
        ddlCompleteFilter.SelectedValue = "Month"

        lblUpcomingCnt.Text = getStatusCnt("UPCOMING", ddlUpcomingFilter.SelectedValue)
        lblUpcomingFilter.InnerText = ddlUpcomingFilter.SelectedItem.Text

        lblCompleteCnt.Text = getStatusCnt("COMPLETED", ddlCompleteFilter.SelectedValue)
        lblCompleteFilter.InnerText = ddlCompleteFilter.SelectedItem.Text

    End Sub

    Protected Sub ddlUpcomingFilter_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlUpcomingFilter.SelectedIndexChanged
        lblUpcomingCnt.Text = getStatusCnt("UPCOMING", ddlUpcomingFilter.SelectedValue)
        lblUpcomingFilter.InnerText = ddlUpcomingFilter.SelectedItem.Text
    End Sub

    Protected Sub ddlCompleteFilter_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlCompleteFilter.SelectedIndexChanged
        lblCompleteCnt.Text = getStatusCnt("COMPLETED", ddlCompleteFilter.SelectedValue)
        lblCompleteFilter.InnerText = ddlCompleteFilter.SelectedItem.Text

    End Sub

    Private Function getStatusCnt(ByVal _thisStatus As String, ByVal _thisPeriod As String) As Integer

        Dim _clsDB As New clsDatabase

        Dim sqlWhere As String = ""

        If _thisPeriod = "Today" Then
            sqlWhere += " AND training_date = '" & DateTime.Now.ToString("yyyy-MM-dd") & "' "
        ElseIf _thisPeriod = "Month" Then
            sqlWhere += " AND DATE_FORMAT(training_date,'%Y-%m') = '" & DateTime.Now.ToString("yyyy-MM") & "' "
        ElseIf _thisPeriod = "Year" Then
            sqlWhere += " AND YEAR(training_date) = '" & DateTime.Now.Year & "' "
        End If

        Dim dt As New DataTable
        Dim _cnt As Integer = 0

        Dim sql As String = ""

        sql = "SELECT COUNT(*) FROM tbl_training " & _
              "WHERE training_status = '" & _thisStatus & "' AND is_active = 'Y' " & sqlWhere

        dt = _clsDB.Fill_DataTable(sql)

        _cnt = dt.Rows(0)(0)

        Return _cnt

    End Function

    Protected Sub btnPen_ServerClick(sender As Object, e As EventArgs) Handles btnUpcoming.ServerClick
        Session("TAGSTATUS") = "UPCOMING"
        Response.Redirect("/Secured/TrainingManagement/Trainings.aspx")
    End Sub

    Protected Sub btnCompleted_ServerClick(sender As Object, e As EventArgs) Handles btnComplete.ServerClick
        Session("TAGSTATUS") = "UPCOMING"
        Response.Redirect("/Secured/TrainingManagement/Trainings.aspx")
    End Sub

#Region "CHART"

    Private Sub getColumnChart()

        Dim sql As String = ""
        Dim dt As New DataTable

        Dim trainMonth As String = ""
        Dim cntApp As String = ""
        Dim cntReg As String = ""


        sql = "SELECT tbl_training.training_date, " & _
              "COUNT(DISTINCT IF(tbl_training_applications.application_status <> 'INACTIVE' ,tbl_training_applications.trans_id,NULL)) AS cntApplied, " & _
              "COUNT(DISTINCT IF(tbl_training_applications.application_status = 'PAID' ,tbl_training_applications.trans_id,NULL)) AS cntPaid " & _
              "FROM tbl_training_applications " & _
              "INNER JOIN tbl_training ON tbl_training_applications.training_id = tbl_training.trans_id " & _
              "WHERE tbl_training_applications.is_active = 'Y' AND YEAR(tbl_training.training_date) = '" & ddlChartYear.SelectedValue & "' " & _
              "GROUP BY MONTH(training_date) " & _
              "ORDER BY MONTH(training_date)"

        dt = _clsDB.Fill_DataTable(sql)

        Dim cnt As Integer = 0
        Dim prefix As String = ""

        For Each dr As DataRow In dt.Rows

            If cnt > 0 Then
                prefix = ","
            Else
                prefix = ""
            End If

            trainMonth += prefix & "'" & CDate(dr("training_date")).ToString("MMM") & "'"
            cntApp += prefix & dr("cntApplied")
            cntReg += prefix & dr("cntPaid")
          
            cnt += 1
        Next

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "columnChart", "" & _
                                                                  "document.addEventListener('DOMContentLoaded', () => { " & _
                                                                  "new ApexCharts(document.querySelector('#columnChart'), { " & _
                                                                  "series: [{" & _
                                                                  "name: 'Applied'," & _
                                                                  "data: [" & cntApp & "] " & _
                                                                  "}, { " & _
                                                                  "name: 'Registered (Paid)', " & _
                                                                  "data: [" & cntReg & "] " & _
                                                                  "}], " & _
                                                                  "chart: { " & _
                                                                  "type: 'bar', " & _
                                                                  "height: 350 " & _
                                                                  "}, " & _
                                                                  "plotOptions:{ " & _
                                                                  "bar: { " & _
                                                                  "horizontal: false, " & _
                                                                  "columnWidth: '55%', " & _
                                                                  "endingShape: 'rounded' " & _
                                                                  "} " & _
                                                                  "}, " & _
                                                                  "dataLabels: { " & _
                                                                  "enabled: false " & _
                                                                  "}, " & _
                                                                  "stroke: { " & _
                                                                  "show: true, " & _
                                                                  "width: 2, " & _
                                                                  "colors: ['transparent'] " & _
                                                                  "}, " & _
                                                                  "xaxis: { " & _
                                                                  "categories: [" & trainMonth & "] " & _
                                                                  "}, " & _
                                                                  "yaxis: { " & _
                                                                  "title: { " & _
                                                                  "text: 'Training Application Counts' " & _
                                                                  "} " & _
                                                                  "}, " & _
                                                                  "fill: { " & _
                                                                  "opacity: 1 " & _
                                                                  "}, " & _
                                                                  "tooltip: { " & _
                                                                  "y: { " & _
                                                                  "formatter: function(val) { " & _
                                                                  "return val; " & _
                                                                  "} " & _
                                                                  "} " & _
                                                                  "} " & _
                                                                  "}).render();" & _
                                                                  "});", True)

    End Sub

    Protected Sub ddlChartYear_TextChanged(sender As Object, e As EventArgs) Handles ddlChartYear.TextChanged
        getColumnChart()
    End Sub

#End Region

End Class
