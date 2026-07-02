Imports Microsoft.VisualBasic

Imports System.Data

Public Class clsTrainingAttendance

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property attendeeNo As String

    Public Property trainingId As String

    Public Property applicantId As String

    Public Property remarks As String

    Public Property isPresent As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region

    Public Sub initialize()
        _transId = ""
        _attendeeNo = ""
        _trainingId = ""
        _applicantId = ""
        _remarks = ""
        _isPresent = "N"
        _isActive = "Y"
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browseTrainingAttendance(ByVal _thisId As String) As DataTable

        Dim sql As String = ""

        sql = "SELECT tbl_training_attendance.trans_id,tbl_training_attendance.applicant_id, lname,fname,mname,ename, contact_no,email_add,prc_no,prc_expiration, " & _
              "CONCAT(lname,', ',fname,' ',ename,' ',mname) AS applicantName, is_present, " & _
              "(CASE WHEN is_present = 'Y' THEN 'TRUE' ELSE 'FALSE' END) AS isAttendanceChecked FROM tbl_training_attendance " & _
              "INNER JOIN tbl_training_applicants ON tbl_training_attendance.applicant_id = tbl_training_applicants.trans_id " & _
              "WHERE tbl_training_attendance.is_active = 'Y' AND tbl_training_attendance.training_id = '" & _thisId & "' " & _
              "ORDER BY lname,fname"

        Return _clsDB.Fill_DataTable(sql, "tbl_training_attendance")
    End Function

    Public Function browseTrainingAttendanceStatus(ByVal _thisId As String) As DataTable

        Dim sql As String = ""

        sql = "SELECT tbl_training_attendance.trans_id,tbl_training_applications.trans_id AS application_id,tbl_training_attendance.applicant_id, " & _
              "lname,fname,mname,ename, contact_no,email_add,prc_no,prc_expiration, is_present, " & _
              "CONCAT(lname,', ',fname,' ',ename,' ',mname) AS applicantName,profession,application_status FROM tbl_training_attendance " & _
              "INNER JOIN tbl_training_applicants ON tbl_training_attendance.applicant_id = tbl_training_applicants.trans_id " & _
              "INNER JOIN tbl_training_applications ON tbl_training_attendance.applicant_id = tbl_training_applications.applicant_id AND " & _
              "tbl_training_attendance.training_id = tbl_training_applications.training_id " & _
              "WHERE tbl_training_attendance.is_active = 'Y' AND tbl_training_attendance.training_id = '" & _thisId & "' " & _
              "ORDER BY lname,fname"

        Return _clsDB.Fill_DataTable(sql, "tbl_training_attendance")
    End Function

    Public Function browseCompletedTrainings(ByVal _thisId As String) As DataTable
        Dim sql As String = ""

        sql = "SELECT tbl_training.trans_id, DATE_FORMAT(training_date,'%m/%d/%Y') AS training_date,training_time,training_title, " & _
              "training_desc,training_slots, attendance, other_details, training_venue, registration_fee,training_status,is_present FROM tbl_training_attendance " & _
              "INNER JOIN tbl_training ON tbl_training_attendance.training_id = tbl_training.trans_id " & _
              "WHERE tbl_training_attendance.is_active = 'Y' AND " & _
              "tbl_training_attendance.applicant_id = '" & _thisId & "' AND training_status = 'COMPLETED' " & _
              "ORDER BY tbl_training.training_date DESC "


        Return _clsDB.Fill_DataTable(sql, "tbl_training_attendance")
    End Function


    Public Sub saveTrainingAttendance()
           Dim _no As Integer = 0

        Try
            _no = _clsDB.Get_DB_Item("SELECT COUNT(*) FROM tbl_training_attendance WHERE training_id = '" & _trainingId & "'")
        Catch ex As Exception
            _no = 0
        End Try

        _attendeeNo = _no + 1

        With _clsDB.dbUtility
            .fieldItems = "trans_id,attendee_no,training_id,applicant_id,remarks,is_present,is_active,create_user,create_date"
            .sqlString = .getSQLStatement("tbl_training_attendance", "INSERT")
            _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            .ADDPARAM_CMD_String("trans_id", _transId)
            .ADDPARAM_CMD_String("attendee_no", _attendeeNo)
            .ADDPARAM_CMD_String("training_id", _trainingId)
            .ADDPARAM_CMD_String("applicant_id", _applicantId)
            .ADDPARAM_CMD_String("remarks", _remarks)
            .ADDPARAM_CMD_String("is_present", _isPresent)
            .ADDPARAM_CMD_String("is_active", _isActive)
            .ADDPARAM_CMD_String("create_user", _lastUser)
            .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .executeUsingCommandFromSQL(True)
        End With
    End Sub

    Public Sub deleteAttendance(ByVal _thisApp As String, ByVal _thisTraining As String)

        _clsDB.Delete_Record("DELETE FROM tbl_training_attendance WHERE applicant_id = '" & _thisApp & "' AND training_id = '" & _thisTraining & "' AND is_active = 'Y' ")

    End Sub

    Public Sub updateAttendanceIsPresent()

        With _clsDB.dbUtility
            .fieldItems = "is_present,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_training_attendance", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("is_present", _isPresent)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub

    Public Sub updateAttendanceIsPresentByTraining()

        With _clsDB.dbUtility
            .fieldItems = "is_present,last_user,last_date"
            .sqlString = .getSQLStatement("tbl_training_attendance", "UPDATE", "trans_id")
            .ADDPARAM_CMD_String("is_present", _isPresent)
            .ADDPARAM_CMD_String("last_user", _lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .ADDPARAM_CMD_String("trans_id", _transId)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub


    Public Sub getTrainingAttendance(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_training_attendance WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _attendeeNo = dt.Rows(0)("attendee_no").ToString
            _trainingId = dt.Rows(0)("training_id").ToString
            _applicantId = dt.Rows(0)("applicant_id").ToString
            _remarks = dt.Rows(0)("remarks").ToString
            _isPresent = dt.Rows(0)("is_present").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub


End Class
