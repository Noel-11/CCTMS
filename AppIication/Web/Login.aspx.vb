Imports System.Data
Partial Class _Login
    Inherits System.Web.UI.Page

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton
    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            ' Session.Remove("UserId")

        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

        _btnNo = thisMsgBox.FindControl("btnMsgBoxNo")
        AddHandler _btnNo.ServerClick, AddressOf btnNo_Click

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If thisMsgBox.getModalType = "PASSWORDCHANGED" Then

            updatePw()
            thisMsgBox.setModalType("PASSWORDCHANGEDOK")
            thisMsgBox.setInfo("Info", "Password updated Successfully! <br/> You can now Login with your new password. <br/> Click OK to login.")
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "btnCPClose", "document.getElementById('ctl00_cpConTent_btnCPClose').click();", True)
            thisMsgBox.showConfirmBox()
        End If
    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If thisMsgBox.getModalType = "RESETPASSWORD" Then
            Response.Redirect("Login.aspx")

        ElseIf thisMsgBox.getModalType = "PASSWORDCHANGEDOK" Then
            Dim _clsUserProfile As New clsTrainingApplicants

            'If _clsUserProfile.validateLogin(hfUserName.Value, txtCPassword.Text.Trim) = True Then
            With _clsUserProfile
                .getTrainingApplicants(hfUserId.Value)
                Session("APPLICANTID") = .transId
                Session("APPLICANTTYPE") = .applicantType
                Session("UserId") = .transId
                Session("USERNAME") = .lname & ", " & .fname
            End With

            saveLoginLog("SUCCESSFULL")

            Response.Redirect("Secured/Applicant/AppDashBoard.aspx")
            'End If


        End If
    End Sub

