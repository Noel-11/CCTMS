Imports Microsoft.VisualBasic
Imports System.Data
Public Class clsRefLearningTracks



    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property applicantId As String

    Public Property tracksId As String

    Public Property tracksOther As String

    Public Property isActive As String

    Public Property createUser As String

    Public Property createDate As String


    Public Property lastUser As String

#End Region


    Public Sub initialize()
        _transId = ""
        _applicantId = ""
        _tracksId = ""
        _tracksOther = ""
        _isActive = "Y"
        _createUser = ""
        _createDate = ""
    End Sub


    Public Function browseTrainingApplicantsLearningTracks(ByVal _criteria As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT trans_id, applicant_id, tracks_id, is_active, create_user, create_date, FROM tbl_training_applicants_learning_tracks " & _
        " WHERE trans_id LIKE '%" & _criteria & "%' OR applicant_id LIKE '%" & _criteria & "%' OR tracks_id LIKE '%" & _criteria & "%' OR is_active LIKE '%" & _criteria & "%' OR create_user LIKE '%" & _criteria & "%' OR create_date LIKE '%" & _criteria & "%' OR  ORDER BY "
        Return _clsDB.Fill_DataTable(sql, "tbl_training_applicants_learning_tracks")
    End Function


    Public Sub saveTrainingApplicantsLearningTracks()
        ' If transId = "" Then
        With _clsDB.dbUtility
            .fieldItems = "trans_id,applicant_id,tracks_id,tracks_other,is_active,create_user,create_date"
            .sqlString = .getSQLStatement("tbl_training_applicants_learning_tracks", "INSERT")
            _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 5).ToUpper
            .ADDPARAM_CMD_String("trans_id", _transId)
            .ADDPARAM_CMD_String("applicant_id", _applicantId)
            .ADDPARAM_CMD_String("tracks_id", _tracksId)
            .ADDPARAM_CMD_String("tracks_other", _tracksOther)
            .ADDPARAM_CMD_String("is_active", "Y")
            .ADDPARAM_CMD_String("create_user", _lastUser)
            .ADDPARAM_CMD_String("create_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm"))
            .executeUsingCommandFromSQL(True)
        End With
        'Else
        '    With _clsDB.dbUtility
        '        .fieldItems = "applicant_id,tracks_id,is_active"
        '        .sqlString = .getSQLStatement("tbl_training_applicants_learning_tracks", "UPDATE", "trans_id")
        '        .ADDPARAM_CMD_String("applicant_id", _applicantId)
        '        .ADDPARAM_CMD_String("tracks_id", _tracksId)
        '        .ADDPARAM_CMD_String("is_active", _isActive)
        '        .ADDPARAM_CMD_String("trans_id", _transId)
        '        .executeUsingCommandFromSQL(True)
        '    End With
        'End If
    End Sub

    Public Sub deleteLearningTracks(ByVal _thisId As String)
        _clsDB.Delete_Record("DELETE FROM tbl_training_applicants_learning_tracks WHERE applicant_id = '" & _thisId & "'")
    End Sub

    Public Sub getTrainingApplicantsLearningTracks(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_training_applicants_learning_tracks WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _applicantId = dt.Rows(0)("applicant_id").ToString
            _tracksId = dt.Rows(0)("tracks_id").ToString
            _tracksOther = dt.Rows(0)("tracks_other").ToString
            _isActive = dt.Rows(0)("is_active").ToString
        Else
            initialize()
        End If
    End Sub


End Class
