Imports Microsoft.VisualBasic
Imports System.Data

Public Class clsRefProgramSources

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property description As String

    Public Property sortOrder As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

#End Region


    Public Sub initialize()
        _transId = ""
        _description = ""
        _sortOrder = "0"
        _isActive = ""
        _createUser = ""
        _createDate = ""
    End Sub


    Public Function browseRefProgramSources(ByVal _criteria As String) As DataTable
        Dim sql As String = ""

        Dim sqlWhere As String = ""

        If _criteria <> "" Then
            sqlWhere += "AND description LIKE '%" & _criteria & "%'"
        End If

        sql = "SELECT trans_id, description, sort_order, is_active, create_user, create_date FROM tbl_ref_program_sources " & _
         " WHERE is_active <> '' " & sqlWhere & _
         "ORDER BY sort_order "

        Return _clsDB.Fill_DataTable(sql, "tbl_ref_program_sources")
    End Function


    Public Sub saveRefProgramSources()
        If transId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "trans_id,description,sort_order,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_ref_program_sources", "INSERT")
                _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 5).ToUpper
                .ADDPARAM_CMD_String("trans_id", _transId)
                .ADDPARAM_CMD_String("description", _description)
                .ADDPARAM_CMD_String("sort_order", _sortOrder)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "description,sort_order,is_active,last_user,last_date"
                .sqlString = .getSQLStatement("tbl_ref_program_sources", "UPDATE", "trans_id")
                .ADDPARAM_CMD_String("description", _description)
                .ADDPARAM_CMD_String("sort_order", _sortOrder)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("last_user", _lastUser)
                .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
                .ADDPARAM_CMD_String("trans_id", _transId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub


    Public Sub getRefProgramSources(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_ref_program_sources WHERE trans_id='" & _id & "' LIMIT 1")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _description = dt.Rows(0)("description").ToString
            _sortOrder = dt.Rows(0)("sort_order").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub


End Class
