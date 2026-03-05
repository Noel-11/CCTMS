Imports System.Data
Partial Class _Registration
    Inherits System.Web.UI.Page

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton
    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            hfTransId.Value = ""
            '  dtpPRCExpiration.Text = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd")
            getDll()
            getRegTypeForm()
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

    Private Sub getRegTypeForm()

        divPersonal.Visible = False
        divInstitution.Visible = False
        divProfession.Visible = False
        divPreferences.Visible = False

        If ddlRegType.SelectedValue = "INDIVIDUAL" Then
            divPersonal.Visible = True
            divProfession.Visible = True
            divPreferences.Visible = True

        ElseIf ddlRegType.SelectedValue = "INSTITUTION" Then
            divInstitution.Visible = True
        End If


    End Sub

    Protected Sub ddlRegType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlRegType.SelectedIndexChanged
        getRegTypeForm()
    End Sub

    'Protected Sub btnHome_ServerClick(sender As Object, e As EventArgs) Handles btnHome.ServerClick
    '    Response.Redirect("Default.aspx")
    'End Sub

    Private Sub getDll()

        _clsDB.populateDDLB(ddlRegType, "type_desc", "trans_id", "tbl_ref_training_applicant_type", "type_desc", " WHERE is_active = 'Y'", , "")
        ddlRegType.Items.RemoveAt(0)

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
            .applicantType = ddlRegType.SelectedValue
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

            If dtpPRCExpiration.Text = "" Then
                dtpPRCExpiration.Text = "0000-00-00"
            End If

            .prcExpiration = CDate(dtpPRCExpiration.Text).ToString("yyyy-MM-dd")
            .prefLearnTracks = dllPreferredTracks.SelectedValue
            .prefLearnTracksOthers = ""
            .prefLearnMode = ddlPreferredMode.SelectedValue
            .prefSched = ddlPreferredSched.SelectedValue
            .topicInterest = txtSpecificTopic.Text.Trim
            .programDiscovered = ddlHear.SelectedValue

            .lastUser = .lname & ", " & .fname
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

        msg = "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: auto; padding: 20px; border: 1px solid #e0e0e0; border-radius: 8px; background-color: #ffffff;'>" & _
              "<h2 style='color: #2c3e50; text-align: center;'>" & _
              "Registration Successful" & _
              "</h2> " & _
              "<p style='font-size: 15px; color: #555;'>" & _
              "Thank you for successfully registering for our program. We are pleased to confirm that we have received your registration details." & _
              "</p>" & _
              "<p style='font-size: 15px; color: #555;'>" & _
              "Please expect further updates regarding the schedule, venue/platform, and other important instructions to be sent to you via email. " & _
              "Kindly ensure that your contact details are active and regularly checked to avoid missing any announcements." & _
              "</p>" & _
              "<p style='font-size: 15px; color: #555;'>" & _
              "Should you have questions or concerns in the meantime, feel free to reach out to us at " & _
              "<a href='mailto:citycollegecdo.llpd@gmail.com' style='color: #0d6efd; text-decoration: none;'>" & _
              "citycollegecdo.llpd@ gmail.com" & _
              "</a>." & _
              "</p>" & _
              "<p style='font-size: 15px; color: #555;'> " & _
              "We look forward to your participation and hope you have a meaningful learning experience with us." & _
              "</p>" & _
              "<hr style='margin-top: 30px;'>" & _
              "<p style='text-align: center; font-size: 13px; color: #999;'>" & _
              "City College Training Management System" & _
              "</p>" & _
              "</hr>" & _
               "Use this credential to login to City College Online Training Application <br/>" & _
               "User: " & _clsRecord.userName & "<br/>" & _
               "Password: password <br/>" & _
               "Click this Link to login: https://services.cagayandeoro.gov.ph/cctms/Login.aspx" & _
               "<table width='100%' cellpadding='10'>" & _
                           " <tr>" & _
                               " <td align='center'>" & _
                                    "<img src='https://services.cagayandeoro.gov.ph/cctms/Images/ccLogo.png' width='100' alt='Logo 1'>" & _
                                    "</img>" & _
                               " <td align='center'>" & _
                                    "<img src='https://services.cagayandeoro.gov.ph/cctms/Images/CDOSeal.jpg' width='100' alt='Logo 1'>" & _
                                    "</img>" & _
                                "<td align='center'>" & _
                                    "<img src='https://services.cagayandeoro.gov.ph/cctms/Images/ICTLogo.png' width='100' alt='Logo 2'>" & _
                                    "</img>" & _
                            "</tr>" & _
                        "</table>"

        sendEmail(_clsRecord.emailAdd, msg)

    End Sub

    Protected Sub btnSaveRegistration_Click(sender As Object, e As EventArgs) Handles btnSaveRegistration.Click

        Dim dtCheckExist As New DataTable

        Dim sql As String = ""

        Dim errorMsg As String = ""

        'CHECK NAME DUPLICATE

        If ddlRegType.SelectedValue = "INSTITUTION" Then
            sql = "SELECT trans_id, lname, fname, mname, ename, institution_name FROM tbl_training_applicants " &
                  "WHERE institution_name = '" & txtInstitutionName.Text.Trim & "' LIMIT 1 "

        Else
            sql = "SELECT trans_id, lname, fname, mname, ename, institution_name FROM tbl_training_applicants " &
             "WHERE lname = '" & txtLName.Text.Trim.ToUpper & "' AND fname = '" & txtFName.Text.Trim.ToUpper & "' AND  " & _
             "ename = '" & ddlEName.SelectedValue & "' LIMIT 1"


        End If

        dtCheckExist = _clsDB.Fill_DataTable(sql)

        thisMsgBox.setModalType("SAVEXX")

        If dtCheckExist.Rows.Count > 0 Then

            If ddlRegType.SelectedValue = "INSTITUTION" Then
                errorMsg = "Institution already registered! <br/> " & _
                     "Name: " & dtCheckExist.Rows(0)("institution_name")
            Else
                errorMsg = "Name already registered! <br/> " & _
                      "Last Name: " & dtCheckExist.Rows(0)("lname") & "<br/>" & _
                      "First Name: " & dtCheckExist.Rows(0)("fname") & "<br/>" & _
                      "Middle Name: " & dtCheckExist.Rows(0)("mname") & "<br/>" & _
                      "Ext. Name: " & dtCheckExist.Rows(0)("ename")
            End If

            thisMsgBox.setError("Cannot Save", errorMsg)
        Else

            sql = "SELECT trans_id,email_add FROM tbl_training_applicants " &
            "WHERE email_add = '" & txtEmail.Text.Trim & "' LIMIT 1"

            dtCheckExist = _clsDB.Fill_DataTable(sql)

            If dtCheckExist.Rows.Count > 0 Then
                thisMsgBox.setError("Cannot Save", "Email Add already registered! <br/> " & _
                                               "Email Address: " & dtCheckExist.Rows(0)("email_add"))

            ElseIf chkDP1.Checked = False Or chkDP2.Checked = False Then
                thisMsgBox.setError("Cannot Save", "Just Kindly check the verification and consent to proceed")

            Else
                thisMsgBox.setModalType("SAVE")
                thisMsgBox.setConfirm(, "Are you sure to submit Registration?")
            End If

        End If

        thisMsgBox.showConfirmBox()

    End Sub

    Private Sub sendEmail(ByVal thisEmail As String, ByVal thisMsg As String)

        Dim _clsCommunicate As New clsCommunicate
        _clsCommunicate.sendGmail(thisEmail, "APPLICANT USER LOGIN", thisMsg)

    End Sub

    'Protected Sub chkDP1_CheckedChanged(sender As Object, e As EventArgs) Handles chkDP1.CheckedChanged

    '    thisMsgBox.setInfo(, "DPN " & chkDP1.Checked)
    '    thisMsgBox.showConfirmBox()

    'End Sub


End Class
