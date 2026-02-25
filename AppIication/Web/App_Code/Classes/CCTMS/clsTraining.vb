Imports Microsoft.VisualBasic
Imports System.Data

Public Class clsTraining

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property trainingDate As String

    Public Property trainingDateTo As String

    Public Property trainingTime As String

    Public Property trainingId As String

    Public Property trainingTitle As String

    Public Property trainingDesc As String

    Public Property trainingSlots As String

    Public Property regFrom As String

    Public Property regTo As String

    Public Property trainingVenue As String

    Public Property otherDetails As String

    Public Property attendance As String

    Public Property registrationFee As String

    Public Property trainingStatus As String

    Public Property trainingRemarks As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

#End Region

    Public Sub initialize()
        _transId = ""
        _trainingDate = ""
        _trainingTime = ""
        _trainingId = ""
        _trainingTitle = ""
        _trainingDesc = ""
        _trainingSlots = "0"
        _trainingVenue = ""
        _otherDetails = ""
        _attendance = "0"
        _registrationFee = "0"
        _trainingStatus = ""
        _trainingRemarks = ""
        _isActive = ""
        _createUser = ""
        _createDate = ""
    End Sub

    Public Function browseTraining(ByVal _criteria As String, Optional _thisDateFrom As String = "", Optional _thisDateTo As String = "") As DataTable
        Dim sql As String = ""

        Dim sqlWhere As String = ""

        If _criteria <> "" Then
            sqlWhere += "AND (training_title LIKE '%" & _criteria & "%' OR training_desc LIKE '%" & _criteria & "%') "
        End If

        If _thisDateFrom <> "" And _thisDateTo <> "" Then
            sqlWhere += "AND (training_date BETWEEN '" & _thisDateFrom & "' AND '" & _thisDateTo & "') "
        End If

        sql = "SELECT tbl_training.trans_id, DATE_FORMAT(training_date,'%m/%d/%Y') AS training_date,training_time,tbl_training.training_title, " & _
              "training_desc,training_slots, attendance, other_details, registration_fee,training_status FROM tbl_training " & _
              "WHERE is_active = 'Y' " & sqlWhere & _
              "ORDER BY training_date DESC"

        Return _clsDB.Fill_DataTable(sql, "tbl_training")
    End Function

    Public Function browseTrainingWAttendance(ByVal _criteria As String, Optional _thisDateFrom As String = "", Optional _thisDateTo As String = "") As DataTable
        Dim sql As String = ""

        Dim sqlWhere As String = ""

        If _criteria <> "" Then
            sqlWhere += "AND (training_title LIKE '%" & _criteria & "%' OR training_desc LIKE '%" & _criteria & "%') "
        End If

        If _thisDateFrom <> "" And _thisDateTo <> "" Then
            sqlWhere += "AND (training_date BETWEEN '" & _thisDateFrom & "' AND '" & _thisDateTo & "') "
        End If

        sql = "SELECT tbl_training.trans_id, DATE_FORMAT(training_date,'%m/%d/%Y') AS training_date,training_time,training_title, " & _
              "training_desc,training_slots, other_details, registration_fee,training_status, " & _
              "SUM(CASE WHEN COALESCE(tbl_training_attendance.trans_id,'') <> '' THEN 1 ELSE 0 END) AS attendance FROM tbl_training " & _
              "LEFT JOIN tbl_training_attendance ON tbl_training.trans_id = tbl_training_attendance.training_id AND tbl_training_attendance.is_active = 'Y' " & _
              "WHERE tbl_training.is_active = 'Y' " & sqlWhere & _
              "GROUP BY tbl_training.trans_id " & _
              "ORDER BY training_date DESC"

        Return _clsDB.Fill_DataTable(sql, "tbl_training")
    End Function

    Public Function browseTrainingApplicant(ByVal _thisApplicant As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT tbl_training.trans_id, DATE_FORMAT(training_date,'%m/%d/%Y') AS training_date,training_time,training_title, " & _
              "training_desc,(training_slots - attendance) AS availableSlots,training_venue, other_details, registration_fee, " & _
              "(CASE WHEN COALESCE(tbl_training_applications.trans_id,'') = '' THEN 'FALSE' ELSE 'TRUE' END) AS isAppAplied, " & _
              "COALESCE(app_code,'') AS app_code FROM tbl_training " & _
              "LEFT JOIN tbl_training_applications ON tbl_training.trans_id = tbl_training_applications.training_id AND " & _
              "tbl_training_applications.applicant_id = '" & _thisApplicant & "' AND tbl_training_applications.is_active = 'Y'  " & _
              "WHERE tbl_training.is_active = 'Y' AND " & _
              "training_status = 'UPCOMING' AND ('" & DateTime.Now.Date.ToString("yyyy-MM-dd") & "' BETWEEN reg_from AND reg_to ) AND (COALESCE(tbl_training_applications.application_status,'') NOT IN ('PAID','INACTIVE')) " & _
              "ORDER BY training_date ASC "

        Return _clsDB.Fill_DataTable(sql, "tbl_training")

    End Function

    Public Sub saveTraining()
        If transId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "trans_id,training_date,training_date_to,reg_from,reg_to,training_time,training_id,training_title,training_desc,training_slots,training_venue,other_details,attendance,registration_fee,training_status,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_training", "INSERT")
                _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 5).ToUpper
                .ADDPARAM_CMD_String("trans_id", _transId)
                .ADDPARAM_CMD_String("training_date", _trainingDate)
                .ADDPARAM_CMD_String("training_date_to", _trainingDateTo)
                .ADDPARAM_CMD_String("reg_from", _regFrom)
                .ADDPARAM_CMD_String("reg_to", _regTo)
                .ADDPARAM_CMD_String("training_time", _trainingTime)
                .ADDPARAM_CMD_String("training_id", _trainingId)
                .ADDPARAM_CMD_String("training_title", _trainingTitle)
                .ADDPARAM_CMD_String("training_desc", _trainingDesc)
                .ADDPARAM_CMD_String("training_slots", _trainingSlots)
                .ADDPARAM_CMD_String("training_venue", _trainingVenue)
                .ADDPARAM_CMD_String("other_details", _otherDetails)
                .ADDPARAM_CMD_String("attendance", _attendance)
                .ADDPARAM_CMD_String("registration_fee", _registrationFee)
                .ADDPARAM_CMD_String("training_status", _trainingStatus)
                .ADDPARAM_CMD_String("is_active", "Y")
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "training_date,training_date_to,reg_from,reg_to,training_time,training_id,training_title,training_desc,training_slots,training_venue,other_details,registration_fee"
                .sqlString = .getSQLStatement("tbl_training", "UPDATE", "trans_id")
                .ADDPARAM_CMD_String("training_date", _trainingDate)
                .ADDPARAM_CMD_String("training_date_to", _trainingDateTo)
                .ADDPARAM_CMD_String("reg_from", _regFrom)
                .ADDPARAM_CMD_String("reg_to", _regTo)
                .ADDPARAM_CMD_String("training_time", _trainingTime)
                .ADDPARAM_CMD_String("training_id", _trainingId)
                .ADDPARAM_CMD_String("training_title", _trainingTitle)
                .ADDPARAM_CMD_String("training_desc", _trainingDesc)
                .ADDPARAM_CMD_String("training_slots", _trainingSlots)
                .ADDPARAM_CMD_String("training_venue", _trainingVenue)
                .ADDPARAM_CMD_String("other_details", _otherDetails)
                .ADDPARAM_CMD_String("registration_fee", _registrationFee)
                .ADDPARAM_CMD_String("trans_id", _transId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub

    Public Sub updateAttendance(ByVal _thisId As String)

        Dim _attendanceCount As Integer = 0

        Try
            _attendanceCount = _clsDB.Get_DB_Item("SELECT COALESCE(COUNT(*),0) FROM tbl_training_applications WHERE training_id = '" & _thisId & "' AND is_active = 'Y'")
        Catch ex As Exception
            _attendanceCount = 0
        End Try

        With _clsDB.dbUtility
            .fieldItems = "attendance"
            .sqlString = .getSQLStatement("tbl_training", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("attendance", _attendanceCount)
            .ADDPARAM_CMD_String("trans_id", _thisId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updateStatus()
        With _clsDB.dbUtility
            .fieldItems = "training_status,training_remarks,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_training", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("training_status", _trainingStatus)
            .ADDPARAM_CMD_String("training_remarks", _trainingRemarks)
            .ADDPARAM_CMD_String("last_user", lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With
    End Sub

    Public Sub getTraining(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_training WHERE trans_id='" & _id & "' LIMIT 1")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _trainingDate = dt.Rows(0)("training_date").ToString
            _trainingDateTo = dt.Rows(0)("training_date_to").ToString
            _regFrom = dt.Rows(0)("reg_from").ToString
            _regTo = dt.Rows(0)("reg_to").ToString
            _trainingTime = dt.Rows(0)("training_time").ToString
            _trainingId = dt.Rows(0)("training_id").ToString
            _trainingTitle = dt.Rows(0)("training_title").ToString
            _trainingDesc = dt.Rows(0)("training_desc").ToString
            _trainingSlots = dt.Rows(0)("training_slots").ToString
            _trainingVenue = dt.Rows(0)("training_venue").ToString
            _otherDetails = dt.Rows(0)("other_details").ToString
            _attendance = dt.Rows(0)("attendance").ToString
            _registrationFee = dt.Rows(0)("registration_fee").ToString
            _trainingStatus = dt.Rows(0)("training_status").ToString
            _trainingRemarks = dt.Rows(0)("training_remarks").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub


End Class
