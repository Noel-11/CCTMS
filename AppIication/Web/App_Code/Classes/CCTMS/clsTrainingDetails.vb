Imports Microsoft.VisualBasic
Imports System.Data

Public Class clsTrainingDetails

    Dim _clsDB As New clsDatabase

    Public Sub New()
        initialize()
    End Sub


#Region "Properties"
    Public Property transId As String

    Public Property trainingId As String

    Public Property regStatus As String

    Public Property remarks As String

    Public Property lastUser As String

    Public Property lastDate As String

    Public Property counter As String

#End Region


    Public Sub initialize()
        _transId = ""
        _trainingId = ""
        _regStatus = ""
        _remarks = ""
        _lastUser = ""
        _lastDate = ""
        _counter = ""
    End Sub


    Public Function browseRegistrationDetails(ByVal _thisId As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT trans_id, training_id,reg_status, remarks, last_user, last_date, counter FROM tbl_training_details " & _
              " WHERE training_id='" & _thisId & "' ORDER BY counter DESC LIMIT 10"
        Return _clsDB.Fill_DataTable(sql, "tbl_training_details")

    End Function

    Public Sub saveRegistrationDetails()

        _counter = _clsDB.Get_DB_Item("SELECT counter FROM tbl_training_details WHERE training_id='" & _trainingId & "' ORDER BY counter DESC") & ""

        If _counter = "" Then
            _counter = "1"
        Else
            _counter = (CInt(_counter) + 1).ToString
        End If

        With _clsDB.dbUtility
            .fieldItems = "trans_id,training_id,reg_status,remarks,last_user,last_date,counter"
            .sqlString = .getSQLStatement("tbl_training_details", "INSERT")
            _transId = DateTime.Now.ToString("MMddyyyymmhhss") & Left(Guid.NewGuid().ToString.Replace("-", ""), 25).ToUpper
            .ADDPARAM_CMD_String("trans_id", _transId)
            .ADDPARAM_CMD_String("training_id", _trainingId)
            .ADDPARAM_CMD_String("reg_status", _regStatus)
            .ADDPARAM_CMD_String("remarks", _remarks)
            .ADDPARAM_CMD_String("last_user", lastUser)
            .ADDPARAM_CMD_String("last_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            .ADDPARAM_CMD_String("counter", _counter)
            .executeUsingCommandFromSQL(True)
        End With

    End Sub


    Public Sub getRegistrationDetails(ByVal _id As String)
        Dim dt As New DataTable
        dt = _clsDB.Fill_DataTable("SELECT * FROM tbl_training_details WHERE trans_id='" & _id & "'")
        If dt.Rows.Count > 0 Then
            _transId = dt.Rows(0)("trans_id").ToString
            _trainingId = dt.Rows(0)("training_id").ToString
            _regStatus = dt.Rows(0)("reg_status").ToString
            _remarks = dt.Rows(0)("remarks").ToString
            _lastUser = dt.Rows(0)("last_user").ToString
        Else
            initialize()
        End If
    End Sub



End Class
