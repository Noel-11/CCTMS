Imports System.Data
Partial Class Secured_Applicant_AppProfile
    Inherits cPageInit_Secured_Client

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton
    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            hfTransId.Value = Session("APPLICANTID")
            dtpPRCExpiration.Text = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd")
            getDll()
            fillInfo()
        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

        _btnNo = thisMsgBox.FindControl("btnMsgBoxNo")
        AddHandler _btnNo.ServerClick, AddressOf btnNo_Click

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If thisMsgBox.getModalType = "SAVE" Then
            saveInfo()
            fillInfo()
            thisMsgBox.setModalType("OKSAVE")
            thisMsgBox.setInfo(, "Profile Saved!")
            thisMsgBox.showConfirmBox()

        ElseIf thisMsgBox.getModalType = "CHANGE PASSWORD" Then
            changePassword()
            thisMsgBox.setInfo(, "Password Changed!")
            thisMsgBox.showConfirmBox()
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "btnCPClose", "document.getElementById('ctl00_cpConTent_btnCPClose').click();", True)

        End If
    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If thisMsgBox.getModalType = "OKSAVE" Then
            ' Response.Redirect("Default.aspx")
        End If
    End Sub

    Private Sub getDll()

        _clsDB.populateDDLB(ddlGender, "description", "trans_id", "tbl_ref_gender", "description", " WHERE is_active = 'Y'", , "")

        _clsDB.populateDDLB(ddlCivilStatus, "description", "trans_id", "tbl_ref_civil_status", "description", " WHERE is_active = 'Y'", , "")

        _clsDB.populateDDLB(ddlCityAddr, "description", "trans_id", "tbl_ref_city_province", "description", " WHERE is_active = 'Y'", , "")

        ddlCityAddr.Items.RemoveAt(0)
        ddlCityAddr.SelectedValue = "CAGAYAN DE ORO_D1"

        _clsDB.populateDDLB(dllEducation, "description", "trans_id", "tbl_ref_educ_attainment", "description", " WHERE is_active = 'Y'", , "")
        dllEducation.Items.RemoveAt(0)

        _clsDB.populateDDLB(dllPreferredTracks, "description", "trans_id", "tbl_ref_learning_tracks", "description", " WHERE is_active = 'Y'", , "")

        _clsDB.populateDDLB(ddlPreferredMode, "description", "trans_id", "tbl_ref_learning_mode", "description", " WHERE is_active = 'Y'", , "")

        _clsDB.populateDDLB(ddlPreferredSched, "description", "trans_id", "tbl_ref_preferred_schedule", "description", " WHERE is_active = 'Y'", , "")

        _clsDB.populateDDLB(ddlHear, "description", "trans_id", "tbl_ref_program_sources", "description", " WHERE is_active = 'Y'", , "")

    End Sub

    Private Sub getRegTypeForm(ByVal _thisType As String)

        divPersonal.Visible = False
        divInstitution.Visible = False
        divProfession.Visible = False
        divPreferences.Visible = False

        If _thisType = "INDIVIDUAL" Then
            divPersonal.Visible = True
            divProfession.Visible = True
            divPreferences.Visible = True

        ElseIf _thisType = "INSTITUTION" Then
            divInstitution.Visible = True
        End If


    End Sub

    Private Sub fillInfo()
        Dim _clsRecord As New clsTrainingApplicants

        With _clsRecord
            .getTrainingApplicants(hfTransId.Value)
            getRegTypeForm(.applicantType)
            txtInstitutionName.Text = .institutionName
            txtInstContact.Text = .contactNo
            txtInstEmail.Text = .emailAdd
            txtLName.Text = .lname
            txtFName.Text = .fname
            txtMName.Text = .mname
            ddlEName.SelectedValue = .ename
            ddlGender.SelectedValue = .gender
            ddlCivilStatus.SelectedValue = .civilStatus
            txtContactNo.Text = .contactNo
            txtEmail.Text = .emailAdd
            txtHomeAddr.Text = .homeAddr
            ddlCityAddr.SelectedValue = .cityProvince
            txtProfession.Text = .profession
            dllEducation.SelectedValue = .educAttain
            txtPosition.Text = .position
            txtWorkPlace.Text = .workplace
            txtPRCNo.Text = .prcNo
            dtpPRCExpiration.Text = .prcExpiration
            'dllPreferredTracks.SelectedValue = .prefLearnTracks
            ddlPreferredMode.SelectedValue = .prefLearnMode
            ddlPreferredSched.SelectedValue = .prefSched
            txtSpecificTopic.Text = .topicInterest
            ddlHear.SelectedValue = .programDiscovered

        End With

        fillGVTracks()

    End Sub

    Protected Sub fillGVTracks()

        Dim dtTracks As New DataTable
        Dim sql As String = ""

        sql = "SELECT tbl_ref_learning_tracks.trans_id,description,(CASE WHEN with_text = 'Y' THEN 'TRUE' ELSE 'FALSE' END) AS isOther, " & _
              "(CASE WHEN COALESCE(tbl_training_applicants_learning_tracks.trans_id,'') <> '' THEN 'TRUE' ELSE 'FALSE' END) AS isChecked FROM tbl_ref_learning_tracks " & _
              "LEFT JOIN tbl_training_applicants_learning_tracks ON tbl_ref_learning_tracks.trans_id = tbl_training_applicants_learning_tracks.tracks_id AND " & _
              "tbl_training_applicants_learning_tracks.applicant_id = '" & hfTransId.Value & "' AND tbl_training_applicants_learning_tracks.is_active = 'Y' " & _
              "WHERE tbl_ref_learning_tracks.is_active = 'Y' " & _
              "ORDER BY tbl_ref_learning_tracks.sort_order "

        dtTracks = _clsDB.Fill_DataTable(sql)
        _gvLearnTracks.DataSource = dtTracks
        _gvLearnTracks.DataBind()

    End Sub

    Private Sub saveInfo()

        Dim _clsRecord As New clsTrainingApplicants

        With _clsRecord
            .initialize()
            .transId = hfTransId.Value
            .institutionName = txtInstitutionName.Text.Trim.ToUpper
            .lname = txtLName.Text.Trim.ToUpper
            .fname = txtFName.Text.Trim.ToUpper
            .mname = txtMName.Text.Trim.ToUpper
            .ename = ddlEName.SelectedValue
            .gender = ddlGender.SelectedValue
            .civilStatus = ddlCivilStatus.SelectedValue
            .contactNo = IIf(.applicantType = "INDIVIDUAL", txtContactNo.Text.Trim, txtInstContact.Text.Trim)
            .emailAdd = IIf(.applicantType = "INDIVIDUAL", txtEmail.Text.Trim, txtInstEmail.Text.Trim)
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

    End Sub

    Protected Sub btnSaveRegistration_Click(sender As Object, e As EventArgs) Handles btnSaveRegistration.Click

        thisMsgBox.setModalType("SAVE")
        thisMsgBox.setConfirm(, "Are you sure to save Info?")
        thisMsgBox.showConfirmBox()

    End Sub


