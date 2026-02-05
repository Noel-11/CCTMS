Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsTrainingApplicants
    Dim _clsDB As New clsDatabase
    Dim _clsSecurity As New clsDimboMySQL.clsSecurity
    Dim _clsSystemInfo As New clsSystemInfo

    Public Sub New()
        initialize()
    End Sub

#Region "Properties"
    Public Property transId As String

    Public Property lname As String

    Public Property fname As String

    Public Property mname As String

    Public Property ename As String

    Public Property gender As String

    Public Property civilStatus As String

    Public Property contactNo As String

    Public Property emailAdd As String

    Public Property homeAddr As String

    Public Property cityProvince As String

    Public Property profession As String

    Public Property educAttain As String

    Public Property workplace As String

    Public Property position As String

    Public Property prcNo As String

    Public Property prefLearnTracks As String

    Public Property prefLearnTracksOthers As String

    Public Property prefLearnMode As String

    Public Property prefSched As String

    Public Property topicInterest As String

    Public Property programDiscovered As String

    Public Property prcExpiration As String

    Public Property registrationDate As String

    Public Property userName As String

    Public Property password As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

#End Region

    Public Sub initialize()
        _transId = ""
        _lname = ""
        _fname = ""
        _mname = ""
        _ename = ""
        _gender = ""
        _civilStatus = ""
        _contactNo = ""
        _emailAdd = ""
        _homeAddr = ""
        _cityProvince = ""
        _profession = ""
        _educAttain = ""
        _workplace = ""
        _position = ""
        _prcNo = ""
        _prefLearnTracks = ""
        _prefLearnTracksOthers = ""
        _prefLearnMode = ""
        _prefSched = ""
        _topicInterest = ""
        _programDiscovered = ""
        _prcExpiration = ""
        _registrationDate = ""
        _isActive = ""
        _createUser = ""
        _createDate = ""
    End Sub


    Public Function browseTrainingApplicants(ByVal _thisId As String) As DataTable
        Dim sql As String = ""

        sql = "SELECT tbl_training_applicants.* FROM tbl_training_applicants " & _
              "WHERE tbl_training_applicants.is_active = 'Y' " & _
              "ORDER BY lname,fname"

        Return _clsDB.Fill_DataTable(sql, "tbl_training_applicants")
    End Function

    Public Function validatePassword(ByVal _thisUserId As String, ByVal _thisPassword As String) As Boolean

        getTrainingApplicantsUser(_thisUserId)

        Return _clsSecurity.validateSameText(_thisPassword, _Password)

    End Function

    Public Function getUserName(ByVal _thisLName As String) As String
        Dim uName As String = ""
        Dim dtCheckExist As New DataTable

        uName = _thisLName & "_" & Left(Guid.NewGuid().ToString.Replace("-", ""), 2).ToUpper

        dtCheckExist = _clsDB.Fill_DataTable("SELECT trans_id AS FROM tbl_user_info WHERE user_name = '" & uName & "'")

        While dtCheckExist.Rows.Count > 0
            uName = _thisLName & "_" & Left(Guid.NewGuid().ToString.Replace("-", ""), 2).ToUpper
            dtCheckExist = _clsDB.Fill_DataTable("SELECT trans_id AS FROM tbl_training_applicants WHERE user_name = '" & uName & "'")
        End While

        Return uName
    End Function

    Public Sub saveTrainingApplicants()
        If transId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "trans_id,lname,fname,mname,ename,gender,civil_status,contact_no,email_add,home_addr,city_province,profession,educ_attain,workplace,position,prc_no,pref_learn_tracks,pref_learn_tracks_others,pref_learn_mode,pref_sched,topic_interest,program_discovered,prc_expiration,registration_date,user_name,password,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_training_applicants", "INSERT")
                _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
                .ADDPARAM_CMD_String("trans_id", _transId)
                .ADDPARAM_CMD_String("lname", _lname)
                .ADDPARAM_CMD_String("fname", _fname)
                .ADDPARAM_CMD_String("mname", _mname)
                .ADDPARAM_CMD_String("ename", _ename)
                .ADDPARAM_CMD_String("gender", _gender)
                .ADDPARAM_CMD_String("civil_status", _civilStatus)
                .ADDPARAM_CMD_String("contact_no", _contactNo)
                .ADDPARAM_CMD_String("email_add", _emailAdd)
                .ADDPARAM_CMD_String("home_addr", _homeAddr)
                .ADDPARAM_CMD_String("city_province", _cityProvince)
                .ADDPARAM_CMD_String("profession", _profession)
                .ADDPARAM_CMD_String("educ_attain", _educAttain)
                .ADDPARAM_CMD_String("workplace", _workplace)
                .ADDPARAM_CMD_String("position", _position)
                .ADDPARAM_CMD_String("prc_no", _prcNo)
                .ADDPARAM_CMD_String("pref_learn_tracks", _prefLearnTracks)
                .ADDPARAM_CMD_String("pref_learn_tracks_others", _prefLearnTracksOthers)
                .ADDPARAM_CMD_String("pref_learn_mode", _prefLearnMode)
                .ADDPARAM_CMD_String("pref_sched", _prefSched)
                .ADDPARAM_CMD_String("topic_interest", _topicInterest)
                .ADDPARAM_CMD_String("program_discovered", _programDiscovered)
                .ADDPARAM_CMD_String("prc_expiration", _prcExpiration)
                .ADDPARAM_CMD_String("registration_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
                .ADDPARAM_CMD_String("user_name", getUserName(_userName))
                .ADDPARAM_CMD_String("password", _clsSystemInfo.getDefaultPassword)
                .ADDPARAM_CMD_String("is_active", "Y")
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "lname,fname,mname,ename,gender,civil_status,contact_no,email_add,home_addr,city_province,profession,educ_attain,workplace,position,prc_no,pref_learn_tracks,pref_learn_tracks_others,pref_learn_mode,pref_sched,topic_interest,program_discovered,prc_expiration,registration_date"
                .sqlString = .getSQLStatement("tbl_training_applicants", "UPDATE", "trans_id")
                .ADDPARAM_CMD_String("lname", _lname)
                .ADDPARAM_CMD_String("fname", _fname)
                .ADDPARAM_CMD_String("mname", _mname)
                .ADDPARAM_CMD_String("ename", _ename)
                .ADDPARAM_CMD_String("gender", _gender)
                .ADDPARAM_CMD_String("civil_status", _civilStatus)
                .ADDPARAM_CMD_String("contact_no", _contactNo)
                .ADDPARAM_CMD_String("email_add", _emailAdd)
                .ADDPARAM_CMD_String("home_addr", _homeAddr)
                .ADDPARAM_CMD_String("city_province", _cityProvince)
                .ADDPARAM_CMD_String("profession", _profession)
                .ADDPARAM_CMD_String("educ_attain", _educAttain)
                .ADDPARAM_CMD_String("workplace", _workplace)
                .ADDPARAM_CMD_String("position", _position)
                .ADDPARAM_CMD_String("prc_no", _prcNo)
                .ADDPARAM_CMD_String("pref_learn_tracks", _prefLearnTracks)
                .ADDPARAM_CMD_String("pref_learn_tracks_others", _prefLearnTracksOthers)
                .ADDPARAM_CMD_String("pref_learn_mode", _prefLearnMode)
                .ADDPARAM_CMD_String("pref_sched", _prefSched)
                .ADDPARAM_CMD_String("topic_interest", _topicInterest)
                .ADDPARAM_CMD_String("program_discovered", _programDiscovered)
                .ADDPARAM_CMD_String("prc_expiration", _prcExpiration)
                .ADDPARAM_CMD_String("registration_date", _registrationDate)

                .ADDPARAM_CMD_String("trans_id", _transId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub

    Public Sub getTrainingApplicantsUser(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_training_applicants WHERE user_name='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _lname = dt.Rows(0)("lname").ToString
            _fname = dt.Rows(0)("fname").ToString
            _mname = dt.Rows(0)("mname").ToString
            _ename = dt.Rows(0)("ename").ToString
         
            _userName = dt.Rows(0)("user_name").ToString
            _password = dt.Rows(0)("password").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

    Public Sub getTrainingApplicants(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_training_applicants WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _lname = dt.Rows(0)("lname").ToString
            _fname = dt.Rows(0)("fname").ToString
            _mname = dt.Rows(0)("mname").ToString
            _ename = dt.Rows(0)("ename").ToString
            _gender = dt.Rows(0)("gender").ToString
            _civilStatus = dt.Rows(0)("civil_status").ToString
            _contactNo = dt.Rows(0)("contact_no").ToString
            _emailAdd = dt.Rows(0)("email_add").ToString
            _homeAddr = dt.Rows(0)("home_addr").ToString
            _cityProvince = dt.Rows(0)("city_province").ToString
            _profession = dt.Rows(0)("profession").ToString
            _educAttain = dt.Rows(0)("educ_attain").ToString
            _workplace = dt.Rows(0)("workplace").ToString
            _position = dt.Rows(0)("position").ToString
            _prcNo = dt.Rows(0)("prc_no").ToString
            _prefLearnTracks = dt.Rows(0)("pref_learn_tracks").ToString
            _prefLearnTracksOthers = dt.Rows(0)("pref_learn_tracks_others").ToString
            _prefLearnMode = dt.Rows(0)("pref_learn_mode").ToString
            _prefSched = dt.Rows(0)("pref_sched").ToString
            _topicInterest = dt.Rows(0)("topic_interest").ToString
            _programDiscovered = dt.Rows(0)("program_discovered").ToString
            _prcExpiration = dt.Rows(0)("prc_expiration").ToString
            _registrationDate = dt.Rows(0)("registration_date").ToString
            _userName = dt.Rows(0)("user_name").ToString
            _password = dt.Rows(0)("password").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

End Class
