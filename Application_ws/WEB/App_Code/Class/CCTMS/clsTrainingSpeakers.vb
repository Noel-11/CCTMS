Imports Microsoft.VisualBasic

Imports System.Data

Public Class clsTrainingSpeakers

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property trainingId As String

    Public Property trainingSpeaker As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String

    Public Property lastUser As String

#End Region


    Public Sub initialize()
        _transId = ""
        _trainingId = ""
        _trainingSpeaker = ""
        _isActive = ""
        _createUser = ""
        _createDate = ""
    End Sub


    Public Function browseTrainingSpeakers(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT trans_id, training_id, training_speaker, is_active, create_user, create_date, FROM tbl_training_speakers " & _
        " WHERE trans_id LIKE '%" & _criteria & "%' OR training_id LIKE '%" & _criteria & "%' OR training_speaker LIKE '%" & _criteria & "%' OR is_active LIKE '%" & _criteria & "%' OR create_user LIKE '%" & _criteria & "%' OR create_date LIKE '%" & _criteria & "%' OR  ORDER BY "
        Return _clsDB.Fill_DataTable(sql, "tbl_training_speakers")
    End Function


    Public Sub saveTrainingSpeakers()
        If transId = "" Then
            With _clsDB.dbUtility
                .fieldItems = "trans_id,training_id,training_speaker,is_active,create_user,create_date"
                .sqlString = .getSQLStatement("tbl_training_speakers", "INSERT")
                _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
                .ADDPARAM_CMD_String("trans_id", _transId)
                .ADDPARAM_CMD_String("training_id", _trainingId)
                .ADDPARAM_CMD_String("training_speaker", _trainingSpeaker)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("create_user", _lastUser)
                .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString)
                .executeUsingCommandFromSQL(True)
            End With
        Else
            With _clsDB.dbUtility
                .fieldItems = "training_id,training_speaker,is_active"
                .sqlString = .getSQLStatement("tbl_training_speakers", "UPDATE", "trans_id")
                .ADDPARAM_CMD_String("training_id", _trainingId)
                .ADDPARAM_CMD_String("training_speaker", _trainingSpeaker)
                .ADDPARAM_CMD_String("is_active", _isActive)
                .ADDPARAM_CMD_String("trans_id", _transId)
                .executeUsingCommandFromSQL(True)
            End With
        End If
    End Sub


    Public Sub getTrainingSpeakers(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_training_speakers WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _trainingId = dt.Rows(0)("training_id").ToString
            _trainingSpeaker = dt.Rows(0)("training_speaker").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub


End Class
