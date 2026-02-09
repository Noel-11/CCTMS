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

                'sql = "SELECT tbl_request_payment.ref_code,CONCAT(tbl_request_payment.r_lname,', ',tbl_request_payment.r_fname,' ',tbl_request_payment.r_mname) AS payor,r_celno AS celno,req_type as description,total_amount,finance_paid,finance_or FROM tbl_request_payment " & _
                '      "INNER JOIN tbl_requester ON tbl_request_payment.req_id = tbl_requester.trans_id " & _
                '      "WHERE tbl_request_payment.is_active = 'Y' AND tbl_request_payment.ref_code = '" & controlNo.Trim & "' LIMIT 1"

                sql = "SELECT tbl_training_applications.app_code AS ref_code, CONCAT(tbl_training_applicants.lname,', ',tbl_training_applicants.fname,' ',tbl_training_applicants.mname) AS payor, " & _
                      "tbl_training_applicants.contact_no AS celno,tbl_training.training_title,tbl_training_applications.application_fee AS total_amount,tbl_training_applications.is_finance_paid AS finance_paid, " & _
                      "tbl_training_applications.application_or AS finance_or  FROM tbl_training_applications " & _
                      "INNER JOIN tbl_training ON tbl_training_applications.training_id = tbl_training.trans_id " & _
                      "INNER JOIN tbl_training_applicants ON tbl_training_applications.applicant_id = tbl_training_applicants.trans_id " & _
                      "WHERE tbl_training_applications.is_active = 'Y' AND tbl_training_applications.app_code = '" & controlNo.Trim & "' " & _
                      "LIMIT 1"

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
                    Dim sql As String = ""


                    dt = _clsDB.Fill_DataTable("SELECT trans_id,applicant_id,training_id,is_finance_paid FROM tbl_training_applications " & _
                                               "WHERE app_code = '" & controlNo & "' AND is_active = 'Y' LIMIT 1")

                    If dt.Rows.Count > 0 Then

                        Dim _clsApplication As New clsTrainingApplications

                        Dim _clsAttendance As New clsTrainingAttendance

                        For Each dr As DataRow In dt.Rows
                            If dr("is_finance_paid") = "N" Then

                                With _clsApplication
                                    .transId = dr("trans_id")
                                    .applicationOr = orNo.Trim
                                    .applicationOrDate = DateTime.Now.Date.ToString("yyyy-MM-dd")
                                    .isFinancePaid = "Y"
                                    .financeMode = paymentMode.ToUpper.Trim
                                    .financeDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                    .lastUser = "FINANCE WS"
                                    .updateFinancePayment()

                                    .applicationStatus = "PAID"
                                    .applicationRemarks = "PAID IN FINANCE: " & paymentMode.ToUpper.Trim
                                    .validationDatetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                    .updateApplicationStatus()
                                End With

                                With _clsAttendance
                                    .initialize()
                                    .deleteAttendance(dr("applicant_id"), dr("training_id"))
                                    .trainingId = dr("training_id")
                                    .applicantId = dr("applicant_id")
                                    .lastUser = "FINANCE WS"
                                    .saveTrainingAttendance()
                                End With

                                With _clsRegistrationDetails
                                    .applicantId = dr("trans_id")
                                    .regStatus = _clsApplication.applicationStatus
                                    .remarks = _clsApplication.applicationRemarks
                                    .lastUser = _clsApplication.lastUser
                                    .saveRegistrationDetails()
                                End With

                                _msg = "PAYMENT PAID"
                            Else
                                _msg = "ALREADY PAID"
                            End If
                        Next



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

                dt = _clsDB.Fill_DataTable("SELECT trans_id,applicant_id,training_id,is_finance_paid,finance_mode FROM tbl_training_applications " & _
                                                 "WHERE app_code = '" & controlNo & "' AND is_active = 'Y' LIMIT 1")

                If dt.Rows.Count > 0 Then

                    Dim _clsApplication As New clsTrainingApplications

                    Dim _clsAttendance As New clsTrainingAttendance

                    For Each dr As DataRow In dt.Rows
                        If dr("is_finance_paid") = "Y" Then

                            With _clsApplication
                                .transId = dr("trans_id")
                                .applicationOr = ""
                                .applicationOrDate = Nothing
                                .isFinancePaid = "N"
                                .financeMode = dr("finance_mode")
                                .lastUser = "FINANCE WS"
                                .updateFinancePayment()

                                .applicationStatus = "FOR PAYMENT"
                                .applicationRemarks = "Cancelled From Finance Payment System"
                                .validationDatetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                                .lastUser = "FINANCE WS"
                                .updateApplicationStatus()
                            End With

                            With _clsAttendance
                                .initialize()
                                .deleteAttendance(dr("applicant_id"), dr("training_id"))

                            End With

                            With _clsRegistrationDetails
                                .applicantId = dr("trans_id")
                                .regStatus = _clsApplication.applicationStatus
                                .remarks = _clsApplication.applicationRemarks
                                .lastUser = _clsApplication.lastUser
                                .saveRegistrationDetails()
                            End With

                            _msg = "PAYMENT CANCELLED"
                        Else
                            _msg = "PAYMENT NOT PAID"
                        End If

                    Next


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