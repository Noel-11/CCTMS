Imports Microsoft.VisualBasic
Imports System.Data
Partial Class Secured_Applicant_AppDashBoard
    Inherits cPageInit_Secured_Client
    Dim _clsDB As New clsDatabase

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            hfTransId.Value = Session("APPLICANTID")
            fillGVTrainings()

        End If

    End Sub

    Protected Sub fillGVTrainings()

        Dim dt As New DataTable

        Dim _clsRecord As New clsTraining

        dt = _clsRecord.browseTrainingApplicant("", hfTransId.Value)

        _gvTraining.DataSource = dt
        _gvTraining.DataBind()

    End Sub

    Protected Sub btnDashboard_Click(sender As Object, e As EventArgs) Handles btnDashboard.Click
        Response.Redirect("AppDashBoard.aspx")
    End Sub

    Protected Sub btnComplete_Click(sender As Object, e As EventArgs) Handles btnComplete.Click
        Response.Redirect("AppComplete.aspx")
    End Sub

    Protected Sub btnUpcoming_Click(sender As Object, e As EventArgs) Handles btnUpcoming.Click
        Response.Redirect("AppUpcoming.aspx")
    End Sub
End Class
