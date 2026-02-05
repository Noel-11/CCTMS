Imports System.Data
Partial Class Secured_TrainingManagement_TrainingReport
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase

    Dim _dtGVForInspection As New DataTable
    Dim _dtGVReturnInspection As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

        End If

    End Sub


End Class
