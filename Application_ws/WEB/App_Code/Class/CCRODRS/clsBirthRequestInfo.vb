Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsBirthRequestInfo

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub

#Region "Properties"
    Public Property transId As String

    Public Property refCode As String

    Public Property reqStatus As String

    Public Property copyType As String

    Public Property copyCount As String

    Public Property sex As String

    Public Property oLname As String

    Public Property oFname As String

    Public Property oMname As String

    Public Property oBdate As String

    Public Property oBplaceCountry As String

    Public Property oBplaceProvince As String

    Public Property oBplaceCity As String

    Public Property fLname As String

    Public Property fFname As String

    Public Property fMname As String

    Public Property mLname As String

    Public Property mFname As String

    Public Property mMname As String

    Public Property purpose As String

    Public Property purposeSpecific As String

    Public Property rLname As String

    Public Property rFname As String

    Public Property rMname As String

    Public Property rProvince As String

    Public Property rCity As String

    Public Property rBarangay As String

    Public Property rAddress As String

    Public Property rCelno As String

    Public Property rEmail As String

    Public Property reqDatetime As String

    Public Property valDatetime As String

    Public Property isActive As String

    Public Property createDate As String

    Public Property createUser As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region


    Public Sub initialize()
        _transId = ""
        _refCode = ""
        _reqStatus = "VERIFICATION"
        _copyType = ""
        _copyCount = ""
        _sex = ""
        _oLname = ""
        _oFname = ""
        _oMname = ""
        _oBdate = ""
        _oBplaceCountry = "PHILIPPINES"
        _oBplaceProvince = "1043"
        _oBplaceCity = "104305"
        _fLname = ""
        _fFname = ""
        _fMname = ""
        _mLname = ""
        _mFname = ""
        _mMname = ""
        _purpose = ""
        _purposeSpecific = ""
        _rLname = ""
        _rFname = ""
        _rMname = ""
        _rProvince = ""
        _rCity = ""
        _rBarangay = ""
        _rAddress = ""
        _rCelno = ""
        _rEmail = ""
        _reqDatetime = ""
        _valDatetime = Nothing
        _isActive = "Y"
        _createDate = ""
        _createUser = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browseBirthRequestInfo(ByVal _thisRefCode As String, ByVal _thisLName As String, ByVal _thisFName As String, ByVal _thisStatus As String) As DataTable
        Dim sql As String = ""

        Dim sqlWhere As String = ""

        If _thisRefCode <> "" Then
            sqlWhere = "AND ref_code LIKE '" & _thisRefCode & "%' "
        End If

        If _thisLName <> "" Then
            sqlWhere += "AND o_lname LIKE '" & _thisLName & "%' "
        End If

        If _thisFName <> "" Then
            sqlWhere += "AND o_fname LIKE '" & _thisFName & "%' "
        End If

        If _thisStatus <> "" Then
            sqlWhere += "AND req_status = '" & _thisStatus & "' "
        End If

        sql = "SELECT trans_id,ref_code,o_lname,o_fname,o_mname,DATE_FORMAT(o_bdate,'%m/%d/%Y') AS o_bdate, " & _
              "CONCAT(r_address,', ',barangay,', ',municipality,', ',province) AS address, " & _
              "DATE_FORMAT(req_datetime,'%m/%d/%Y %h:%i:%s %p') AS req_datetime,req_status " & _
              "FROM tbl_birth_request_info " & _
              "INNER JOIN tbl_ref_barangay ON tbl_birth_request_info.r_barangay = tbl_ref_barangay.barangay_code " & _
              "INNER JOIN tbl_ref_municipality ON tbl_birth_request_info.r_city = tbl_ref_municipality.municipality_code " & _
              "INNER JOIN tbl_ref_province ON tbl_birth_request_info.r_province = tbl_ref_province.province_code " & _
              "WHERE is_active = 'Y' " & sqlWhere & _
              "ORDER BY req_datetime DESC"

        Return _clsDB.Fill_DataTable(sql, "tbl_birth_request_info")
    End Function


    Public Sub saveBirthRequestInfo()
        'If transId = "" Then
        Dim _count As Integer = 0

        Try
            _count = _clsDB.Get_DB_Item("SELECT COUNT(*) FROM tbl_birth_request_info WHERE is_active = 'Y' LIMIT 1")
        Catch ex As Exception
            _count = 0
        End Try

        _count += 1

        With _clsDB.dbUtility
            .fieldItems = "trans_id,ref_code,req_status,copy_type,copy_count,sex,o_lname,o_fname,o_mname,o_bdate,o_bplace_country,o_bplace_province,o_bplace_city,f_lname,f_fname,f_mname,m_lname,m_fname,m_mname,purpose,purpose_specific,r_lname,r_fname,r_mname,r_province,r_city,r_barangay,r_address,r_celno,r_email,req_datetime,val_datetime,is_active,create_date,create_user"
            .sqlString = .getSQLStatement("tbl_birth_request_info", "INSERT")
            _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            '_refCode = DateTime.Now.ToString("yyMM") & Left(Guid.NewGuid().ToString.Replace("-", ""), 7).ToUpper
            '_refCode = DateTime.Now.ToString("yyMM") & _count.ToString("0000000")
            .ADDPARAM_CMD_String("trans_id", _transId)
            .ADDPARAM_CMD_String("ref_code", _refCode)
            .ADDPARAM_CMD_String("req_status", _reqStatus)
            .ADDPARAM_CMD_String("copy_type", _copyType)
            .ADDPARAM_CMD_String("copy_count", _copyCount)
            .ADDPARAM_CMD_String("sex", _sex)
            .ADDPARAM_CMD_String("o_lname", _oLname)
            .ADDPARAM_CMD_String("o_fname", _oFname)
            .ADDPARAM_CMD_String("o_mname", _oMname)
            .ADDPARAM_CMD_String("o_bdate", _oBdate)
            .ADDPARAM_CMD_String("o_bplace_country", _oBplaceCountry)
            .ADDPARAM_CMD_String("o_bplace_province", _oBplaceProvince)
            .ADDPARAM_CMD_String("o_bplace_city", _oBplaceCity)
            .ADDPARAM_CMD_String("f_lname", _fLname)
            .ADDPARAM_CMD_String("f_fname", _fFname)
            .ADDPARAM_CMD_String("f_mname", _fMname)
            .ADDPARAM_CMD_String("m_lname", _mLname)
            .ADDPARAM_CMD_String("m_fname", _mFname)
            .ADDPARAM_CMD_String("m_mname", _mMname)
            .ADDPARAM_CMD_String("purpose", _purpose)
            .ADDPARAM_CMD_String("purpose_specific", _purposeSpecific)
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
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("create_user", _lastUser)
            .executeUsingCommandFromSQL(True)
        End With
        'Else
        '    With _clsDB.dbUtility
        '        .fieldItems = "ref_code,req_status,copy_type,copy_count,sex,o_lname,o_fname,o_mname,o_bdate,o_bplace_country,o_bplace_province,o_bplace_city,f_lname,f_fname,f_mname,m_lname,m_fname,m_mname,purpose,purpose_specific,r_lname,r_fname,r_mname,r_province,r_city,r_barangay,r_address,r_celno,r_email,req_datetime,val_datetime,is_active,last_user,last_date"
        '        .sqlString = .getSQLStatement("tbl_birth_request_info", "UPDATE", "trans_id")
        '        .ADDPARAM_CMD_String("ref_code", _refCode)
        '        .ADDPARAM_CMD_String("req_status", _reqStatus)
        '        .ADDPARAM_CMD_String("copy_type", _copyType)
        '        .ADDPARAM_CMD_String("copy_count", _copyCount)
        '        .ADDPARAM_CMD_String("sex", _sex)
        '        .ADDPARAM_CMD_String("o_lname", _oLname)
        '        .ADDPARAM_CMD_String("o_fname", _oFname)
        '        .ADDPARAM_CMD_String("o_mname", _oMname)
        '        .ADDPARAM_CMD_String("o_bdate", _oBdate)
        '        .ADDPARAM_CMD_String("o_bplace_country", _oBplaceCountry)
        '        .ADDPARAM_CMD_String("o_bplace_province", _oBplaceProvince)
        '        .ADDPARAM_CMD_String("o_bplace_city", _oBplaceCity)
        '        .ADDPARAM_CMD_String("f_lname", _fLname)
        '        .ADDPARAM_CMD_String("f_fname", _fFname)
        '        .ADDPARAM_CMD_String("f_mname", _fMname)
        '        .ADDPARAM_CMD_String("m_lname", _mLname)
        '        .ADDPARAM_CMD_String("m_fname", _mFname)
        '        .ADDPARAM_CMD_String("m_mname", _mMname)
        '        .ADDPARAM_CMD_String("purpose", _purpose)
        '        .ADDPARAM_CMD_String("purpose_specific", _purposeSpecific)
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

    Public Sub updateStatus()

        With _clsDB.dbUtility
            .fieldItems = "req_status,val_datetime,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_birth_request_info", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("req_status", _reqStatus)
            .ADDPARAM_CMD_String("val_datetime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub getBirthRequestInfo(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_birth_request_info WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _refCode = dt.Rows(0)("ref_code").ToString
            _reqStatus = dt.Rows(0)("req_status").ToString
            _copyType = dt.Rows(0)("copy_type").ToString
            _copyCount = dt.Rows(0)("copy_count").ToString
            _sex = dt.Rows(0)("sex").ToString
            _oLname = dt.Rows(0)("o_lname").ToString
            _oFname = dt.Rows(0)("o_fname").ToString
            _oMname = dt.Rows(0)("o_mname").ToString
            _oBdate = dt.Rows(0)("o_bdate").ToString
            _oBplaceCountry = dt.Rows(0)("o_bplace_country").ToString
            _oBplaceProvince = dt.Rows(0)("o_bplace_province").ToString
            _oBplaceCity = dt.Rows(0)("o_bplace_city").ToString
            _fLname = dt.Rows(0)("f_lname").ToString
            _fFname = dt.Rows(0)("f_fname").ToString
            _fMname = dt.Rows(0)("f_mname").ToString
            _mLname = dt.Rows(0)("m_lname").ToString
            _mFname = dt.Rows(0)("m_fname").ToString
            _mMname = dt.Rows(0)("m_mname").ToString
            _purpose = dt.Rows(0)("purpose").ToString
            _purposeSpecific = dt.Rows(0)("purpose_specific").ToString
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
        Else
            initialize()
        End If
    End Sub

    Public Sub getBirthRequestInfoDetails(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT tbl_birth_request_info.trans_id,ref_code,req_status,tbl_ref_request_type.type_desc AS copy_type, copy_count, o_lname, o_fname, o_mname, o_bdate, " & _
                                   "sex, f_lname, f_fname, f_mname, m_lname, m_fname, m_mname,tbl_ref_purpose.purpose_desc AS purpose, purpose_specific, " & _
                                   "r_lname, r_fname, r_mname, province AS r_province, municipality AS r_city, barangay as r_barangay, " & _
                                   "r_address, r_celno, r_email FROM tbl_birth_request_info " & _
                                   "INNER JOIN tbl_ref_request_type ON tbl_birth_request_info.copy_type = tbl_ref_request_type.trans_id " & _
                                   "INNER JOIN tbl_ref_purpose ON tbl_birth_request_info.purpose = tbl_ref_purpose.trans_id " & _
                                   "INNER JOIN tbl_ref_province ON tbl_birth_request_info.r_province = tbl_ref_province.province_code " & _
                                   "INNER JOIN tbl_ref_municipality ON tbl_birth_request_info.r_city = tbl_ref_municipality.municipality_code " & _
                                   "INNER JOIN tbl_ref_barangay ON tbl_birth_request_info.r_barangay = tbl_ref_barangay.barangay_code " & _
                                   "WHERE tbl_birth_request_info.trans_id = '" & _id & "' LIMIT 1")


        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _refCode = dt.Rows(0)("ref_code").ToString
            _reqStatus = dt.Rows(0)("req_status").ToString
            _copyType = dt.Rows(0)("copy_type").ToString
            _copyCount = dt.Rows(0)("copy_count").ToString
            _sex = dt.Rows(0)("sex").ToString
            _oLname = dt.Rows(0)("o_lname").ToString
            _oFname = dt.Rows(0)("o_fname").ToString
            _oMname = dt.Rows(0)("o_mname").ToString
            _oBdate = dt.Rows(0)("o_bdate").ToString
            _fLname = dt.Rows(0)("f_lname").ToString
            _fFname = dt.Rows(0)("f_fname").ToString
            _fMname = dt.Rows(0)("f_mname").ToString
            _mLname = dt.Rows(0)("m_lname").ToString
            _mFname = dt.Rows(0)("m_fname").ToString
            _mMname = dt.Rows(0)("m_mname").ToString
            _purpose = dt.Rows(0)("purpose").ToString
            _purposeSpecific = dt.Rows(0)("purpose_specific").ToString
            _rLname = dt.Rows(0)("r_lname").ToString
            _rFname = dt.Rows(0)("r_fname").ToString
            _rMname = dt.Rows(0)("r_mname").ToString
            _rProvince = dt.Rows(0)("r_province").ToString
            _rCity = dt.Rows(0)("r_city").ToString
            _rBarangay = dt.Rows(0)("r_barangay").ToString
            _rAddress = dt.Rows(0)("r_address").ToString
            _rCelno = dt.Rows(0)("r_celno").ToString
            _rEmail = dt.Rows(0)("r_email").ToString
          
        Else
            initialize()
        End If
    End Sub


End Class
