Imports System.Data
Partial Class _DataPrivacy
    Inherits System.Web.UI.Page

    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then


        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    'Public Shared Function GetIPAddress() As String
    '    Dim context As System.Web.HttpContext = System.Web.HttpContext.Current
    '    Dim sIPAddress As String = context.Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    '    If String.IsNullOrEmpty(sIPAddress) Then
    '        Return context.Request.ServerVariables("REMOTE_ADDR")
    '    Else
    '        Dim ipArray As String() = sIPAddress.Split(New [Char]() {","c})
    '        Return ipArray(0)
    '    End If
    'End Function


End Class
