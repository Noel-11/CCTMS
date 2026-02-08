Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
'<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class Finance
    Inherits System.Web.Services.WebService
    Dim _clsDB As New clsDatabase
    Dim _clsRequestPayment As New clsRequestPayment
    Dim _clsRequester As New clsRequester
    Dim _clsRegistrationDetails As New clsRegistrationDetails
    Dim _clsWebServiceLog As New clsWebserviceLog

    Private Sub saveLog(ByVal _thisRefCode As String, ByVal _thisFunctionName As String, ByVal _thisStatus As String)
        With _clsWebServiceLog
            .refcode = _thisRefCode
            .functionName = _thisFunctionName
            .status = _thisStatus
            .ipAddress = GetIPAddress()
            .saveLog()
        End With

    End Sub


    Private Function checkWsKey(ByVal _thisKey As String) As Boolean
        Dim _wsKey As String = ""
        Dim _bol As Boolean = False

        _wsKey = _clsDB.Get_DB_Item("SELECT default_value FROM tbl_system_default WHERE default_desc = 'wskey' LIMIT 1")

        If _wsKey.Trim.ToLower = _thisKey Then
            _bol = True
        End If

        Return _bol
    End Function

    ' Get IP Address '
    Public Shared Function GetIPAddress() As String
        Dim context As System.Web.HttpContext = System.Web.HttpContext.Current
        Dim sIPAddress As String = context.Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If String.IsNullOrEmpty(sIPAddress) Then
            Return context.Request.ServerVariables("REMOTE_ADDR")
        Else
            Dim ipArray As String() = sIPAddress.Split(New [Char]() {","c})
            Return ipArray(0)
        End If
    End Function

    <WebMethod()> _
    Public Function getRequestPayment(ByVal controlNo As String, ByVal wsKey As String) As DataTable
        Dim dt As New DataTable
        Dim sql As String = ""

        If checkWsKey(wsKey) = True Then
            Try
                'sql = "SELECT tbl_request_payment.ref_code,CONCAT(tbl_request.req_type,' (',type_desc,')') AS type_desc, " & _
                '      "copy_count AS count,copy_amount AS amounr,copy_total AS total FROM tbl_request_payment " & _
                '      "INNER JOIN tbl_request ON tbl_request_payment.req_id = tbl_request.requester_id AND tbl_request.is_active = 'Y' " & _
                '      "INNER JOIN tbl_request_details ON tbl_request.trans_id = tbl_request_details.req_id AND tbl_request_details.is_active = 'Y' " & _
                '      "INNER JOIN tbl_ref_document_type ON tbl_request_details.copy_type = tbl_ref_document_type.trans_id " & _
                '      "WHERE tbl_request_payment.is_active = 'Y' AND ref_code = '" & controlNo & "' "

                sql = "SELECT tbl_request_payment.ref_code,CONCAT(tbl_request_payment.r_lname,', ',tbl_request_payment.r_fname,' ',tbl_request_payment.r_mname) AS payor,r_celno AS celno,req_type as description,total_amount,finance_paid,finance_or FROM tbl_request_payment " & _
                      "INNER JOIN tbl_requester ON tbl_request_payment.req_id = tbl_requester.trans_id " & _
                      "WHERE tbl_request_payment.is_active = 'Y' AND tbl_request_payment.ref_code = '" & controlNo.Trim & "' LIMIT 1"

                dt = _clsDB.Fill_DataTable(sql)

                saveLog(controlNo.Trim, "getRequestPayment", "SUCCESS")
            Catch ex As Exception
                saveLog(controlNo.Trim, "getRequestPayment", "ERROR-" & ex.Message)
                sql = "SELECT '" & ex.Message & "' AS functionError"
                dt = _clsDB.Fill_DataTable(sql)
            End Try

        Else
            sql = "SELECT 'Invalid Key' as functionInvalid"
            dt = _clsDB.Fill_DataTable(sql)
        End If

        Return dt

    End Function

    <WebMethod()> _
    Public Function updatePayment(ByVal controlNo As String, ByVal orNo As String, ByVal paymentMode As String, ByVal wsKey As String) As String
        Dim _msg As String = ""

        If checkWsKey(wsKey) = True Then
            Try
                If paymentMode.ToLower.Trim <> "walkin" And paymentMode.ToLower.Trim <> "online" Then
                    _msg = "INVALID PAYMENT MODE"
                Else
                    Dim dt As New DataTable

                    dt = _clsDB.Fill_DataTable("SELECT tbl_request_payment.trans_id,req_id,is_paid,finance_paid,req_status,tbl_ref_status.sort_order FROM tbl_request_payment " & _
                                               "INNER JOIN tbl_requester ON tbl_request_payment.req_id = tbl_requester.trans_id " & _
                                               "INNER JOIN tbl_ref_status ON tbl_requester.req_status = tbl_ref_status.status_code " & _
                                               "WHERE tbl_request_payment.ref_code = '" & controlNo.Trim & "' AND tbl_request_payment.is_active = 'Y' LIMIT 1")

                    If dt.Rows.Count > 0 Then
                        If dt.Rows(0)("finance_paid") = "N" Then
                            With _clsRequestPayment
                                .transId = dt.Rows(0)(0)
                                .financePaid = "Y"
                                .financeOr = orNo.Trim
                                .financeMode = paymentMode.ToUpper.Trim
                                'If paymentMode.ToLower = "online" Then

                                If CInt(dt.Rows(0)("sort_order")) < 5 Then
                                    Dim _defaultMsg As String = _clsDB.Get_DB_Item("SELECT default_msg FROM tbl_ref_status WHERE status_code = 'PAID' LIMIT 1").ToString

                                    With _clsRequester
                                        .transId = dt.Rows(0)(1)
                                        .reqStatus = "PAID"
                                        .valDatetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                        .reqRemarks = _defaultMsg & " By Finance Payment System (" & paymentMode.Trim.ToUpper & ")"
                                        .lastUser = "FINANCE"
                                        .updateValidationStatus()
                                    End With

                                    With _clsRegistrationDetails
                                        .reqId = dt.Rows(0)(1)
                                        .regStatus = _clsRequester.reqStatus
                                        .remarks = _clsRequester.reqRemarks
                                        .lastUser = _clsRequester.lastUser
                                        .saveRegistrationDetails()
                                    End With
                                End If

                                'If dt.Rows(0)("is_paid") = "N" Then
                                '    .isPaid = "Y"
                                '    .orNumber = orNo.Trim
                                '    .updateIsPaid()
                                'End If

                                .lastUser = _clsRequester.lastUser
                                'End If
                                .updateIsPaidFinance()
                            End With
                            _msg = "PAYMENT PAID"
                        Else
                            _msg = "ALREADY PAID"
                        End If

                    Else
                        _msg = "PAYMENT NOT FOUND"
                    End If
                End If

                saveLog(controlNo.Trim, "updatePayment", _msg)
            Catch ex As Exception
                saveLog(controlNo.Trim, "updatePayment", "ERROR-" & ex.Message)
                _msg = "ERROR-" & ex.Message
            End Try
        Else
            _msg = "Invalid Key"
        End If

        Return _msg

    End Function

    <WebMethod()> _
    Public Function cancelPayment(ByVal controlNo As String, ByVal wsKey As String) As String
        Dim _msg As String = ""

        If checkWsKey(wsKey) = True Then
            Try
                Dim dt As New DataTable

                dt = _clsDB.Fill_DataTable("SELECT trans_id,req_id,is_paid,finance_mode,finance_paid FROM tbl_request_payment WHERE ref_code = '" & controlNo.Trim & "' AND is_active = 'Y' LIMIT 1")

                If dt.Rows.Count > 0 Then
                    If dt.Rows(0)("finance_paid") = "Y" Then
                        With _clsRequestPayment
                            .transId = dt.Rows(0)(0)
                            .financePaid = "N"
                            .financeOr = ""
                            .financeMode = dt.Rows(0)("finance_mode")
                            .lastUser = "FINANCE"
                            .updateIsPaidFinance()
                        End With

                        If dt.Rows(0)("is_paid") = "N" Then
                            Dim _defaultMsg As String = _clsDB.Get_DB_Item("SELECT default_msg FROM tbl_ref_status WHERE status_code = 'FOR PAYMENT' LIMIT 1").ToString

                            With _clsRequester
                                .transId = dt.Rows(0)(1)
                                .reqStatus = "FOR PAYMENT"
                                .valDatetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                .reqRemarks = _defaultMsg & " Cancelled From Finance Payment System"
                                .lastUser = "FINANCE"
                                .updateValidationStatus()
                            End With

                            With _clsRegistrationDetails
                                .reqId = dt.Rows(0)(1)
                                .regStatus = _clsRequester.reqStatus
                                .remarks = _defaultMsg
                                .lastUser = _clsRequester.lastUser
                                .saveRegistrationDetails()
                            End With
                        End If

                        _msg = "PAYMENT CANCELLED"
                    Else
                        _msg = "PAYMENT NOT PAID"
                    End If

                Else
                    _msg = "PAYMENT NOT FOUND"
                End If

                saveLog(controlNo.Trim, "CANCELOR", _msg)
            Catch ex As Exception
                saveLog(controlNo.Trim, "CANCELOR", "ERROR-" & ex.Message)
                _msg = "ERROR-" & ex.Message
            End Try
        Else
            _msg = "Invalid Key"
        End If

        Return _msg
    End Function

    'finance.asmx/getRequestPayment?controlNo=123456


End Class