#Region "PASSWORD"

    Protected Sub btnChangePassword_Click(sender As Object, e As EventArgs) Handles btnChangePassword.Click
        ' txtPinCode.Text = ""
        txtRegPasword.Text = ""
        txtRetypeRegPasword.Text = ""
        '  pnlPin.Visible = False
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlPassword", "var myModal = new bootstrap.Modal(document.getElementById('mdlPassword'), {});  myModal.show();", True)
    End Sub

    Protected Sub btnRegSave_Click(sender As Object, e As EventArgs) Handles btnSavePassword.ServerClick

        thisMsgBox.setModalType("CHANGE PASSWORDXX")

        Dim _clsApplicant As New clsTrainingApplicants

        With _clsApplicant
            .getTrainingApplicants(hfTransId.Value)
        End With

        If _clsApplicant.validateLogin(_clsApplicant.userName, txtCurrentPassword.Text) = False Then
            thisMsgBox.setError("Wrong Password", "Invalid Current Password!")
        Else

            If txtRegPasword.Text <> txtRetypeRegPasword.Text Then
                thisMsgBox.setError("Invalid", "Password not match!")

            Else

                If txtCurrentPassword.Text = txtRegPasword.Text Then
                    thisMsgBox.setError("Invalid", "It looks like you entered your current password. Please enter a different new password.!")
                Else
                    Dim _clsUtilPwValidator As New clsUtilPwValidator

                    If _clsUtilPwValidator.validatePw(txtRegPasword.Text) = False Then
                        thisMsgBox.setError("Invalid", "Password does not meet the required criteria.!<br/>" & _
                                              "• At least 8 characters<br/>" & _
                                              "• 1 uppercase letter<br/>" & _
                                              "• 1 number<br/>" & _
                                              "• 1 special character")
                    Else
                        hfCpNewPw.Value = txtRegPasword.Text.Trim
                        thisMsgBox.setModalType("CHANGE PASSWORD")
                        thisMsgBox.setConfirm(, "Are you sure to change your Password?")
                    End If
                End If

            End If

        End If

        thisMsgBox.showConfirmBox()

    End Sub

    Private Sub changePassword()
        Dim _clsEmpInfo As New clsTrainingApplicants

        With _clsEmpInfo
            .transId = hfTransId.Value
            .password = hfCpNewPw.Value
            .updateApplicantPassword()
        End With

    End Sub


#End Region

  
End Class
