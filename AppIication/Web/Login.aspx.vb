Imports System.Data
Partial Class _Login
    Inherits System.Web.UI.Page

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            ' Session.Remove("UserId")

        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

#Region "LOGIN"

    Private Sub login()

        Dim dt As New DataTable

        Dim _clsUserProfile As New clsTrainingApplicants

        Dim _clsUser As New clsUser

        Try
            If _clsUserProfile.validatePassword(txtUserName.Text.Trim, txtPassword.Text.Trim) = True Then
                With _clsUserProfile
                    Session("APPLICANTID") = .transId
                    Session("UserId") = .transId
                    Session("USERNAME") = .lname & ", " & .fname

                End With

                Response.Redirect("Secured/Applicant/AppDashBoard.aspx")

            Else

                If _clsUser.validateUserLogon(txtUserName.Text.Trim, txtPassword.Text.Trim) = True Then
                    With _clsUser
                        .getUserInformation(txtUserName.Text.Trim)
                        Session("UserId") = .userID
                        Session("UserRoleId") = .userRoleID
                        Session("UserName") = .userName
                        'Session("UserFieldDistrict") = .fieldDistrict
                    End With

                    saveLoginLog("SUCCESS")

                    Dim _clsCMS As New clsCMS
                    Dim dtMenuHeader As New DataTable
                    dtMenuHeader.Clear()
                    dtMenuHeader = _clsCMS.browseSecureCMSMenuHeaderPermissionByModule(Session("UserId"), Session("UserRoleId"), Session("MODULE"))

                    If dtMenuHeader.Rows.Count > 0 Then

                        Dim dtHomePermission As DataTable
                        dtHomePermission = _clsCMS.browseSecureCMSMenuHeaderPermissionHome(Session("UserId"), Session("UserRoleId"), Session("MODULE"))
                        If dtHomePermission.Rows.Count > 0 Then
                            Response.Redirect("~/Secured/DashBoard.aspx")
                        Else
                            Response.Redirect("~/Secured/Default.aspx")
                        End If
                    End If
                End If

            End If
        Catch ex As Exception
            Session("UserId") = txtUserName.Text.Trim
            saveLoginLog("FAIL")
          
        End Try


    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        login()
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

End Class
