Imports System.Data
Imports Microsoft.Reporting.WebForms
Partial Class Secured_Reference_RefTrainingsAdd
    Inherits cPageInit_Secured_BS

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton

    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then


            hfTransId.Value = Session("REF_TRAINING_ID")

            _clsDB.populateDDLB(ddlLearningTracks, "description", "trans_id", "tbl_ref_learning_tracks", "description", " WHERE is_active = 'Y'", , "")

            _clsDB.populateDDLB(ddlPreferredMode, "description", "trans_id", "tbl_ref_learning_mode", "description", " WHERE is_active = 'Y'", , "")

            flllInfo()

        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

        _btnNo = thisMsgBox.FindControl("btnMsgBoxNo")
        AddHandler _btnNo.ServerClick, AddressOf btnNo_Click

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If thisMsgBox.getModalType = "SAVE TRAINING" Then

            saveRefTraining()
            'thisMsgBox.setNotification("")
            Response.Redirect("RefTrainingsAdd.aspx")

        End If

    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If thisMsgBox.getModalType = "SAVE TRAINING" Then


        End If

    End Sub

    Protected Sub btnHome_ServerClick(sender As Object, e As EventArgs) Handles btnHome.ServerClick
        Response.Redirect("RefTrainings.aspx")
    End Sub

    Private Sub isTracksOther()

        divTracksOther.Visible = False

        If ddlLearningTracks.SelectedValue = "OTHER" Then

            divTracksOther.Visible = True

        End If

    End Sub
    Protected Sub ddlLearningTracks_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlLearningTracks.SelectedIndexChanged
        isTracksOther()
    End Sub


    Private Sub flllInfo()

        Dim _clsRefTrainings As New clsRefTrainings
        isTracksOther()

        With _clsRefTrainings

            .getRefTrainings(hfTransId.Value)
            txtTrainingTitle.Text = .trainingTitle
            txtDescription.Text = .trainingDescription
            ddlPreferredMode.SelectedValue = .learningMode
            ddlLearningTracks.SelectedValue = .learningTracks
            txtLearningTracksOther.Text = .learningTracksOther
            rblIsactive.SelectedValue = .isActive
        End With

    End Sub


    Private Sub saveRefTraining()

        Dim _clsRefTrainings As New clsRefTrainings

        With _clsRefTrainings

            .transId = hfTransId.Value
            .trainingTitle = txtTrainingTitle.Text.Trim.ToUpper
            .trainingDescription = txtDescription.Text.Trim.ToUpper
            .learningMode = ddlPreferredMode.SelectedValue
            .learningTracks = ddlLearningTracks.SelectedValue
            .learningTracksOther = txtLearningTracksOther.Text.Trim.ToUpper
            .isActive = rblIsactive.SelectedValue
            .lastUser = Session("UserName")
            .saveRefTrainings()

            Session("REF_TRAINING_ID") = .transId
        End With

    End Sub

    Protected Sub btnSaveTraining_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        thisMsgBox.setModalType("SAVE TRAINING")
        thisMsgBox.setConfirm(, "Are you sure to save this training title?")
        thisMsgBox.showConfirmBox()
    End Sub

   
End Class

