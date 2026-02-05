Imports Microsoft.VisualBasic
Imports System.Data
Partial Class Secured_Applicant_AppComplete
    Inherits cPageInit_Secured_Client
    Dim _clsDB As New clsDatabase

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            hfTransId.Value = Session("UserId")

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
End Class
