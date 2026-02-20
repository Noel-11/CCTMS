Imports Microsoft.VisualBasic
Imports System.Data
Partial Class Secured_Applicant_AppComplete
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

        Dim _clsRecord As New clsTrainingAttendance

        dt = _clsRecord.browseCompletedTrainings(hfTransId.Value)

        _gvTraining.DataSource = dt
        _gvTraining.DataBind()

    End Sub

#Region "VIEW"

    Protected Sub cmdGVView(ByVal sender As Object, ByVal e As CommandEventArgs)

        lblTrainingDate.Text = CType(sender, Button).Attributes("trainingDate")
        lblTrainingTitle.Text = CType(sender, Button).Attributes("title")
        lblDescription.Text = CType(sender, Button).Attributes("description")
        lblVenue.Text = CType(sender, Button).Attributes("venue")
        lblOtherDescription.Text = CType(sender, Button).Attributes("otherDetails")
        lblIsPresent.Text = CType(sender, Button).Attributes("isPresent")

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlView", "var myModal = new bootstrap.Modal(document.getElementById('mdlView'), {});  myModal.show();", True)

    End Sub

#End Region


End Class
