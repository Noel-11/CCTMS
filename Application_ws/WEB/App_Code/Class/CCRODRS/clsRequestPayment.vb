Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsRequestPayment

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property reqId As String

    Public Property refCode As String

    Public Property rLname As String

    Public Property rFname As String

    Public Property rMname As String

    Public Property reqType As String

    Public Property totalAmount As String

    Public Property isPaid As String

    Public Property orNumber As String

    Public Property financePaid As String

    Public Property financeOr As String

    Public Property financeMode As String

    Public Property financeDateTime As String

    Public Property isActive As String

    Public Property lastUser As String

    Public Property createDate As String

#End Region

    Public Sub initialize()
        _transId = ""
        _reqId = ""
        _refCode = ""
        _rLname = ""
        _rFname = ""
        _rMname = ""
        _reqType = ""
        _totalAmount = "0"
        _isPaid = "N"
        _orNumber = ""
        _isActive = "Y"
        _lastUser = ""
        _createDate = ""

        financePaid = "N"
        financeOr = ""
        financeMode = "WALKIN"

    End Sub


    Public Function browseRequestPayment(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT trans_id, req_id, ref_code, r_lname, r_fname, r_mname, req_type, copy_count, copy_amount, total_amount, is_paid, is_active, create_user, create_date, FROM tbl_request_payment " & _
        " WHERE trans_id LIKE '%" & _criteria & "%' OR req_id LIKE '%" & _criteria & "%' OR ref_code LIKE '%" & _criteria & "%' OR r_lname LIKE '%" & _criteria & "%' OR r_fname LIKE '%" & _criteria & "%' OR r_mname LIKE '%" & _criteria & "%' OR req_type LIKE '%" & _criteria & "%' OR copy_count LIKE '%" & _criteria & "%' OR copy_amount LIKE '%" & _criteria & "%' OR total_amount LIKE '%" & _criteria & "%' OR is_paid LIKE '%" & _criteria & "%' OR is_active LIKE '%" & _criteria & "%' OR create_user LIKE '%" & _criteria & "%' OR create_date LIKE '%" & _criteria & "%' OR  ORDER BY "
        Return _clsDB.Fill_DataTable(sql, "tbl_request_payment")
    End Function


    Public Sub saveRequestPayment()
        'If transId = "" Then
        With _clsDB.dbUtility
            .fieldItems = "trans_id,req_id,ref_code,r_lname,r_fname,r_mname,req_type,total_amount,is_paid,is_active,create_user,create_date"
            .sqlString = .getSQLStatement("tbl_request_payment", "INSERT")
            _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            .ADDPARAM_CMD_String("trans_id", _transId)
            .ADDPARAM_CMD_String("req_id", _reqId)
            .ADDPARAM_CMD_String("ref_code", _refCode)
            .ADDPARAM_CMD_String("r_lname", _rLname)
            .ADDPARAM_CMD_String("r_fname", _rFname)
            .ADDPARAM_CMD_String("r_mname", _rMname)
            .ADDPARAM_CMD_String("req_type", _reqType)
            .ADDPARAM_CMD_String("total_amount", _totalAmount)
            .ADDPARAM_CMD_String("is_paid", _isPaid)
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("create_user", _lastUser)
            .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
            .executeUsingCommandFromSQL(True)
        End With
        'Else
        '    With _clsDB.dbUtility
        '        .fieldItems = "req_id,ref_code,r_lname,r_fname,r_mname,req_type,copy_count,copy_amount,total_amount,is_paid,is_active"
        '        .sqlString = .getSQLStatement("tbl_request_payment", "UPDATE", "trans_id")
        '        .ADDPARAM_CMD_String("req_id", _reqId)
        '        .ADDPARAM_CMD_String("ref_code", _refCode)
        '        .ADDPARAM_CMD_String("r_lname", _oLname)
        '        .ADDPARAM_CMD_String("r_fname", _oFname)
        '        .ADDPARAM_CMD_String("r_mname", _oMname)
        '        .ADDPARAM_CMD_String("req_type", _copyType)
        '        .ADDPARAM_CMD_String("copy_count", _copyCount)
        '        .ADDPARAM_CMD_String("copy_amount", _copyAmount)
        '        .ADDPARAM_CMD_String("total_amount", _totalAmount)
        '        .ADDPARAM_CMD_String("is_paid", _isPaid)
        '        .ADDPARAM_CMD_String("is_active", _isActive)
        '        .ADDPARAM_CMD_String("trans_id", _transId)
        '        .executeUsingCommandFromSQL(True)
        '    End With
        'End If
    End Sub

    Public Sub updateIsActive()

        With _clsDB.dbUtility
            .fieldItems = "is_active"
            .sqlString = .getSQLStatement("tbl_request_payment", "UPDATE", "req_id")
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("req_id", _reqId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updateIsPaid()

        With _clsDB.dbUtility
            .fieldItems = "is_paid,or_number,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_request_payment", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("is_paid", _isPaid)
            .ADDPARAM_CMD_String("or_number", _ornumber)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updateIsPaidFinance()

        With _clsDB.dbUtility
            .fieldItems = "finance_paid,finance_or,finance_mode,finance_datetime,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_request_payment", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("finance_paid", _financePaid)
            .ADDPARAM_CMD_String("finance_or", _financeOr)
            .ADDPARAM_CMD_String("finance_mode", _financeMode)
            .ADDPARAM_CMD_String("finance_datetime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub


    Public Sub getRequestPayment(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_request_payment WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _reqId = dt.Rows(0)("req_id").ToString
            _refCode = dt.Rows(0)("ref_code").ToString
            _rLname = dt.Rows(0)("r_lname").ToString
            _rFname = dt.Rows(0)("r_fname").ToString
            _rMname = dt.Rows(0)("r_mname").ToString
            _reqType = dt.Rows(0)("req_type").ToString
            _totalAmount = dt.Rows(0)("total_amount").ToString
            _isPaid = dt.Rows(0)("is_paid").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

    Public Sub getRequestPaymentReqID(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_request_payment WHERE req_id='" & _id & "' AND is_active = 'Y'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _reqId = dt.Rows(0)("req_id").ToString
            _refCode = dt.Rows(0)("ref_code").ToString
            _rLname = dt.Rows(0)("r_lname").ToString
            _rFname = dt.Rows(0)("r_fname").ToString
            _rMname = dt.Rows(0)("r_mname").ToString
            _reqType = dt.Rows(0)("req_type").ToString
            _totalAmount = dt.Rows(0)("total_amount").ToString
            _isPaid = dt.Rows(0)("is_paid").ToString
            _isActive = dt.Rows(0)("is_active").ToString
            _orNumber = dt.Rows(0)("or_number").ToString
        Else
            initialize()
        End If
    End Sub

End Class
