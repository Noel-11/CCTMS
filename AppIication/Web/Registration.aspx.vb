Imports System.Data
Partial Class _Registration
    Inherits System.Web.UI.Page

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton
    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            hfTransId.Value = ""

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
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub btnHome_ServerClick(sender As Object, e As EventArgs) Handles btnHome.ServerClick
        Response.Redirect("Default.aspx")
    End Sub

    Private Sub getDll()

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
            .cityProvince = dllCityAddr.SelectedValue
            .profession = txtProfession.Text.Trim
            .educAttain = dllEducation.SelectedValue
            .position = txtPosition.Text.Trim.ToUpper
            .workplace = txtWorkPlace.Text.Trim.ToUpper
            .prcNo = txtPRCNo.Text.Trim
            .prcExpiration = CDate(dtpPRCExpiration.Text).ToString("yyyy-MM-dd")
            .prefLearnTracks = dllPreferredTracks.SelectedValue
            .prefLearnMode = ddlPreferredMode.SelectedValue
            .prefSched = ddlPreferredSched.SelectedValue
            .topicInterest = txtSpecificTopic.Text.Trim
            .programDiscovered = txtSpecificTopic.Text.Trim
            .userName = .lname
            .saveTrainingApplicants()
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
