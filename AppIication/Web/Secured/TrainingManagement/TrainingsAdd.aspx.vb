Imports System.Data
Partial Class Secured_TrainingManagement_TrainingsAdd
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton

    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            hfTransId.Value = Session("TRAINING_ID")

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
        End If

    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub


    Protected Sub btnHome_ServerClick(sender As Object, e As EventArgs) Handles btnHome.ServerClick
        Response.Redirect("Trainings.aspx")
    End Sub


    Private Sub flllInfo()

        Dim _clsTraining As New clsTraining


        txtTrainingTitle.ReadOnly = False
        txtDescription.ReadOnly = False
        txtTrainingSlots.ReadOnly = False

        divAttendees.Visible = False
        divApplicants.Visible = False

        If hfTransId.Value <> "" Then

            spanTainingHead.InnerText = "UPDATE TRAINING"

            txtTrainingTitle.ReadOnly = True
            txtDescription.ReadOnly = True
            txtTrainingSlots.ReadOnly = True

            With _clsTraining
                .getTraining(hfTransId.Value)
                dtpTrainingDate.Text = CDate(.trainingDate).ToString("yyyy-MM-dd")
                txtTrainingTitle.Text = .trainingTitle
                txtDescription.Text = .trainingDesc
                txtTrainingSlots.Text = .trainingSlots
                txtOtherDetails.Text = .otherDetails

            End With

            divAttendees.Visible = True
            divApplicants.Visible = True

            fillGvAttendees()
            fillGvApplicantions()

        Else
            spanTainingHead.InnerText = "CREATE TRAINING"

        End If

    End Sub

    Private Sub saveTraining()

        Dim _clsRecord As New clsTraining

        With _clsRecord
            .initialize()
            .transId = hfTransId.Value
            .trainingDate = CDate(dtpTrainingDate.Text).ToString("yyyy-MM-dd")
            .trainingTime = ""
            .trainingTitle = txtTrainingTitle.Text.Trim.ToUpper
            .trainingDesc = txtDescription.Text.Trim.ToUpper
            .trainingSlots = txtTrainingSlots.Text.Trim.ToUpper
            .otherDetails = txtOtherDetails.Text.Trim
            .lastUser = Session("UserName")
            .saveTraining()

            Session("TRAINING_ID") = .transId

        End With

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


    End Sub

#End Region

#Region "APPLICANTS"

    Protected Sub fillGvApplicantions()

        Dim dt As New DataTable

        Dim _clsRecords As New clsTrainingApplications

        dt = _clsRecords.browseTrainingApplications(hfTransId.Value)

        _gvApplicants.DataSource = dt
        _gvApplicants.DataBind()


    End Sub

#End Region

End Class
