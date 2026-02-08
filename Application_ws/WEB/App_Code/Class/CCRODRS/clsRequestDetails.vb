Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsRequestDetails

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property reqId As String

    Public Property copyType As String

    Public Property copyCount As String

    Public Property copyAmount As String

    Public Property copyTotal As String

    Public Property isAvailable As String

    Public Property isActive As String

    Public Property lastUser As String

    Public Property createDate As String

#End Region


    Public Sub initialize()
        _transId = ""
        _reqId = ""
        _copyType = ""
        _copyCount = "0"
        _copyAmount = "0"
        _copyTotal = "0"
        _isAvailable = "N"
        _isActive = "Y"
        _lastUser = ""
        _createDate = ""
    End Sub


    Public Function browseRequestDetails(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT trans_id, req_id, copy_type, copy_count, copy_amount, copy_total, is_active, create_user, create_date, FROM tbl_request_details " & _
        " WHERE trans_id LIKE '%" & _criteria & "%' OR req_id LIKE '%" & _criteria & "%' OR copy_type LIKE '%" & _criteria & "%' OR copy_count LIKE '%" & _criteria & "%' OR copy_amount LIKE '%" & _criteria & "%' OR copy_total LIKE '%" & _criteria & "%' OR is_active LIKE '%" & _criteria & "%' OR create_user LIKE '%" & _criteria & "%' OR create_date LIKE '%" & _criteria & "%' OR  ORDER BY "
        Return _clsDB.Fill_DataTable(sql, "tbl_request_details")
    End Function


    Public Sub saveRequestDetails()
        'If transId = "" Then
        With _clsDB.dbUtility
            .fieldItems = "trans_id,req_id,copy_type,copy_count,copy_amount,copy_total,is_active,create_user,create_date"
            .sqlString = .getSQLStatement("tbl_request_details", "INSERT")
            _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            .ADDPARAM_CMD_String("trans_id", _transId)
            .ADDPARAM_CMD_String("req_id", _reqId)
            .ADDPARAM_CMD_String("copy_type", _copyType)
            .ADDPARAM_CMD_String("copy_count", _copyCount)
            .ADDPARAM_CMD_String("copy_amount", _copyAmount)
            .ADDPARAM_CMD_String("copy_total", _copyTotal)
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("create_user", _lastUser)
            .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
            .executeUsingCommandFromSQL(True)
        End With
        'Else
        '    With _clsDB.dbUtility
        '        .fieldItems = "req_id,copy_type,copy_count,copy_amount,copy_total,is_active"
        '        .sqlString = .getSQLStatement("tbl_request_details", "UPDATE", "trans_id")
        '        .ADDPARAM_CMD_String("req_id", _reqId)
        '        .ADDPARAM_CMD_String("copy_type", _copyType)
        '        .ADDPARAM_CMD_String("copy_count", _copyCount)
        '        .ADDPARAM_CMD_String("copy_amount", _copyAmount)
        '        .ADDPARAM_CMD_String("copy_total", _copyTotal)
        '        .ADDPARAM_CMD_String("is_active", _isActive)
        '        .ADDPARAM_CMD_String("trans_id", _transId)
        '        .executeUsingCommandFromSQL(True)
        '    End With
        'End If
    End Sub

    Public Sub updateIsActive()

        With _clsDB.dbUtility
            .fieldItems = "is_active"
            .sqlString = .getSQLStatement("tbl_request_details", "UPDATE", "req_id")
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("req_id", _reqId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updateIsAvailable()

        With _clsDB.dbUtility
            .fieldItems = "is_available,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_request_details", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("is_available", _isAvailable)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub getRequestDetails(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_request_details WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _reqId = dt.Rows(0)("req_id").ToString
            _copyType = dt.Rows(0)("copy_type").ToString
            _copyCount = dt.Rows(0)("copy_count").ToString
            _copyAmount = dt.Rows(0)("copy_amount").ToString
            _copyTotal = dt.Rows(0)("copy_total").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub


    Public Sub deleteDocType()

        _clsDB.Delete_Record("DELETE FROM tbl_request_details WHERE req_id = '" & _reqId & "'")

    End Sub

End Class
