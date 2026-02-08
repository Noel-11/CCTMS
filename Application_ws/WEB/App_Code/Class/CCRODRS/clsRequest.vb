Imports Microsoft.VisualBasic
Imports System.Data

Public Class clsRequest

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub

#Region "Properties"
    Public Property transId As String

    Public Property newTransId As String

    Public Property requesterId As String

    Public Property reqType As String

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

    Public Property wLname As String

    Public Property wFname As String

    Public Property wMname As String

    Public Property marriageDate As String

    Public Property marriagePlace As String

    Public Property purpose As String

    Public Property purposeSpecific As String

    Public Property deathDate As String

    Public Property deathPlace As String

    Public Property relOwner As String

    Public Property isAvailable As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region

    Public Sub initialize()
        _transId = ""
        _requesterId = ""
        _reqType = ""
        _sex = "M"
        _oLname = ""
        _oFname = ""
        _oMname = ""
        _oBdate = Nothing
        _oBplaceCountry = ""
        _oBplaceProvince = ""
        _oBplaceCity = ""
        _fLname = ""
        _fFname = ""
        _fMname = ""
        _mLname = ""
        _mFname = ""
        _mMname = ""
        _wLname = ""
        _wFname = ""
        _wMname = ""
        _marriageDate = Nothing
        _marriagePlace = Nothing
        _purpose = ""
        _purposeSpecific = ""
        _deathDate = Nothing
        _deathPlace = ""
        _relOwner = "SELF"
        _isAvailable = "X"
        _isActive = "Y"
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browseRequest(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT trans_id, requester_id, req_type, sex, o_lname, o_fname, o_mname, o_bdate, o_bplace_country, o_bplace_province, o_bplace_city, f_lname, f_fname, f_mname, m_lname, m_fname, m_mname, w_lname, w_fname, w_mname, marriage_date, marriage_place, purpose, purpose_specific, death_date, death_place, is_active, create_user, create_date, last_user, last_date, FROM tbl_request " & _
        " WHERE trans_id LIKE '%" & _criteria & "%' OR requester_id LIKE '%" & _criteria & "%' OR req_type LIKE '%" & _criteria & "%' OR sex LIKE '%" & _criteria & "%' OR o_lname LIKE '%" & _criteria & "%' OR o_fname LIKE '%" & _criteria & "%' OR o_mname LIKE '%" & _criteria & "%' OR o_bdate LIKE '%" & _criteria & "%' OR o_bplace_country LIKE '%" & _criteria & "%' OR o_bplace_province LIKE '%" & _criteria & "%' OR o_bplace_city LIKE '%" & _criteria & "%' OR f_lname LIKE '%" & _criteria & "%' OR f_fname LIKE '%" & _criteria & "%' OR f_mname LIKE '%" & _criteria & "%' OR m_lname LIKE '%" & _criteria & "%' OR m_fname LIKE '%" & _criteria & "%' OR m_mname LIKE '%" & _criteria & "%' OR w_lname LIKE '%" & _criteria & "%' OR w_fname LIKE '%" & _criteria & "%' OR w_mname LIKE '%" & _criteria & "%' OR marriage_date LIKE '%" & _criteria & "%' OR marriage_place LIKE '%" & _criteria & "%' OR purpose LIKE '%" & _criteria & "%' OR purpose_specific LIKE '%" & _criteria & "%' OR death_date LIKE '%" & _criteria & "%' OR death_place LIKE '%" & _criteria & "%' OR is_active LIKE '%" & _criteria & "%' OR create_user LIKE '%" & _criteria & "%' OR create_date LIKE '%" & _criteria & "%' OR last_user LIKE '%" & _criteria & "%' OR last_date LIKE '%" & _criteria & "%' OR  ORDER BY "
        Return _clsDB.Fill_DataTable(sql, "tbl_request")
    End Function


    Public Sub saveRequest()
        If transId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "trans_id,requester_id,req_type,sex,o_lname,o_fname,o_mname,o_bdate,o_bplace_country,o_bplace_province,o_bplace_city,f_lname,f_fname,f_mname,m_lname,m_fname,m_mname,w_lname,w_fname,w_mname,marriage_date,marriage_place,purpose,purpose_specific,death_date,death_place,rel_owner,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_request", "INSERT")
                _transId = _newTransId
                .ADDPARAM_CMD_String("trans_id", _transId)
                .ADDPARAM_CMD_String("requester_id", _requesterId)
                .ADDPARAM_CMD_String("req_type", _reqType)
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
                .ADDPARAM_CMD_String("w_lname", _wLname)
                .ADDPARAM_CMD_String("w_fname", _wFname)
                .ADDPARAM_CMD_String("w_mname", _wMname)
                .ADDPARAM_CMD_String("marriage_date", _marriageDate)
                .ADDPARAM_CMD_String("marriage_place", _marriagePlace)
                .ADDPARAM_CMD_String("purpose", _purpose)
                .ADDPARAM_CMD_String("purpose_specific", _purposeSpecific)
                .ADDPARAM_CMD_String("death_date", _deathDate)
                .ADDPARAM_CMD_String("death_place", _deathPlace)
                .ADDPARAM_CMD_String("rel_owner", _relOwner)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "requester_id,req_type,sex,o_lname,o_fname,o_mname,o_bdate,o_bplace_country,o_bplace_province,o_bplace_city,f_lname,f_fname,f_mname,m_lname,m_fname,m_mname,w_lname,w_fname,w_mname,marriage_date,marriage_place,purpose,purpose_specific,death_date,death_place,rel_owner,is_active,last_user,last_date"
                .sqlString = .getSQLStatement("tbl_request", "UPDATE", "trans_id")
                .ADDPARAM_CMD_String("requester_id", _requesterId)
                .ADDPARAM_CMD_String("req_type", _reqType)
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
                .ADDPARAM_CMD_String("w_lname", _wLname)
                .ADDPARAM_CMD_String("w_fname", _wFname)
                .ADDPARAM_CMD_String("w_mname", _wMname)
                .ADDPARAM_CMD_String("marriage_date", _marriageDate)
                .ADDPARAM_CMD_String("marriage_place", _marriagePlace)
                .ADDPARAM_CMD_String("purpose", _purpose)
                .ADDPARAM_CMD_String("purpose_specific", _purposeSpecific)
                .ADDPARAM_CMD_String("death_date", _deathDate)
                .ADDPARAM_CMD_String("death_place", _deathPlace)
                .ADDPARAM_CMD_String("rel_owner", _relOwner)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("last_user", _lastUser)
                .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
                .ADDPARAM_CMD_String("trans_id", _transId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub


    Public Sub updateIsActive()

        With _clsDB.dbUtility
            .fieldItems = "is_active,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_request", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub


    Public Sub updateIsAvailable()

        With _clsDB.dbUtility
            .fieldItems = "is_available,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_request", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("is_available", _isAvailable)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub


    Public Sub getRequest(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_request WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _requesterId = dt.Rows(0)("requester_id").ToString
            _reqType = dt.Rows(0)("req_type").ToString
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
            _wLname = dt.Rows(0)("w_lname").ToString
            _wFname = dt.Rows(0)("w_fname").ToString
            _wMname = dt.Rows(0)("w_mname").ToString
            _marriageDate = dt.Rows(0)("marriage_date").ToString
            _marriagePlace = dt.Rows(0)("marriage_place").ToString
            _purpose = dt.Rows(0)("purpose").ToString
            _purposeSpecific = dt.Rows(0)("purpose_specific").ToString
            _deathDate = dt.Rows(0)("death_date").ToString
            _deathPlace = dt.Rows(0)("death_place").ToString
            _isActive = dt.Rows(0)("is_active").ToString
            _relOwner = dt.Rows(0)("rel_owner").ToString
        Else
            initialize()
        End If
    End Sub

    Public Sub getRequestDetails(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT tbl_request.trans_id,requester_id,req_type, o_lname, o_fname, o_mname, o_bdate, " & _
                                   "sex, f_lname, f_fname, f_mname, m_lname, m_fname, m_mname, " & _
                                   "w_lname,w_fname,w_mname,DATE_FORMAT(marriage_date,'%m/%d/%Y') AS marriage_date, " & _
                                   "marriage_place,DATE_FORMAT(death_date,'%m/%d/%Y') AS death_date,death_place, " & _
                                   "tbl_ref_purpose.purpose_desc AS purpose, purpose_specific,tbl_request.is_active,rel_owner FROM tbl_request " & _
                                   "INNER JOIN tbl_ref_purpose ON tbl_request.purpose = tbl_ref_purpose.trans_id " & _
                                   "WHERE tbl_request.trans_id='" & _id & "' LIMIT 1")

        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _requesterId = dt.Rows(0)("requester_id").ToString
            _reqType = dt.Rows(0)("req_type").ToString
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
            _wLname = dt.Rows(0)("w_lname").ToString
            _wFname = dt.Rows(0)("w_fname").ToString
            _wMname = dt.Rows(0)("w_mname").ToString
            _marriageDate = dt.Rows(0)("marriage_date").ToString
            _marriagePlace = dt.Rows(0)("marriage_place").ToString
            _purpose = dt.Rows(0)("purpose").ToString
            _purposeSpecific = dt.Rows(0)("purpose_specific").ToString
            _deathDate = dt.Rows(0)("death_date").ToString
            _deathPlace = dt.Rows(0)("death_place").ToString
            _isActive = dt.Rows(0)("is_active").ToString
            _relOwner = dt.Rows(0)("rel_owner").ToString
        Else
            initialize()
        End If
    End Sub


End Class
