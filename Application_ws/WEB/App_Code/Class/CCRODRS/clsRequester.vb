Imports Microsoft.VisualBasic
Imports System.Data

Public Class clsRequester


    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property refCode As String

    Public Property reqStatus As String

    Public Property rLname As String

    Public Property rFname As String

    Public Property rMname As String

    Public Property rProvince As String

    Public Property rCity As String

    Public Property rBarangay As String

    Public Property rAddress As String

    Public Property rCelno As String

    Public Property rEmail As String

    Public Property pDateTime As String

    Public Property cLName As String

    Public Property cFName As String

    Public Property cMName As String

    Public Property cDateTime As String

    Public Property reqDatetime As String

    Public Property valDatetime As String

    Public Property reqRemarks As String

    Public Property isActive As String

    Public Property createDate As String

    Public Property createUser As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region
    Public Sub initialize()
        _transId = ""
        _refCode = ""
        _reqStatus = ""
        _rLname = ""
        _rFname = ""
        _rMname = ""
        _rProvince = ""
        _rCity = ""
        _rBarangay = ""
        _rAddress = ""
        _rCelno = ""
        _rEmail = ""
        _reqDatetime = Nothing
        _valDatetime = Nothing
        _reqRemarks = ""
        _isActive = "Y"
        _createDate = ""
        _createUser = ""
        _lastUser = ""
        _lastDate = ""
        _pDateTime = Nothing
        _cLName = ""
        _cFName = ""
        _cMName = ""
        _cDateTime = Nothing

    End Sub


    Public Function browseRequester(ByVal _thisRefCode As String, ByVal _thisLName As String, ByVal _thisFName As String, ByVal _thisStatus As String) As DataTable
        Dim sql As String = ""

        Dim sqlWhere As String = ""

        If _thisRefCode <> "" Then
            sqlWhere = "AND ref_code LIKE '" & _thisRefCode & "%' "
        End If

        If _thisLName <> "" Then
            sqlWhere += "AND r_lname LIKE '" & _thisLName & "%' "
        End If

        If _thisFName <> "" Then
            sqlWhere += "AND r_fname LIKE '" & _thisFName & "%' "
        End If

        If _thisStatus <> "" Then
            sqlWhere += "AND req_status = '" & _thisStatus & "' "
        End If

        sql = "SELECT trans_id,ref_code,r_lname,r_fname,r_mname, " & _
              "CONCAT(r_address,(CASE WHEN r_address <> '' THEN ', ' ELSE '' END),barangay) AS address, " & _
              "DATE_FORMAT(req_datetime,'%m/%d/%Y %h:%i:%s %p') AS req_datetime,DATE_FORMAT(val_datetime,'%m/%d/%Y %h:%i:%s %p') AS val_datetime,req_status " & _
              "FROM tbl_requester " & _
              "INNER JOIN tbl_ref_barangay ON tbl_requester.r_barangay = tbl_ref_barangay.barangay_code " & _
              "WHERE is_active = 'Y' " & sqlWhere & _
              "ORDER BY req_datetime DESC"

        Return _clsDB.Fill_DataTable(sql, "tbl_requester")
    End Function


    Public Function browseRequesterPickup(ByVal _thisRefCode As String, ByVal _thisLName As String, ByVal _thisFName As String, ByVal _thisStatus As String) As DataTable
        Dim sql As String = ""

        Dim sqlWhere As String = ""

        If _thisRefCode <> "" Then
            sqlWhere = "AND ref_code LIKE '" & _thisRefCode & "%' "
        End If

        If _thisLName <> "" Then
            sqlWhere += "AND r_lname LIKE '" & _thisLName & "%' "
        End If

        If _thisFName <> "" Then
            sqlWhere += "AND r_fname LIKE '" & _thisFName & "%' "
        End If

        If _thisStatus <> "" Then
            sqlWhere += "AND req_status = '" & _thisStatus & "' "
        End If

        sql = "SELECT trans_id,ref_code,r_lname,r_fname,r_mname, " & _
              "CONCAT(r_address,', ',barangay) AS address, " & _
              "DATE_FORMAT(p_datetime,'%m/%d/%Y %h:%i:%s %p') AS p_datetime,DATE_FORMAT(c_datetime,'%m/%d/%Y %h:%i:%s %p') AS c_datetime,req_status " & _
              "FROM tbl_requester " & _
              "INNER JOIN tbl_ref_barangay ON tbl_requester.r_barangay = tbl_ref_barangay.barangay_code " & _
              "WHERE is_active = 'Y' " & sqlWhere & _
              "ORDER BY p_datetime ASC"

        Return _clsDB.Fill_DataTable(sql, "tbl_requester")
    End Function


    Public Sub saveRequester()
        'If transId = "" Then
        With _clsDB.dbUtility
            .fieldItems = "trans_id,ref_code,req_status,r_lname,r_fname,r_mname,r_province,r_city,r_barangay,r_address,r_celno,r_email,req_datetime,val_datetime,is_active,create_date,create_user"
            .sqlString = .getSQLStatement("tbl_requester", "INSERT")
            _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            .ADDPARAM_CMD_String("trans_id", _transId)
            .ADDPARAM_CMD_String("ref_code", _refCode)
            .ADDPARAM_CMD_String("req_status", _reqStatus)
            .ADDPARAM_CMD_String("r_lname", _rLname)
            .ADDPARAM_CMD_String("r_fname", _rFname)
            .ADDPARAM_CMD_String("r_mname", _rMname)
            .ADDPARAM_CMD_String("r_province", _rProvince)
            .ADDPARAM_CMD_String("r_city", _rCity)
            .ADDPARAM_CMD_String("r_barangay", _rBarangay)
            .ADDPARAM_CMD_String("r_address", _rAddress)
            .ADDPARAM_CMD_String("r_celno", _rCelno)
            .ADDPARAM_CMD_String("r_email", _rEmail)
            .ADDPARAM_CMD_String("req_datetime", _reqDatetime)
            .ADDPARAM_CMD_String("val_datetime", _valDatetime)
            .ADDPARAM_CMD_String("is_active", "Y")
            .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("create_user", _lastUser)
            .executeUsingCommandFromSQL(True)
        End With
        'Else
        '    With _clsDB.dbUtility
        '        .fieldItems = "ref_code,req_status,r_lname,r_fname,r_mname,r_province,r_city,r_barangay,r_address,r_celno,r_email,req_datetime,val_datetime,is_active,last_user,last_date"
        '        .sqlString = .getSQLStatement("tbl_requester", "UPDATE", "trans_id")
        '        .ADDPARAM_CMD_String("ref_code", _refCode)
        '        .ADDPARAM_CMD_String("req_status", _reqStatus)
        '        .ADDPARAM_CMD_String("r_lname", _rLname)
        '        .ADDPARAM_CMD_String("r_fname", _rFname)
        '        .ADDPARAM_CMD_String("r_mname", _rMname)
        '        .ADDPARAM_CMD_String("r_province", _rProvince)
        '        .ADDPARAM_CMD_String("r_city", _rCity)
        '        .ADDPARAM_CMD_String("r_barangay", _rBarangay)
        '        .ADDPARAM_CMD_String("r_address", _rAddress)
        '        .ADDPARAM_CMD_String("r_celno", _rCelno)
        '        .ADDPARAM_CMD_String("r_email", _rEmail)
        '        .ADDPARAM_CMD_String("req_datetime", _reqDatetime)
        '        .ADDPARAM_CMD_String("val_datetime", _valDatetime)
        '        .ADDPARAM_CMD_String("is_active", _isActive)
        '        .ADDPARAM_CMD_String("last_user", _lastUser)
        '        .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
        '        .ADDPARAM_CMD_String("trans_id", _transId)
        '        .executeUsingCommandFromSQL(True)
        '    End With
        'End If
    End Sub

    Public Sub updateRequester()

        With _clsDB.dbUtility
            .fieldItems = "r_lname,r_fname,r_mname,r_province,r_city,r_barangay,r_address,r_celno,r_email,req_datetime,is_active,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_requester", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("r_lname", _rLname)
            .ADDPARAM_CMD_String("r_fname", _rFname)
            .ADDPARAM_CMD_String("r_mname", _rMname)
            .ADDPARAM_CMD_String("r_province", _rProvince)
            .ADDPARAM_CMD_String("r_city", _rCity)
            .ADDPARAM_CMD_String("r_barangay", _rBarangay)
            .ADDPARAM_CMD_String("r_address", _rAddress)
            .ADDPARAM_CMD_String("r_celno", _rCelno)
            .ADDPARAM_CMD_String("r_email", _rEmail)
            .ADDPARAM_CMD_String("req_datetime", _reqDatetime)
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updateReqStatus()

        With _clsDB.dbUtility
            .fieldItems = "req_status,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_requester", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("req_status", _reqStatus)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updateValidationStatus()

        With _clsDB.dbUtility
            .fieldItems = "req_status,val_datetime,req_remarks,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_requester", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("req_status", _reqStatus)
            .ADDPARAM_CMD_String("val_datetime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .ADDPARAM_CMD_String("req_remarks", _reqremarks)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updatePickup()

        With _clsDB.dbUtility
            .fieldItems = "p_datetime"
            .sqlString = .getSQLStatement("tbl_requester", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("p_datetime", _pDateTime)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updateClaimants()

        With _clsDB.dbUtility
            .fieldItems = "c_lname,c_fname,c_mname,c_datetime,val_datetime,req_remarks,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_requester", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("c_lname", _cLName)
            .ADDPARAM_CMD_String("c_fname", _cFName)
            .ADDPARAM_CMD_String("c_mname", _cMName)
            .ADDPARAM_CMD_String("c_datetime", _cDateTime)
            .ADDPARAM_CMD_String("val_datetime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .ADDPARAM_CMD_String("req_remarks", _reqRemarks)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub getRequester(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_requester WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _refCode = dt.Rows(0)("ref_code").ToString
            _reqStatus = dt.Rows(0)("req_status").ToString
            _rLname = dt.Rows(0)("r_lname").ToString
            _rFname = dt.Rows(0)("r_fname").ToString
            _rMname = dt.Rows(0)("r_mname").ToString
            _rProvince = dt.Rows(0)("r_province").ToString
            _rCity = dt.Rows(0)("r_city").ToString
            _rBarangay = dt.Rows(0)("r_barangay").ToString
            _rAddress = dt.Rows(0)("r_address").ToString
            _rCelno = dt.Rows(0)("r_celno").ToString
            _rEmail = dt.Rows(0)("r_email").ToString
            _reqDatetime = dt.Rows(0)("req_datetime").ToString
            _valDatetime = dt.Rows(0)("val_datetime").ToString
            _isActive = dt.Rows(0)("is_active").ToString
            _pDateTime = dt.Rows(0)("p_datetime").ToString
        Else
            initialize()
        End If
    End Sub

    Public Sub getRequesterDetails(ByVal _id As String)

        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT tbl_requester.trans_id,ref_code,req_status,r_lname, r_fname, r_mname, province AS r_province, " & _
                                   "c_lname,c_fname,c_mname,DATE_FORMAT(c_datetime,'%m/%d/%Y %h:%i %p') AS c_datetime, " & _
                                   "municipality AS r_city, barangay as r_barangay, r_address, r_celno, r_email, req_datetime, val_datetime, is_active  FROM tbl_requester " & _
                                   "INNER JOIN tbl_ref_province ON tbl_requester.r_province = tbl_ref_province.province_code " & _
                                   "INNER JOIN tbl_ref_municipality ON tbl_requester.r_city = tbl_ref_municipality.municipality_code " & _
                                   "INNER JOIN tbl_ref_barangay ON tbl_requester.r_barangay = tbl_ref_barangay.barangay_code WHERE trans_id='" & _id & "' LIMIT 1")


        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _refCode = dt.Rows(0)("ref_code").ToString
            _reqStatus = dt.Rows(0)("req_status").ToString
            _rLname = dt.Rows(0)("r_lname").ToString
            _rFname = dt.Rows(0)("r_fname").ToString
            _rMname = dt.Rows(0)("r_mname").ToString
            _rProvince = dt.Rows(0)("r_province").ToString
            _rCity = dt.Rows(0)("r_city").ToString
            _rBarangay = dt.Rows(0)("r_barangay").ToString
            _rAddress = dt.Rows(0)("r_address").ToString
            _rCelno = dt.Rows(0)("r_celno").ToString
            _rEmail = dt.Rows(0)("r_email").ToString
            _reqDatetime = dt.Rows(0)("req_datetime").ToString
            _valDatetime = dt.Rows(0)("val_datetime").ToString
            _isActive = dt.Rows(0)("is_active").ToString
            _cLName = dt.Rows(0)("c_lname").ToString
            _cFName = dt.Rows(0)("c_fname").ToString
            _cMName = dt.Rows(0)("c_mname").ToString
            _cDateTime = dt.Rows(0)("c_datetime").ToString
        Else
            initialize()
        End If


    End Sub

End Class
