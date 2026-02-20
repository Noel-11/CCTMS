Imports System.Data
Partial Class Secured_DashBoard
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase
   
    Dim _dtGVForInspection As New DataTable
    Dim _dtGVReturnInspection As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            getDetails()
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

End Class
