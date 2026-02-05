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
        _isPresent = ""
        _isActive = ""
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browseTrainingAttendance(ByVal _thisId As String) As DataTable

        Dim sql As String = ""

        sql = "SELECT tbl_training_applicants.* FROM tbl_training_attendance " & _
              "INNER JOIN tbl_training_applicants ON tbl_training_attendance.applicant_id = tbl_training_applicants.trans_id " & _
              "WHERE tbl_training_attendance.is_active = 'Y' AND tbl_training_attendance.training_id = '" & _thisId & "' " & _
              "ORDER BY last_name,first_name"

        Return _clsDB.Fill_DataTable(sql, "tbl_training_attendance")
    End Function


    Public Sub saveTrainingAttendance()
        If transId = "" Then
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
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "attendee_no,training_id,applicant_id,remarks,is_present,is_active,last_user,last_date"
                .sqlString = .getSQLStatement("tbl_training_attendance", "UPDATE", "trans_id")
                .ADDPARAM_CMD_String("attendee_no", _attendeeNo)
                .ADDPARAM_CMD_String("training_id", _trainingId)
                .ADDPARAM_CMD_String("applicant_id", _applicantId)
                .ADDPARAM_CMD_String("remarks", _remarks)
                .ADDPARAM_CMD_String("is_present", _isPresent)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("last_user", _lastUser)
                .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString)
                .ADDPARAM_CMD_String("trans_id", _transId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
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
