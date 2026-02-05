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

    Public Property trainingTime As String

    Public Property trainingTitle As String

    Public Property trainingDesc As String

    Public Property trainingSlots As String

    Public Property otherDetails As String

    Public Property attendance As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

#End Region

    Public Sub initialize()
        _transId = ""
        _trainingDate = ""
        _trainingTime = ""
        _trainingTitle = ""
        _trainingDesc = ""
        _trainingSlots = "0"
        _otherDetails = ""
        _attendance = "0"
        _isActive = ""
        _createUser = ""
        _createDate = ""
    End Sub


    Public Function browseTrainingApplicant(ByVal _criteria As String, ByVal _thisApplicant As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT tbl_training.trans_id, DATE_FORMAT(training_date,'%m/%d/%Y') AS training_date,training_time,training_title, " & _
              "training_desc,training_slots AS availableSlots, other_details FROM tbl_training " & _
              "LEFT JOIN tbl_training_applications ON tbl_training_applications.training_id = tbl_training_applications.training_id AND " & _
              "tbl_training_applications.applicant_id = '" & _thisApplicant & "' " & _
              "WHERE tbl_training.is_active = 'Y' AND COALESCE(tbl_training_applications.trans_id,'') = '' " & _
              "ORDER BY training_date ASC "

        Return _clsDB.Fill_DataTable(sql, "tbl_training")
    End Function


    Public Function browseTraining(ByVal _criteria As String, Optional _thisDateFrom As String = "", Optional _thisDateTo As String = "") As DataTable
        Dim sql As String = ""

        Dim sqlWhere As String = ""

        If _criteria <> "" Then
            sqlWhere += "AND (training_title LIKE '%" & _criteria & "%' OR training_desc LIKE '%" & _criteria & "%') "
        End If

        If _thisDateFrom <> "" And _thisDateTo <> "" Then
            sqlWhere += "AND (training_date BETWEEN '" & _thisDateFrom & "' AND '" & _thisDateTo & "') "
        End If

        sql = "SELECT tbl_training.trans_id, DATE_FORMAT(training_date,'%m/%d/%Y') AS training_date,training_time,training_title, " & _
              "training_desc,training_slots, attendance, other_details FROM tbl_training " & _
              "WHERE is_active = 'Y' " & sqlWhere & _
              "ORDER BY training_date DESC"

        Return _clsDB.Fill_DataTable(sql, "tbl_training")
    End Function


    Public Sub saveTraining()
        If transId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "trans_id,training_date,training_time,training_title,training_desc,training_slots,other_details,attendance,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_training", "INSERT")
                _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 5).ToUpper
                .ADDPARAM_CMD_String("trans_id", _transId)
                .ADDPARAM_CMD_String("training_date", _trainingDate)
                .ADDPARAM_CMD_String("training_time", _trainingTime)
                .ADDPARAM_CMD_String("training_title", _trainingTitle)
                .ADDPARAM_CMD_String("training_desc", _trainingDesc)
                .ADDPARAM_CMD_String("training_slots", _trainingSlots)
                .ADDPARAM_CMD_String("other_details", _otherDetails)
                .ADDPARAM_CMD_String("attendance", _attendance)
                .ADDPARAM_CMD_String("is_active", "Y")
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "training_date,training_time,training_title,training_desc,training_slots,other_details,attendance"
                .sqlString = .getSQLStatement("tbl_training", "UPDATE", "trans_id")
                .ADDPARAM_CMD_String("training_date", _trainingDate)
                .ADDPARAM_CMD_String("training_time", _trainingTime)
                .ADDPARAM_CMD_String("training_title", _trainingTitle)
                .ADDPARAM_CMD_String("training_desc", _trainingDesc)
                .ADDPARAM_CMD_String("training_slots", _trainingSlots)
                .ADDPARAM_CMD_String("other_details", _otherDetails)
                .ADDPARAM_CMD_String("attendance", _attendance)
                .ADDPARAM_CMD_String("trans_id", _transId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub


    Public Sub getTraining(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_training WHERE trans_id='" & _id & "' LIMIT 1")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _trainingDate = dt.Rows(0)("training_date").ToString
            _trainingTime = dt.Rows(0)("training_time").ToString
            _trainingTitle = dt.Rows(0)("training_title").ToString
            _trainingDesc = dt.Rows(0)("training_desc").ToString
            _trainingSlots = dt.Rows(0)("training_slots").ToString
            _otherDetails = dt.Rows(0)("other_details").ToString
            _attendance = dt.Rows(0)("attendance").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub


End Class