#Region "LOGIN"

    Private Sub login()

        Dim dt As New DataTable

        Dim _clsUserProfile As New clsTrainingApplicants

        Dim _clsUser As New clsUser

        divLoginError.Visible = False

        Try

            _clsUserProfile.getTrainingApplicantsUser(txtUserName.Text.Trim)

            hfUserId.Value = _clsUserProfile.transId
            hfUserName.Value = _clsUserProfile.userName

            If hfUserId.Value = "" Then
                divLoginError.Visible = True
            Else

                If _clsUserProfile.validateLogin(txtUserName.Text.Trim, txtPassword.Text.Trim) = True Then

                    If txtPassword.Text.Trim.ToLower = "password" Then

                        divCPPin.Visible = True
                        divCPSet.Visible = False

                        lblCPContact.Text = _clsUserProfile.emailAdd

                        sendCode(_clsUserProfile.emailAdd)

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlChangePassword", "var myModal = new bootstrap.Modal(document.getElementById('mdlChangePassword'), {});  myModal.show();", True)

                    Else
                        With _clsUserProfile
                            Session("APPLICANTID") = .transId
                            Session("APPLICANTTYPE") = .applicantType
                            Session("UserId") = .transId
                            Session("USERNAME") = .lname & ", " & .fname
                        End With

                        saveLoginLog("SUCCESSFULL")

                        Response.Redirect("Secured/Applicant/AppDashBoard.aspx")

                    End If

                Else

                    saveLoginLog("FAILED")
                    divLoginError.Visible = True

                End If

               
            End If

        Catch ex As Exception
            Session("UserId") = txtUserName.Text.Trim
            saveLoginLog("FAILED")

        End Try

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click

        login()

    End Sub

    'CHANGE PASSWORD
    Protected Sub btnCPVerPin_ServerClick(sender As Object, e As EventArgs) Handles btnCPVerPin.ServerClick

        Dim dtCheck As New DataTable

        Dim sql As String = ""

        sql = "SELECT trans_id FROM tbl_user_pin WHERE pin_code = '" & txtCPPin.Text.Trim & "' AND expiration_date > '" & DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") & "'  ORDER BY create_date DESC LIMIT 1"

        dtCheck = _clsDB.Fill_DataTable(sql, "tbl_user_pin")

        If dtCheck.Rows.Count > 0 Then
            divCPSet.Visible = True
            'divCPPin.Visible = True
        Else
            divCPSet.Visible = False
            divCPPin.Visible = True
            thisMsgBox.setError("Invalid Code!", "Authentication code Not found!")
            thisMsgBox.showConfirmBox()
        End If

    End Sub


    Protected Sub btnSavePassword_Click(sender As Object, e As EventArgs) Handles btnSavePassword.ServerClick

        Dim _clsUserProfile As New clsTrainingApplicants

        thisMsgBox.setModalType("PASSWORDCHANGEDXX")


        If _clsUserProfile.validateLogin(hfUserName.Value, txtCPassword.Text.Trim) = True And txtCPassword.Text = txtCRetypePassword.Text Then
            thisMsgBox.setError("Invalid", "It looks like you entered your current password. Please enter a different new password.!")
        Else

            If txtCPassword.Text <> txtCRetypePassword.Text Then
                thisMsgBox.setError("Invalid", "Password not match!")
            Else
                Dim _clsUtilPwValidator As New clsUtilPwValidator

                If _clsUtilPwValidator.validatePw(txtCPassword.Text) = False Then

                    thisMsgBox.setError("Invalid", "Password does not meet the required criteria.!<br/>" & _
                                           "• At least 8 characters<br/>" & _
                                           "• 1 uppercase letter<br/>" & _
                                           "• 1 number<br/>" & _
                                           "• 1 special character")

                Else

                    thisMsgBox.setModalType("PASSWORDCHANGED")

                    thisMsgBox.setConfirm(, "Are you sure to save this password?")

                End If

            End If

            End If

            thisMsgBox.showConfirmBox()

    End Sub

    Private Sub updatePw()

        Dim _clsRecord As New clsTrainingApplicants

        With _clsRecord
            .transId = hfUserId.Value
            .password = txtCPassword.Text.Trim
            .updateApplicantPassword()
        End With

    End Sub

    Private Sub saveLoginLog(ByVal _status As String)
        Dim _clsLoginLog As New clsLoginLog
        With _clsLoginLog
            .initialize()
            .userId = Session("UserId")
            .loginIp = GetIPAddress()
            .loginDatetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
            .loginStatus = _status
            .saveLoginLog()
        End With
    End Sub


    Public Shared Function GetIPAddress() As String
        Dim context As System.Web.HttpContext = System.Web.HttpContext.Current
        Dim sIPAddress As String = context.Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If String.IsNullOrEmpty(sIPAddress) Then
            Return context.Request.ServerVariables("REMOTE_ADDR")
        Else
            Dim ipArray As String() = sIPAddress.Split(New [Char]() {","c})
            Return ipArray(0)
        End If
    End Function

#End Region


