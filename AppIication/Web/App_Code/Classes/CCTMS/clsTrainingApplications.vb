Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsTrainingApplications

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property appCode As String

    Public Property trainingId As String

    Public Property applicantId As String

    Public Property applicantName As String

    Public Property applicantContact As String

    Public Property applicationStatus As String

    Public Property applicationRemarks As String

    Public Property applicationDatetime As String

    Public Property applicationFee As String

    Public Property applicationOr As String

    Public Property applicationOrDate As String

    Public Property validationDatetime As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region

    Public Sub initialize()
        _transId = ""
        _appCode = ""
        _trainingId = ""
        _applicantId = ""
        _applicantName = ""
        _applicantContact = ""
        _applicationStatus = ""
        _applicationRemarks = ""
        _applicationDatetime = Nothing
        _applicationFee = "0"
        _applicationOr = ""
        _applicationOrDate = Nothing
        _validationDatetime = Nothing
        _isActive = ""
        _createUser = ""
        _createDate = Nothing
        _lastUser = ""
        _lastDate = Nothing
    End Sub


    Public Function browseTrainingApplications(ByVal _thisId As String) As DataTable
        Dim sql As String = ""

        sql = "SELECT tbl_training_applications.trans_id AS application_id,tbl_training_applications.applicant_id, tbl_training_applicants.*, CONCAT(lname,', ',fname,' ',fname,' ',mname) AS applicantName,application_status " & _
              "FROM tbl_training_applications " & _
              "INNER JOIN tbl_training_applicants ON tbl_training_applications.applicant_id = tbl_training_applicants.trans_id " & _
              "LEFT JOIN tbl_training_attendance ON tbl_training_applicants.trans_id = tbl_training_attendance.applicant_id AND " & _
              "tbl_training_attendance.training_id = '" & _thisId & "' " & _
              "WHERE tbl_training_applicants.is_active = 'Y' AND COALESCE(tbl_training_attendance.trans_id,'') = '' AND " & _
              "tbl_training_applications.training_id = '" & _thisId & "' " & _
              "ORDER BY lname,fname;"

        Return _clsDB.Fill_DataTable(sql, "tbl_training_applications")

    End Function

    Public Function browseTrainingApplicationsUpcoming(ByVal _thisAppId As String) As DataTable
        Dim sql As String = ""

        sql = "SELECT tbl_training.trans_id, DATE_FORMAT(training_date,'%m/%d/%Y') AS training_date,training_time,training_title, " & _
              "training_desc,training_slots AS availableSlots, training_venue, other_details, application_status FROM tbl_training_applications " & _
              "INNER JOIN tbl_training ON tbl_training_applications.training_id = tbl_training.trans_id " & _
              "WHERE tbl_training_applications.applicant_id = '" & _thisAppId & "' AND " & _
              "tbl_training_applications.is_active = 'Y' AND training_status = 'UPCOMING' AND tbl_training.training_date >= '" & DateTime.Now.Date.ToString("yyyy-MM-dd") & "' " & _
              "ORDER BY tbl_training.training_date "

        Return _clsDB.Fill_DataTable(sql, "tbl_training_applications")

    End Function

    Public Function getAppcode() As String
        Dim appCode As String = ""
        Dim dtCheckExist As New DataTable

        appCode = DateTime.Now.ToString("yyyyMM") & Left(Guid.NewGuid().ToString.Replace("-", ""), 4).ToUpper

        dtCheckExist = _clsDB.Fill_DataTable("SELECT trans_id AS FROM tbl_training_applications WHERE app_code = '" & appCode & "'")

        While dtCheckExist.Rows.Count > 0
            appCode = DateTime.Now.ToString("yyyyMM") & Left(Guid.NewGuid().ToString.Replace("-", ""), 4).ToUpper
            dtCheckExist = _clsDB.Fill_DataTable("SELECT trans_id AS FROM tbl_training_applications WHERE app_code = '" & appCode & "'")
        End While

        Return appCode.Trim.Replace(" ", "")
    End Function

    Public Sub saveTrainingApplications()
        'If transId = "" Then

        With _clsDB.dbUtility
            .fieldItems = "trans_id,app_code,training_id,applicant_id,applicant_name,applicant_contact,application_status,application_remarks,application_datetime,application_fee,is_active,create_user,create_date"
            .sqlString = .getSQLStatement("tbl_training_applications", "INSERT")
            _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            .ADDPARAM_CMD_String("trans_id", _transId)
            .ADDPARAM_CMD_String("app_code", getAppcode())
            .ADDPARAM_CMD_String("training_id", _trainingId)
            .ADDPARAM_CMD_String("applicant_id", _applicantId)
            .ADDPARAM_CMD_String("applicant_name", _applicantName)
            .ADDPARAM_CMD_String("applicant_contact", applicantContact)
            .ADDPARAM_CMD_String("application_status", _applicationStatus)
            .ADDPARAM_CMD_String("application_remarks", _applicationRemarks)
            .ADDPARAM_CMD_String("application_datetime", _applicationDatetime)
            .ADDPARAM_CMD_String("application_fee", _applicationFee)
            .ADDPARAM_CMD_String("is_active", "Y")
            .ADDPARAM_CMD_String("create_user", _lastUser)
            .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
            .executeUsingCommandFromSQL(True)
        End With

        'Else
        '    With _clsDB.dbUtility
        '        .fieldItems = "training_id,applicant_id,application_status,application_remarks,application_datetime,validation_datetime,is_active,last_user,last_date"
        '        .sqlString = .getSQLStatement("tbl_training_applications", "UPDATE", "trans_id")
        '        .ADDPARAM_CMD_String("training_id", _trainingId)
        '        .ADDPARAM_CMD_String("applicant_id", _applicantId)
        '        .ADDPARAM_CMD_String("application_status", _applicationStatus)
        '        .ADDPARAM_CMD_String("application_remarks", _applicationRemarks)
        '        .ADDPARAM_CMD_String("application_datetime", _applicationDatetime)
        '        .ADDPARAM_CMD_String("validation_datetime", _validationDatetime)
        '        .ADDPARAM_CMD_String("is_active", _isActive)
        '        .ADDPARAM_CMD_String("last_user", _lastUser)
        '        .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
        '        .ADDPARAM_CMD_String("trans_id", _transId)
        '        .executeUsingCommandFromSQL(True)
        '    End With
        'End If
    End Sub


    Public Sub updateApplicationPayments()

        With _clsDB.dbUtility
            .fieldItems = "application_or,application_or_date,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_training_applications", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("application_or", _applicationOr)
            .ADDPARAM_CMD_String("application_or_date", _applicationOrDate)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updateApplicationStatus()

        With _clsDB.dbUtility
            .fieldItems = "application_status,application_remarks,validation_datetime,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_training_applications", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("application_status", _applicationStatus)
            .ADDPARAM_CMD_String("application_remarks", _applicationRemarks)
            .ADDPARAM_CMD_String("validation_datetime", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    'Public Sub updateApplicationStatus()

    '    With _clsDB.dbUtility
    '        .fieldItems = "application_status,application_remarks,validation_datetime,last_user,last_date"
    '        .sqlString = .getSQLStatement("tbl_training_applications", "UPDATE", "trans_id")
    '        .ADDPARAM_CMD_String("application_status", _applicationStatus)
    '        .ADDPARAM_CMD_String("application_remarks", _applicationRemarks)
    '        .ADDPARAM_CMD_String("validation_datetime", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
    '        .ADDPARAM_CMD_String("last_user", _lastUser)
    '        .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
    '        .ADDPARAM_CMD_String("trans_id", _transId)
    '        .executeUsingCommandFromSQL(True)
    '    End With

    'End Sub

    Public Sub getTrainingApplications(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_training_applications WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _trainingId = dt.Rows(0)("training_id").ToString
            _applicantId = dt.Rows(0)("applicant_id").ToString
            _applicationStatus = dt.Rows(0)("application_status").ToString
            _applicationRemarks = dt.Rows(0)("application_remarks").ToString
            _applicationDatetime = dt.Rows(0)("application_datetime").ToString
            _validationDatetime = dt.Rows(0)("validation_datetime").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

End Class
