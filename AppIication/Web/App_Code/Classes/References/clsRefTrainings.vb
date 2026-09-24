Imports Microsoft.VisualBasic

Imports System.Data
Public Class clsRefTrainings


    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property trainingTitle As String

    Public Property trainingDescription As String

    Public Property learningMode As String

    Public Property learningTracks As String

    Public Property learningTracksOther As String

    Public Property trainingProgFee As String

    Public Property trainingProgFeeAmount As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

    Public Property lastDate As String

#End Region

    Public Sub initialize()
        _transId = ""
        _trainingTitle = ""
        _trainingDescription = ""
        _learningMode = ""
        _learningTracks = ""
        _learningTracksOther = ""
        _trainingProgFee = ""
        _trainingProgFeeAmount = 0
        _isActive = ""
        _createUser = ""
        _createDate = ""
        _lastUser = ""
        _lastDate = ""
    End Sub


    Public Function browseRefTrainings(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT tbl_ref_trainings.trans_id, training_title, training_description, tbl_ref_learning_mode.description AS learning_mode, " & _
              "learning_tracks, tbl_ref_training_program_fee.description AS trainingProgram, training_prog_fee_amount, tbl_ref_trainings.is_active FROM tbl_ref_trainings " & _
              "INNER JOIN tbl_ref_learning_mode ON tbl_ref_trainings.learning_mode = tbl_ref_learning_mode.trans_id " & _
              "LEFT JOIN tbl_ref_training_program_fee ON tbl_ref_trainings.training_prog_fee = tbl_ref_training_program_fee.trans_id " & _
              " WHERE (training_title LIKE '%" & _criteria & "%' OR training_description LIKE '%" & _criteria & "%') ORDER BY training_title"
        Return _clsDB.Fill_DataTable(sql, "tbl_ref_trainings")
    End Function

    Public Sub saveRefTrainings()
        If transId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "trans_id,training_title,training_description,learning_mode,learning_tracks,learning_tracks_other,training_prog_fee,training_prog_fee_amount,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_ref_trainings", "INSERT")
                _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 5).ToUpper
                .ADDPARAM_CMD_String("trans_id", _transId)
                .ADDPARAM_CMD_String("training_title", _trainingTitle)
                .ADDPARAM_CMD_String("training_description", _trainingDescription)
                .ADDPARAM_CMD_String("learning_mode", _learningMode)
                .ADDPARAM_CMD_String("learning_tracks", _learningTracks)
                .ADDPARAM_CMD_String("learning_tracks_other", _learningTracksOther)
                .ADDPARAM_CMD_String("training_prog_fee", _trainingProgFee)
                .ADDPARAM_CMD_String("training_prog_fee_amount", _trainingProgFeeAmount)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "training_title,training_description,learning_mode,learning_tracks,learning_tracks_other,training_prog_fee,training_prog_fee_amount,is_active,last_user,last_date"
                .sqlString = .getSQLStatement("tbl_ref_trainings", "UPDATE", "trans_id")
                .ADDPARAM_CMD_String("training_title", _trainingTitle)
                .ADDPARAM_CMD_String("training_description", _trainingDescription)
                .ADDPARAM_CMD_String("learning_mode", _learningMode)
                .ADDPARAM_CMD_String("learning_tracks", _learningTracks)
                .ADDPARAM_CMD_String("learning_tracks_other", _learningTracksOther)
                .ADDPARAM_CMD_String("training_prog_fee", _trainingProgFee)
                .ADDPARAM_CMD_String("training_prog_fee_amount", _trainingProgFeeAmount)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("last_user", _lastUser)
                .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
                .ADDPARAM_CMD_String("trans_id", _transId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub

    Public Sub getRefTrainings(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_ref_trainings WHERE trans_id='" & _id & "' LIMIT 1")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _trainingTitle = dt.Rows(0)("training_title").ToString
            _trainingDescription = dt.Rows(0)("training_description").ToString
            _learningMode = dt.Rows(0)("learning_mode").ToString
            _learningTracks = dt.Rows(0)("learning_tracks").ToString
            _learningTracksOther = dt.Rows(0)("learning_tracks_other").ToString
            _trainingProgFee = dt.Rows(0)("training_prog_fee").ToString
            _trainingProgFeeAmount = dt.Rows(0)("training_prog_fee_amount").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub

End Class
