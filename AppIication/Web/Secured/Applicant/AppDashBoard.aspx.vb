Imports Microsoft.VisualBasic
Imports System.Data
Partial Class Secured_Applicant_AppDashBoard
    Inherits cPageInit_Secured_Client
    Dim _clsDB As New clsDatabase

    Dim _btnOK As New HtmlButton
    Dim _btnNo As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            hfApplicantId.Value = Session("APPLICANTID")
            fillGVTrainings()

        End If

        _btnOK = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOK.ServerClick, AddressOf btnOK_Click

        _btnNo = thisMsgBox.FindControl("btnMsgBoxNo")
        AddHandler _btnNo.ServerClick, AddressOf btnNo_Click

    End Sub


    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If thisMsgBox.getModalType = "REGISTER" Then
            trainingRegistration()
            Response.Redirect("AppDashBoard.aspx")
        End If

    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub


    Protected Sub fillGVTrainings()

        Dim dt As New DataTable

        Dim _clsRecord As New clsTraining

        dt = _clsRecord.browseTrainingApplicant(hfApplicantId.Value)

        _gvTraining.DataSource = dt
        _gvTraining.DataBind()

    End Sub

#Region "REGISTER"

    Protected Sub cmdGVRegister(ByVal sender As Object, ByVal e As CommandEventArgs)

        hfTrainingId.Value = e.CommandArgument

        Dim dtExist As New DataTable

        dtExist = _clsDB.Fill_DataTable("SELECT trans_id, DATE_FORMAT(application_datetime,'%m/%d/%Y %h:%i %p') AS application_datetime,application_status FROM tbl_training_applications " & _
                                        "WHERE training_id = '" & hfTrainingId.Value & "' AND applicant_id = '" & hfApplicantId.ID & "' AND is_active = 'Y' LIMIT 1")

        thisMsgBox.setModalType("REGISTERXX")

        If dtExist.Rows.Count > 0 Then
            thisMsgBox.setError("REGISTERED", "You're already applied on this training!" & _
                                              "Schedule: " & CType(sender, Button).Attributes("trainingDate") & "<br/>" & _
                                              "Title: " & CType(sender, Button).Attributes("title") & "<br/>" & _
                                              "DateTime Applied: " & dtExist.Rows(0)("application_datetime") & "<br/>" & _
                                              "Status : " & dtExist.Rows(0)("application_status"))

        Else
            thisMsgBox.setModalType("REGISTER")
            thisMsgBox.setConfirm(, "Do you want to register on this Training? <br/> " & _
                                    "Schedule: " & CType(sender, Button).Attributes("trainingDate") & "<br/>" & _
                                    "Title: " & CType(sender, Button).Attributes("title") & "<br/>" & _
                                    "Description: " & CType(sender, Button).Attributes("description") & "<br/>" & _
                                    "Description: " & CType(sender, Button).Attributes("description") & "<br/>" & _
                                    "Available Slots: " & CType(sender, Button).Attributes("availableSlots") & "<br/>" & _
                                    "Click yes to proceed.")

        End If


        thisMsgBox.showConfirmBox()

    End Sub


    Private Sub trainingRegistration()

        Dim _clsTrainingApplication As New clsTrainingApplications
        Dim _clsTraining As New clsTraining

        With _clsTrainingApplication
            .initialize()
            .trainingId = hfTrainingId.Value
            .applicantId = hfApplicantId.Value
            .applicationStatus = "FOR PAYMENT"
            .applicationRemarks = "Pay to secure slot"
            .applicationDatetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm")
            .lastUser = Session("UserName")
            .saveTrainingApplications()

        End With

        _clsTraining.updateAttendance(hfTrainingId.Value)

    End Sub

#End Region


End Class
