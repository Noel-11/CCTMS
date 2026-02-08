Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsWebserviceLog
    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub

#Region "Properties"

    Public Property id As String
    Public Property refcode As String
    Public Property functionName As String
    Public Property status As String
    Public Property ipAddress As String
    Public Property logDateTime As String
#End Region

    Public Sub initialize()
        id = ""
        refcode = ""
        functionName = ""
        status = ""
        ipAddress = ""
        logDateTime = ""
    End Sub

    Public Sub saveLog()

        With _clsDB.dbUtility
            .fieldItems = "refcode,function_name,status,ip_address,log_datetime"
            .sqlString = .getSQLStatement("tbl_webservice_log", "INSERT")
            .ADDPARAM_CMD_String("refcode", refcode)
            .ADDPARAM_CMD_String("function_name", functionName)
            .ADDPARAM_CMD_String("status", status)
            .ADDPARAM_CMD_String("ip_address", ipAddress)
            .ADDPARAM_CMD_String("log_datetime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

End Class
