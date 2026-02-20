Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mail.SmtpClient

Public Class clsDatabase
    Public dbUtility As New clsDimboMySQL.clsMYSQLDatabase
    Public Sub New()

        If ConfigurationManager.AppSettings("conType").ToString = "local" Then
            dbUtility.Initialize_DB_MYSQL_WEB(ConfigurationManager.ConnectionStrings("mysqlDB").ConnectionString)
        Else

            dbUtility.Initialize_DB_MYSQL_WEB("Server=172.16.1.104;Initial Catalog='db_cctms';Persist Security Info=no;User Name='noel';Password='noel';default command timeout=360;Port=3607;Allow Zero Datetime=true;AllowUserVariables=True")
        End If

    End Sub

    Public Function Fill_DataTable(ByVal select_str As String, Optional ByVal table_name As String = "tbl_list") As DataTable
        Dim dtFill_DDL As New DataTable
        dbUtility.fillDataTable(dtFill_DDL, select_str, table_name)
        Return dtFill_DDL
    End Function

    Public Function Get_DB_Item(ByVal sql_str As String) As Object
        Return dbUtility.getItemFromSQLText(sql_str)
    End Function
    Public Sub Delete_Record(ByVal sql_str As String)
        dbUtility.sqlString = sql_str
        dbUtility.executeUsingCommandFromSQL(True)
    End Sub

    Public Sub populateDDLB(ByRef this_ddlb As DropDownList, ByVal this_displayvalue As String, ByVal this_datavalue As String, ByVal this_table As String, ByVal this_order As String, Optional ByVal this_parameter As String = "", Optional ByVal _firstItem As String = "..Select..", Optional ByVal _firstItemValue As String = "0")
        Dim dt As New DataTable
        Dim sql_str As String = ""

        If this_datavalue = this_displayvalue Then
            sql_str = "SELECT " & this_datavalue & " FROM " & this_table
        Else
            sql_str = "SELECT " & this_datavalue & "," & this_displayvalue & " FROM " & this_table
        End If

        If this_parameter <> "" Then
            sql_str = sql_str & this_parameter & " ORDER BY " & this_order
        Else
            sql_str = sql_str & " ORDER BY " & this_order
        End If

        dt = Fill_DataTable(sql_str)

        With this_ddlb
            .DataSource = dt
            .DataTextField = this_displayvalue
            .DataValueField = this_datavalue
            .DataBind()
            .Items.Insert(0, New ListItem(_firstItem, _firstItemValue))
        End With
    End Sub

    Public Sub Populate_DDLB_SQL(ByRef this_ddlb As DropDownList, ByVal this_displayvalue As String, ByVal this_datavalue As String, ByVal _sqlstr As String, Optional ByVal _firstItem As String = "... Please select ...", Optional ByVal _firstItemValue As String = "0")
        Dim dt As New DataTable

        dt = Fill_DataTable(_sqlstr)

        With this_ddlb
            .DataSource = dt
            .DataTextField = this_displayvalue
            .DataValueField = this_datavalue
            .DataBind()
            .Items.Insert(0, New ListItem(_firstItem, _firstItemValue))
        End With
    End Sub

    Public Function stringToBoolean(_yn As String) As Boolean
        If _yn = "Y" Then Return True

        Return False
    End Function

    Public Sub sendGmail(thisRecipient As String, thisSubject As String, thisMessage As String)
        Dim client As New SmtpClient("smtp.gmail.com", 587)
        client.EnableSsl = True
        client.UseDefaultCredentials = False
        Dim from As New MailAddress("lgucdoonlineservices@gmail.com", "[City Finance Office]")
        Dim [to] As New MailAddress(thisRecipient, thisRecipient)
        Dim message As New MailMessage(from, [to])
        message.Body = thisMessage & "<br/><br/>" & " This is a system generated email, please do not reply."
        message.IsBodyHtml = True
        message.Subject = thisSubject
        Dim myCreds As New NetworkCredential("lgucdoonlineservices@gmail.com", "derflez79", "")
        client.Credentials = myCreds
        Try
            client.Send(message)
        Catch ex As Exception

        End Try

    End Sub

    Public Function stringToInteger(thisString As String, Optional thisReturn As Integer = 0) As Integer

        Dim convertInt As Integer = 0

        Try
            convertInt = CInt(thisString)
        Catch ex As Exception
            convertInt = thisReturn
        End Try

        Return convertInt
    End Function
End Class