#Region "FORGOT PASSWORD"

    Protected Sub aForgotP_ServerClick(sender As Object, e As EventArgs) Handles aForgotP.ServerClick

        pnlContact.Visible = True
        pnlPin.Visible = False
        pnlPassword.Visible = False

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlForgotPassword", "var myModal = new bootstrap.Modal(document.getElementById('mdlForgotPassword'), {});  myModal.show();", True)

    End Sub


    Protected Sub btnVerifyCel_ServerClick(sender As Object, e As EventArgs) Handles btnVerifyCel.ServerClick
        Try
            Dim _clsDB As New clsDatabase

            Dim dt As New DataTable

            dt = _clsDB.Fill_DataTable("SELECT trans_id, email_add FROM tbl_training_applicants WHERE email_add = '" & txtVerEmail.Text.Trim.ToUpper & "' AND password <> '' LIMIT 1")

            If dt.Rows.Count > 0 Then
                hfUserId.Value = dt.Rows(0)("trans_id").ToString
                hfEmailAdd.Value = dt.Rows(0)("email_add").ToString
            Else
                hfUserId.Value = ""
                hfEmailAdd.Value = ""
            End If

            lblPinContact.Text = ""

            If hfUserId.Value = "" Then
                thisMsgBox.setError("NOT FOUND!", "User Not Found or Not Registered!")
                pnlPassword.Visible = False
                pnlPin.Visible = False
            Else

                If hfEmailAdd.Value <> "" Then
                    thisMsgBox.setNotification("Record found!")
                    'pnlPassword.Visible = True

                    lblPinContact.Text = hfEmailAdd.Value
                    pnlPin.Visible = True
                    sendCode(hfEmailAdd.Value)
                Else
                    thisMsgBox.setError("Cannot Verify", "No Email Address found! ")
                End If

            End If

        Catch ex As Exception
            thisMsgBox.setError(, ex.Message)
        End Try

        thisMsgBox.showConfirmBox()
    End Sub

    Protected Sub btnVerify_ServerClick(sender As Object, e As EventArgs) Handles btnVerify.ServerClick

        Dim dtCheck As New DataTable

        Dim sql As String = ""

        sql = "SELECT trans_id FROM tbl_user_pin WHERE pin_code = '" & txtPinCode.Text.Trim & "' AND expiration_date > '" & DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") & "'  ORDER BY create_date DESC LIMIT 1"

        dtCheck = _clsDB.Fill_DataTable(sql, "tbl_user_pin")

        If dtCheck.Rows.Count > 0 Then
            pnlPassword.Visible = True
            pnlPin.Visible = False
        Else
            pnlPassword.Visible = False
            pnlPin.Visible = True
            thisMsgBox.setError("Invalid Code!", "Authentication code Not found!")
            thisMsgBox.showConfirmBox()
        End If

    End Sub


    Private Sub sendCode(ByVal _thisEmail As String)

        Dim _clsPayslipPin As New clsUserPin

        If _thisEmail <> "" Then

            With _clsPayslipPin
                .userId = hfUserId.Value
                .ipAddress = GetIPAddress()
                .pinCode = .getPin

                Dim _smsMsg As String = ""

                _smsMsg = "Your authentication code is : " & .pinCode

                Try
                    sendEmail(_thisEmail, _smsMsg)
                    .status = "SENT"
                Catch ex As Exception
                    .status = "NOT SENT"
                End Try

                .savePin()
            End With

        End If


    End Sub

    Private Sub sendEmail(ByVal thisEmail As String, ByVal thisMsg As String)

        Dim _clsCommunicate As New clsCommunicate
        _clsCommunicate.sendGmail(thisEmail, "APPLICANT USER VERIFICATION", thisMsg)

    End Sub


    Protected Sub btnRegSave_Click(sender As Object, e As EventArgs) Handles btnRegister.ServerClick

        If txtRegPasword.Text <> txtRetypeRegPasword.Text Then
            thisMsgBox.setError("Invalid", "Password not match!")
        Else

            Dim _clsUtilPwValidator As New clsUtilPwValidator

            If _clsUtilPwValidator.validatePw(txtRegPasword.Text) = False Then
                thisMsgBox.setError("Invalid", "Password does not meet the required criteria.!<br/>" & _
                                             "• At least 8 characters<br/>" & _
                                             "• 1 uppercase letter<br/>" & _
                                             "• 1 number<br/>" & _
                                             "• 1 special character")
            Else
                Dim _clsRecord As New clsTrainingApplicants

                With _clsRecord
                    .transId = hfUserId.Value
                    .password = txtRegPasword.Text.Trim
                    .updateApplicantPassword()
                End With

                thisMsgBox.setModalType("RESETPASSWORD")
                thisMsgBox.setInfo("Info", "Password updated Successfully! <br/> You can now Login with your new password.")

            End If

           
        End If

        thisMsgBox.showConfirmBox()

    End Sub

#End Region

   
End Class
