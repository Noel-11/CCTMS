Imports System.Data
Partial Class _Registration
    Inherits System.Web.UI.Page

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton
    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            hfTransId.Value = ""
            getDll()
        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

        _btnNo = thisMsgBox.FindControl("btnMsgBoxNo")
        AddHandler _btnNo.ServerClick, AddressOf btnNo_Click

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If thisMsgBox.getModalType = "SAVE" Then
            saveInfo()
            thisMsgBox.setModalType("OKSAVE")
            thisMsgBox.setInfo(, "Submitted Succesfully! Check your email for your login credentials.")
            thisMsgBox.showConfirmBox()

        End If
    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If thisMsgBox.getModalType = "OKSAVE" Then
            Response.Redirect("Login.aspx")
        End If
    End Sub

    'Protected Sub btnHome_ServerClick(sender As Object, e As EventArgs) Handles btnHome.ServerClick
    '    Response.Redirect("Default.aspx")
    'End Sub

    Private Sub getDll()

        _clsDB.populateDDLB(ddlGender, "description", "trans_id", "tbl_ref_gender", "description", " WHERE is_active = 'Y'", , "")


        _clsDB.populateDDLB(ddlCivilStatus, "description", "trans_id", "tbl_ref_civil_status", "description", " WHERE is_active = 'Y'", , "")

        _clsDB.populateDDLB(ddlCityAddr, "description", "trans_id", "tbl_ref_city_province", "description", " WHERE is_active = 'Y'", , "")

        ddlCityAddr.Items.RemoveAt(0)
        ddlCityAddr.SelectedValue = "CAGAYAN DE ORO_D1"

        _clsDB.populateDDLB(dllEducation, "description", "trans_id", "tbl_ref_educ_attainment", "description", " WHERE is_active = 'Y'", , "")
        dllEducation.Items.RemoveAt(0)

        _clsDB.populateDDLB(dllPreferredTracks, "description", "trans_id", "tbl_ref_learning_tracks", "description", " WHERE is_active = 'Y'", , "")

        Dim dtTracks As New DataTable

        dtTracks = _clsDB.Fill_DataTable("SELECT trans_id,description,(CASE WHEN with_text = 'Y' THEN 'TRUE' ELSE 'FALSE' END) AS isOther FROM tbl_ref_learning_tracks " & _
                                         "WHERE is_active = 'Y' ORDER BY sort_order")
        _gvLearnTracks.DataSource = dtTracks
        _gvLearnTracks.DataBind()

        _clsDB.populateDDLB(ddlPreferredMode, "description", "trans_id", "tbl_ref_learning_mode", "description", " WHERE is_active = 'Y'", , "")

        _clsDB.populateDDLB(ddlPreferredSched, "description", "trans_id", "tbl_ref_preferred_schedule", "description", " WHERE is_active = 'Y'", , "")

        _clsDB.populateDDLB(ddlHear, "description", "trans_id", "tbl_ref_program_sources", "description", " WHERE is_active = 'Y'", , "")

    End Sub

    Private Sub saveInfo()

        Dim _clsRecord As New clsTrainingApplicants

        With _clsRecord
            .initialize()
            .transId = hfTransId.Value
            .lname = txtLName.Text.Trim.ToUpper
            .fname = txtFName.Text.Trim.ToUpper
            .mname = txtMName.Text.Trim.ToUpper
            .ename = ddlEName.SelectedValue
            .gender = ddlGender.SelectedValue
            .civilStatus = ddlCivilStatus.SelectedValue
            .contactNo = txtContactNo.Text.Trim
            .emailAdd = txtEmail.Text.Trim
            .homeAddr = txtHomeAddr.Text.Trim.ToUpper
            .cityProvince = ddlCityAddr.SelectedValue
            .profession = txtProfession.Text.Trim
            .educAttain = dllEducation.SelectedValue
            .position = txtPosition.Text.Trim.ToUpper
            .workplace = txtWorkPlace.Text.Trim.ToUpper
            .prcNo = txtPRCNo.Text.Trim
            .prcExpiration = CDate(dtpPRCExpiration.Text).ToString("yyyy-MM-dd")
            .prefLearnTracks = dllPreferredTracks.SelectedValue
            .prefLearnTracksOthers = ""
            .prefLearnMode = ddlPreferredMode.SelectedValue
            .prefSched = ddlPreferredSched.SelectedValue
            .topicInterest = txtSpecificTopic.Text.Trim
            .programDiscovered = ddlHear.SelectedValue
            '.userName = .lname
            .saveTrainingApplicants()

            hfTransId.Value = .transId

            'LEARNING TRACKS

            Dim _clsLearningTracks As New clsRefLearningTracks

            _clsLearningTracks.deleteLearningTracks(hfTransId.Value)

            For Each _gvRow As GridViewRow In _gvLearnTracks.Rows

                Dim _chkSel As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

                Dim _txtOther As TextBox = CType(_gvRow.FindControl("txtOthers"), TextBox)

                If _chkSel.Checked Then

                    With _clsLearningTracks
                        .applicantId = hfTransId.Value

                        .tracksId = _chkSel.Attributes("listId")
                        .tracksOther = _txtOther.Text.Trim
                        .lastUser = Session("UserName")
                        .saveTrainingApplicantsLearningTracks()
                    End With

                    If _chkSel.Attributes("listId") = "OTHER" Then

                        With _clsRecord
                            .transId = hfTransId.Value
                            .prefLearnTracksOthers = _txtOther.Text.Trim
                            .updateTracksOtherDetails()
                        End With

                    End If

                End If

            Next

        End With

        Dim msg As String = ""

        msg = "Good day," & _
               "Use this credential to login to City College Online Training Application <br/>" & _
               "User: " & _clsRecord.userName & "<br/>" & _
               "Password: password"

        sendEmail(_clsRecord.emailAdd, msg)

    End Sub

    Protected Sub btnSaveRegistration_Click(sender As Object, e As EventArgs) Handles btnSaveRegistration.Click

        thisMsgBox.setModalType("SAVE")
        thisMsgBox.setConfirm(, "Are you sure to submit Registration?")
        thisMsgBox.showConfirmBox()

    End Sub

    Private Sub sendEmail(ByVal thisEmail As String, ByVal thisMsg As String)

        Dim _clsCommunicate As New clsCommunicate
        _clsCommunicate.sendGmail(thisEmail, "APPLICANT USER LOGIN", thisMsg)

    End Sub

   
End Class
