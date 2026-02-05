Imports System.Data
Imports System.IO
Imports System.Drawing
Imports AjaxControlToolkit
Partial Class scid
    Inherits System.Web.UI.Page

    'Dim _clsSeniorCitizenInformation As New clsSeniorCitizenInformation
    'Dim _clsRegistrationDetails As New clsRegistrationDetails
    'Dim _clsSeniorChildren As New clsSeniorChildren
    'Dim _clsSeniorOtherDependents As New clsSeniorOtherDependents

    ''DEPENDENCY PROFILE
    'Dim _clsSeniorLivingA As New clsSeniorLivingA
    'Dim _clsSeniorLivingB As New clsSeniorLivingB

    ''EDUCATION / HR PROFILE
    'Dim _clsSeniorSkills As New clsSeniorSkills
    'Dim _clsSeniorCommunity As New clsSeniorCommunity

    ''ECONOMIC PROFILE
    'Dim _clsSeniorSourceIncome As New clsSeniorSourceIncome
    'Dim _clsSeniorAssetA As New clsSeniorAssetA
    'Dim _clsSeniorAssetB As New clsSeniorAssetB
    'Dim _clsSeniorPNC As New clsSeniorPNC

    ''HEALTH PROFILE
    'Dim _clsSeniorHealth As New clsSeniorHealth
    'Dim _clsSeniorDental As New clsSeniorDental
    'Dim _clsSeniorVisual As New clsSeniorVisual
    'Dim _clsSeniorAural As New clsSeniorAural
    'Dim _clsSeniorSocial As New clsSeniorSocial
    'Dim _clsSeniorDifficulty As New clsSeniorDifficulty

    'ATTACHMENTS
    Dim _clsReqDocs As New clsRequiredDocuments

    Dim _clsDB As New clsDatabase

    Dim _btnOk As New HtmlButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("SENIOR_ID") = "" Then
            Response.Redirect("Default.aspx")
        End If

        If Not Page.IsPostBack Then

            'ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlSCApplication", "var myModal = new bootstrap.Modal(document.getElementById('mdlSCApplication'), {});  myModal.show();", True)
            'hfTransId.Value = Session("SENIOR_ID")
            'getDll()
            'setConsent()
            'fillInfo()

        End If

        _btnOk = thisMsgBox.FindControl("btnMsgBoxYes")
        AddHandler _btnOk.ServerClick, AddressOf btnOK_Click
    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'If thisMsgBox.getModalType = "SUBMIT" Then
        '    saveInfo()
        '    thisMsgBox.setModalType("SUBMITOK")
        '    thisMsgBox.setInfo("INFO", "Registration submitted successfully! <br/>Reference No.: " & Session("REFCODE") & "<br/>  Notification will be send once validated.")
        '    thisMsgBox.showConfirmBox()
        'ElseIf thisMsgBox.getModalType = "REMOVE ATTACHMENT" Then
        '    removeAttachment()
        '    'thisMsgBox.setModalType("REMOVEOK")
        '    'thisMsgBox.setInfo("INFO", "Removed Successfully!.")
        '    'thisMsgBox.showConfirmBox()
        '    fillGVAttachments()
        'ElseIf thisMsgBox.getModalType = "UPLOADFILEOK" Then
        '    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "btnUploadClose", " $('#btnUploadClose').click();", True)
        '    fillGVAttachments()
        'ElseIf thisMsgBox.getModalType = "CONTLATER" Then
        '    saveInfo()
        '    thisMsgBox.setModalType("SUBMITOK")
        '    thisMsgBox.setInfo("INFO", "Registration saved successfully! <br/>Reference No.: " & Session("REFCODE") & "<br/>  To proceed with your registration. Please click on <b>CONTINUE REGISTRATION</b> and use the provided reference number.")
        '    thisMsgBox.showConfirmBox()
        'ElseIf thisMsgBox.getModalType = "SUBMITOK" Then
        '    Response.Redirect("Default.aspx")

        'ElseIf thisMsgBox.getModalType = "XXFORCONTINUE" Then
        '    Response.Redirect("scid.aspx")

        'ElseIf thisMsgBox.getModalType = "XXEXISTED" Then
        '    Response.Redirect("Default.aspx")

        'End If

    End Sub

    'Protected Sub btnHome_ServerClick(sender As Object, e As EventArgs) Handles btnHome.ServerClick
    '    Response.Redirect("Default.aspx")
    '    End Sub

    '#Region "SCID INFORMATION"

    '    Private Sub saveInfo()

    '        With _clsSeniorCitizenInformation
    '            .initialize()
    '            .seniorId = hfTransId.Value
    '            .lastName = txtLastName.Text.Trim.ToUpper.ToString
    '            .firstName = txtFirstName.Text.Trim.ToUpper.ToString
    '            .middleName = txtMiddleName.Text.Trim.ToUpper
    '            .extName = txtExtName.Text.Trim.ToUpper
    '            .addressStreet = txtStreet.Text.Trim.ToUpper
    '            .addressBarangay = ddlBarangay.SelectedValue
    '            .dateOfBirth = CDate(dtpBdate.Value).ToString("yyyy-MM-dd")
    '            .placeOfBirth = txtBirthPlace.Text.Trim.ToUpper
    '            .civilStatus = ddlCivilStatus.SelectedValue
    '            .religion = ddlReligion.SelectedValue
    '            .sex = ddlSex.SelectedValue
    '            .contactNumber = txtContactNo.Text.Trim.ToUpper
    '            .emailAdd = txtEmailAdd.Text.Trim
    '            .messengerName = txtMessenger.Text.Trim.ToUpper
    '            .ethnic = txtEthnic.Text.Trim.ToUpper
    '            .language = txtLanguage.Text.Trim.ToUpper
    '            .oscaIdno = txtOSCAID.Text.Trim.ToUpper
    '            .idGsis = txtGSISSSS.Text.Trim.ToUpper
    '            .idTin = txtTIN.Text.Trim.ToUpper
    '            .idPhilhealth = txtPhilhealthNo.Text.Trim.ToUpper
    '            .scAssocIdno = txtSCAssoc.Text.Trim.ToUpper
    '            .otherGovId = txtOtherGov.Text.Trim.ToUpper
    '            .employmentBusiness = txtEmployment.Text.Trim.ToUpper
    '            .currPension = txtCurrPension.Text.Trim.ToUpper
    '            .canTravel = ddlCanTravel.Text.Trim

    '            .spouseLname = txtSpouseLName.Text.Trim.ToUpper
    '            .spouseFname = txtSpouseFName.Text.Trim.ToUpper
    '            .spouseMname = txtSpouseMName.Text.Trim.ToUpper
    '            .spouseExtname = txtSpouseExtName.Text.Trim.ToUpper

    '            .fatherLname = txtFatherLName.Text.Trim.ToUpper
    '            .fatherFname = txtFatherFName.Text.Trim.ToUpper
    '            .fatherMname = txtFatherMName.Text.Trim.ToUpper
    '            .fatherExtname = txtFatherExtName.Text.Trim.ToUpper

    '            .motherLname = txtMotherLName.Text.Trim.ToUpper
    '            .motherFname = txtMotherFName.Text.Trim.ToUpper
    '            .motherMname = txtMotherMName.Text.Trim.ToUpper
    '            .motherExtname = txtMotherExtName.Text.Trim.ToUpper

    '            .educationalAttainment = rblEducAttainment.SelectedValue
    '            .sharedSkills = txtSharedSkills.Text.Trim.ToUpper
    '            .monthlyIncome = rblMonthlyIncome.SelectedValue

    '            .bloodType = ddlBloodType.SelectedValue
    '            .physicalDisability = txtPhysicalDis.Text.Trim.ToUpper

    '            .medicineMaintenance = txtMedicineMaintenance.Text.Trim
    '            .isScheduledMedcheck = rblIsScheduledCheckup.SelectedValue
    '            .medcheckScheduled = ddlCheckUpSchedule.SelectedValue

    '            .refStatus = Session("REF_STATUS")

    '            If Session("APP_TYPE") = "NEW" Then
    '                .registrationDate = DateTime.Now.Date.ToString("yyyy-MM-dd")
    '                .saveSeniorCitizenInformation()
    '                Session("REFCODE") = .refCode
    '            Else
    '                .updateSeniorCitizenInformation()
    '            End If

    '            Session("SENIOR_ID") = .seniorId

    '            hfTransId.Value = Session("SENIOR_ID")

    '        End With

    '        saveChildren()
    '        saveOtherDependents()

    '        'DEPENDENCY PROFILE
    '        saveLivingConditionA()
    '        saveLivingConditionB()

    '        'EDUCATION / HR
    '        saveSkills()
    '        saveCommunity()

    '        'ECONOMIC PROFILE
    '        saveSourceIncome()
    '        saveAssetA()
    '        saveAssetB()
    '        savePNC()

    '        'HEALTH PROFILE
    '        saveHealth()
    '        saveDental()
    '        saveVisual()
    '        saveAural()
    '        saveSocial()
    '        saveDifficulty()

    '        With _clsRegistrationDetails
    '            .seniorId = hfTransId.Value
    '            .regStatus = _clsSeniorCitizenInformation.refStatus
    '            .remarks = _clsDB.Get_DB_Item("SELECT default_msg FROM tbl_ref_status WHERE status_code = '" & _clsSeniorCitizenInformation.refStatus & "' LIMIT 1")
    '            .lastUser = Session("UserName")
    '            .saveRegistrationComments()
    '        End With

    '    End Sub

    '    Private Sub getDll()

    '        _clsDB.populateDDLB(ddlBarangay, "barangay", "barangay_code", "tbl_ref_barangay", "barangay", , , "")

    '        _clsDB.populateDDLB(ddlCivilStatus, "civil_status", "civil_status", "tbl_ref_civil_status", "sort_order", " WHERE is_active = 'Y'", , "")

    '        _clsDB.populateDDLB(ddlReligion, "religion", "religion_id", "tbl_ref_religion", "religion", " WHERE is_active = 'Y'", , "")

    '        _clsDB.populateDDLB(ddlSex, "description", "trans_id", "tbl_ref_sex", "sort_order", " WHERE is_active = 'Y'", , "")

    '        fillRblEducational()
    '        fillRblMonthlyIncome()

    '        _clsDB.populateDDLB(ddlBloodType, "blood_type", "trans_id", "tbl_ref_bloodtype", "sort_order", " WHERE is_active = 'Y'", , "")

    '        _clsDB.populateDDLB(ddlCheckUpSchedule, "description", "trans_id", "tbl_ref_med_sched", "sort_order", " WHERE is_active = 'Y'", , "")

    '    End Sub

    '    Private Sub fillInfo()

    '        With _clsSeniorCitizenInformation
    '            .getSeniorCitizenInformation(hfTransId.Value)
    '            spanRefCode.InnerText = IIf(.refCode <> "", "Referece Code: " & .refCode, "")
    '            Session("REFCODE") = .refCode
    '            txtLastName.Text = .lastName
    '            txtFirstName.Text = .firstName
    '            txtMiddleName.Text = .middleName
    '            txtExtName.Text = .extName
    '            txtStreet.Text = .addressStreet
    '            ddlBarangay.SelectedValue = .addressBarangay
    '            dtpBdate.Value = CDate(.dateOfBirth).ToString("yyyy-MM-dd")
    '            txtBirthPlace.Text = .placeOfBirth
    '            ddlCivilStatus.SelectedValue = .civilStatus
    '            ddlReligion.SelectedValue = .religion
    '            ddlSex.SelectedValue = .sex
    '            txtContactNo.Text = .contactNumber
    '            txtEmailAdd.Text = .emailAdd
    '            txtMessenger.Text = .messengerName
    '            txtEthnic.Text = .ethnic
    '            txtLanguage.Text = .language
    '            txtOSCAID.Text = .oscaIdno
    '            txtGSISSSS.Text = .idGsis
    '            txtTIN.Text = .idTin
    '            txtPhilhealthNo.Text = .idPhilhealth
    '            txtSCAssoc.Text = .scAssocIdno
    '            txtOtherGov.Text = .otherGovId
    '            txtEmployment.Text = .employmentBusiness
    '            txtCurrPension.Text = .currPension
    '            ddlCanTravel.Text = .canTravel

    '            txtSpouseLName.Text = .spouseLname
    '            txtSpouseFName.Text = .spouseFname
    '            txtSpouseMName.Text = .spouseMname
    '            txtSpouseExtName.Text = .spouseExtname

    '            txtFatherLName.Text = .fatherLname
    '            txtFatherFName.Text = .fatherFname
    '            txtFatherMName.Text = .fatherMname
    '            txtFatherExtName.Text = .fatherExtname

    '            txtMotherLName.Text = .motherLname
    '            txtMotherFName.Text = .motherFname
    '            txtMotherMName.Text = .motherMname
    '            txtMotherExtName.Text = .motherExtname

    '            rblEducAttainment.SelectedValue = .educationalAttainment
    '            txtSharedSkills.Text = .sharedSkills
    '            rblMonthlyIncome.SelectedValue = .monthlyIncome

    '            ddlBloodType.SelectedValue = .bloodType
    '            txtPhysicalDis.Text = .physicalDisability

    '            txtMedicineMaintenance.Text = .medicineMaintenance
    '            rblIsScheduledCheckup.SelectedValue = .isScheduledMedcheck
    '            ddlCheckUpSchedule.SelectedValue = .medcheckScheduled

    '        End With

    '        fillChildren()
    '        fillOtherDedpendents()

    '        fillGVLivingConA()
    '        fillGVLivingConB()

    '        fillGVSkills()
    '        fillGVCommunity()

    '        fillGVSource()
    '        fillGVAssetA()
    '        fillGVAssetB()

    '        fillGVPNC()

    '        fillGVHealth()
    '        fillGVDental()
    '        fillGVVisual()
    '        fillGVAural()
    '        fillGVSocial()
    '        fillGVDifficulty()

    '        'ATTACHMENTS
    '        fillGVAttachments()

    '    End Sub


    '    Private Sub fillRblEducational()

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT trans_id, CONCAT('&nbsp;',educ_level) AS description FROM tbl_ref_education_level " & _
    '                                    "WHERE tbl_ref_education_level.is_active = 'Y' ORDER BY sort_order")


    '        rblEducAttainment.DataSource = dt
    '        rblEducAttainment.DataValueField = "trans_id"
    '        rblEducAttainment.DataTextField = "description"
    '        rblEducAttainment.DataBind()

    '    End Sub

    '    'SUBMIT
    '    Protected Sub btnSaveApp_ServerClick(sender As Object, e As EventArgs) Handles btnSaveApp.ServerClick

    '        Dim dtValDocs As New DataTable
    '        Dim valBol As Boolean = True
    '        Dim _reqDesc As String = ""
    '        dtValDocs = Session("REQDOCS")

    '        For Each dr As DataRow In dtValDocs.Rows
    '            If dr("hasFile") = "FALSE" And dr("req_optional") = "N" Then
    '                _reqDesc = dr("req_desc")
    '                valBol = False

    '                Exit For
    '            End If
    '        Next

    '        If valBol = False Then
    '            thisMsgBox.setModalType("SUBMITXX")
    '            thisMsgBox.setError("Cannot Submit", _reqDesc & " is required!")



    '        Else
    '            Session("REF_STATUS") = "VALIDATION"
    '            thisMsgBox.setConfirm()
    '            thisMsgBox.setModalType("SUBMIT")
    '            thisMsgBox.setHeaderText("SUBMIT")
    '            thisMsgBox.setMessage("Are you sure you want to submit your registration?")
    '        End If
    '        thisMsgBox.showConfirmBox()
    '    End Sub

    '    Protected Sub btnContinueLater_ServerClick(sender As Object, e As EventArgs) Handles btnContinueLater.ServerClick
    '        Session("REF_STATUS") = "REGISTRATION"
    '        thisMsgBox.setConfirm()
    '        thisMsgBox.setModalType("CONTLATER")
    '        thisMsgBox.setHeaderText("CONTINUE LATER")
    '        thisMsgBox.setMessage("Do you want to save and continue your registration later?")
    '        thisMsgBox.showConfirmBox()

    '    End Sub

    '    Private Sub setConsent()
    '        If chkdp.Checked Then
    '            btnNextA.Visible = True
    '        Else
    '            btnNextA.Visible = False
    '        End If
    '    End Sub

    '    Protected Sub chkdp_CheckedChanged(sender As Object, e As EventArgs) Handles chkdp.CheckedChanged
    '        setConsent()
    '    End Sub

    '    Protected Sub btnNextA_ServerClick(sender As Object, e As EventArgs) Handles btnNextA.ServerClick

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT senior_id, ref_code, ref_status FROM tbl_senior_citizen_information " & _
    '                                   "WHERE last_name = '" & txtLastName.Text.Trim.ToUpper & "' AND first_name = '" & txtFirstName.Text.Trim.ToUpper & "' AND " & _
    '                                   "date_of_birth = '" & CDate(dtpBdate.Value).ToString("yyyy-MM-dd") & "' AND senior_id <> '" & Session("SENIOR_ID") & "' AND is_active = 'Y' LIMIT 1")

    '        If dt.Rows.Count > 0 Then

    '            If dt.Rows(0)("ref_status") = "REGISTRATION" Then

    '                Session("SENIOR_ID") = dt.Rows(0)("senior_id")

    '                thisMsgBox.setModalType("XXFORCONTINUE")
    '                thisMsgBox.setInfo("Continue Registration", "System detected that this Information already existed! <br/>" & _
    '                                   "Last Name: " & txtLastName.Text.Trim.ToUpper & "<br/>" & _
    '                                   "First Name: " & txtFirstName.Text.Trim.ToUpper & "<br/>" & _
    '                                   "Bdate: " & CDate(dtpBdate.Value).ToString("MMMM dd,yyyy") & "<br/>" & _
    '                                   "Click Ok to continue application.")
    '                thisMsgBox.showConfirmBox()

    '            Else

    '                thisMsgBox.setModalType("XXEXISTED")
    '                thisMsgBox.setInfo("Application Existed", "System detected that this Information already existed! <br/>" & _
    '                                  "Last Name: " & txtLastName.Text.Trim.ToUpper & "<br/>" & _
    '                                  "First Name: " & txtFirstName.Text.Trim.ToUpper & "<br/>" & _
    '                                  "Bdate: " & CDate(dtpBdate.Value).ToString("MMMM dd,yyyy") & "<br/>" & _
    '                                  "Reference Code: " & dt.Rows(0)("ref_code") & "<br/>" & _
    '                                  "Status: " & dt.Rows(0)("ref_status") & "<br/>" & _
    '                                  "Please Coordinate with the OSCA office for your ID.")
    '                thisMsgBox.showConfirmBox()

    '            End If

    '        Else

    '            Try
    '                CType(Application("clientList"), Dictionary(Of String, String())).Add(Session("UserCodeClient"), {Session("REFCODE"), txtFirstName.Text.Trim.ToUpper.ToString & " " & txtMiddleName.Text.Trim.ToUpper.ToString & " " & txtLastName.Text.Trim.ToUpper.ToString, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), GetIPAddress()})
    '            Catch ex As Exception

    '            End Try

    '            Dim _consent As String = ""

    '            _consent = _clsDB.Get_DB_Item("SELECT reference_code FROM tbl_consent WHERE reference_code = '" & Session("REFCODE") & "' LIMIT 1")

    '            If _consent = "" And chkdp.Checked Then

    '                With _clsDB.dbUtility
    '                    .fieldItems = "reference_code,ip_address"
    '                    .sqlString = .getSQLStatement("tbl_consent", "INSERT")
    '                    .ADDPARAM_CMD_String("reference_code", Session("REFCODE"))
    '                    .ADDPARAM_CMD_String("ip_address", GetIPAddress())
    '                    .executeUsingCommandFromSQL(True)
    '                End With
    '            End If

    '            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "btnNextA", " $('#btnNext1').click();", True)

    '        End If



    '    End Sub



    '#End Region

    '#Region "II FAMILY COMPOSITION"

    '    Private Sub saveChildren()

    '        With _clsSeniorChildren
    '            .seniorId = hfTransId.Value
    '            .deleteChildren()

    '            Dim count As Integer = 0
    '            Dim name As String = ""
    '            Dim isNull As Boolean = False

    '            For Each ctrl As Control In divChildren.Controls

    '                'MsgBox(ctrl.GetType().ToString & ":" & ctrl.ID)

    '                If TypeOf ctrl Is TextBox Then

    '                    If ctrl.ID.Split("x")(1).ToLower = "childname" Then
    '                        If Len(CType(ctrl, TextBox).Text) >= 2 AndAlso CType(ctrl, TextBox).Text <> "" Then
    '                            isNull = False
    '                            name = CType(ctrl, TextBox).Text
    '                        Else
    '                            isNull = True
    '                        End If
    '                    End If

    '                End If

    '                If isNull <> True Then
    '                    If TypeOf ctrl Is TextBox Then
    '                        If ctrl.ID.Split("x")(1).ToLower = "childname" Then
    '                            .initialize()
    '                            .childName = CType(ctrl, TextBox).Text.Trim.ToUpper
    '                        End If

    '                        If ctrl.ID.Split("x")(1).ToLower = "childoccupation" Then
    '                            .childOccupation = CType(ctrl, TextBox).Text.Trim.ToUpper
    '                        End If

    '                    End If


    '                    If TypeOf ctrl Is HtmlInputGenericControl Then
    '                        If ctrl.ID.Split("x")(1).ToLower = "childincome" Then
    '                            .childIncome = CType(ctrl, HtmlInputGenericControl).Value.Trim.ToUpper
    '                        End If

    '                        If ctrl.ID.Split("x")(1).ToLower = "childage" Then
    '                            .childAge = CType(ctrl, HtmlInputGenericControl).Value.Trim.ToUpper
    '                        End If

    '                    End If

    '                    If TypeOf ctrl Is DropDownList Then

    '                        If ctrl.ID.Split("x")(1).ToLower = "childisworking" Then
    '                            count += 1
    '                            .childIsWorking = CType(ctrl, DropDownList).SelectedValue
    '                            .sortOrder = count
    '                            .seniorId = hfTransId.Value
    '                            .saveSeniorChildren()
    '                        End If

    '                    End If


    '                End If

    '            Next


    '        End With

    '    End Sub

    '    Private Sub fillChildren()

    '        Dim dtChildren As New DataTable

    '        dtChildren = _clsSeniorChildren.browseSeniorChildren(hfTransId.Value)


    '        For Each dr As DataRow In dtChildren.Rows


    '            For Each ctrl As Control In divChildren.Controls

    '                If TypeOf ctrl Is TextBox Then
    '                    If ctrl.ID.Split("x")(1).ToLower = "childname" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, TextBox).Text = dr("child_name")
    '                    End If

    '                    If ctrl.ID.Split("x")(1).ToLower = "childoccupation" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, TextBox).Text = dr("child_occupation")
    '                    End If

    '                End If

    '                If TypeOf ctrl Is HtmlInputGenericControl Then
    '                    If ctrl.ID.Split("x")(1).ToLower = "childincome" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, HtmlInputGenericControl).Value = dr("child_income")
    '                    End If

    '                    If ctrl.ID.Split("x")(1).ToLower = "childage" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, HtmlInputGenericControl).Value = dr("child_age")
    '                    End If

    '                End If

    '                If TypeOf ctrl Is DropDownList Then
    '                    If ctrl.ID.Split("x")(1).ToLower = "childisworking" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, DropDownList).SelectedValue = dr("child_is_working")
    '                    End If
    '                End If

    '            Next
    '        Next

    '    End Sub


    '    Private Sub saveOtherDependents()

    '        With _clsSeniorOtherDependents
    '            .seniorId = hfTransId.Value
    '            .deleteOtherDependents()

    '            Dim count As Integer = 0
    '            Dim name As String = ""
    '            Dim isNull As Boolean

    '            For Each ctrl As Control In divDependents.Controls

    '                If TypeOf ctrl Is TextBox Then

    '                    If ctrl.ID.Split("x")(1).ToLower = "depname" Then
    '                        If Len(CType(ctrl, TextBox).Text) >= 2 AndAlso CType(ctrl, TextBox).Text <> "" Then
    '                            isNull = False
    '                            name = CType(ctrl, TextBox).Text
    '                        Else
    '                            isNull = True
    '                        End If
    '                    End If

    '                End If

    '                If isNull <> True Then
    '                    If TypeOf ctrl Is TextBox Then
    '                        If ctrl.ID.Split("x")(1).ToLower = "depname" Then
    '                            .initialize()
    '                            .depName = CType(ctrl, TextBox).Text.Trim.ToUpper
    '                        End If

    '                        If ctrl.ID.Split("x")(1).ToLower = "depoccupation" Then
    '                            .depOccupation = CType(ctrl, TextBox).Text.Trim.ToUpper
    '                        End If

    '                    End If

    '                    If TypeOf ctrl Is HtmlInputGenericControl Then
    '                        If ctrl.ID.Split("x")(1).ToLower = "depincome" Then
    '                            .depIncome = CType(ctrl, HtmlInputGenericControl).Value.Trim.ToUpper
    '                        End If

    '                        If ctrl.ID.Split("x")(1).ToLower = "depage" Then
    '                            .depAge = CType(ctrl, HtmlInputGenericControl).Value.Trim.ToUpper
    '                        End If

    '                    End If

    '                    If TypeOf ctrl Is DropDownList Then

    '                        If ctrl.ID.Split("x")(1).ToLower = "depisworking" Then
    '                            count += 1
    '                            .depIsWorking = CType(ctrl, DropDownList).SelectedValue
    '                            .sortOrder = count
    '                            .seniorId = hfTransId.Value
    '                            .saveSeniorOtherDependents()
    '                        End If

    '                    End If


    '                End If

    '            Next


    '        End With

    '    End Sub

    '    Private Sub fillOtherDedpendents()

    '        Dim dtDep As New DataTable

    '        dtDep = _clsSeniorOtherDependents.browseSeniorOtherDependents(hfTransId.Value)


    '        For Each dr As DataRow In dtDep.Rows


    '            For Each ctrl As Control In divDependents.Controls

    '                If TypeOf ctrl Is TextBox Then
    '                    If ctrl.ID.Split("x")(1).ToLower = "depname" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, TextBox).Text = dr("dep_name")
    '                    End If

    '                    If ctrl.ID.Split("x")(1).ToLower = "depoccupation" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, TextBox).Text = dr("dep_occupation")
    '                    End If

    '                End If

    '                If TypeOf ctrl Is HtmlInputGenericControl Then
    '                    If ctrl.ID.Split("x")(1).ToLower = "depincome" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, HtmlInputGenericControl).Value = dr("dep_income")
    '                    End If

    '                    If ctrl.ID.Split("x")(1).ToLower = "depage" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, HtmlInputGenericControl).Value = dr("dep_age")
    '                    End If

    '                End If

    '                If TypeOf ctrl Is DropDownList Then
    '                    If ctrl.ID.Split("x")(1).ToLower = "depisworking" AndAlso ctrl.ID.Split("x")(2) = dr("sort_order") Then
    '                        CType(ctrl, DropDownList).SelectedValue = dr("dep_is_working")
    '                    End If
    '                End If

    '            Next
    '        Next

    '    End Sub

    '#End Region

    '#Region "III DEPENDENCY PROFILE"
    '    Private Sub fillGVLivingConA()

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_living_a.trans_id, CONCAT('&nbsp;',tbl_ref_living_a.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_living_a.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_living_a.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_living_a.other_description FROM tbl_ref_living_a " & _
    '                                   "LEFT JOIN tbl_senior_living_a ON tbl_ref_living_a.trans_id = tbl_senior_living_a.dependency_id AND " & _
    '                                   "tbl_senior_living_a.senior_id = '" & hfTransId.Value & "' " & _
    '                                   "WHERE tbl_ref_living_a.is_active = 'Y' ORDER BY tbl_ref_living_a.sort_order")

    '        _gvLivingConditionA.DataSource = dt
    '        _gvLivingConditionA.DataBind()

    '    End Sub


    '    Private Sub saveLivingConditionA()

    '        With _clsSeniorLivingA
    '            .seniorId = hfTransId.Value
    '            .deleteLivingConA()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvLivingConditionA.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorLivingA
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .dependencyId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorLivingA()
    '                End With

    '            End If

    '        Next

    '    End Sub


    '    Private Sub fillGVLivingConB()

    '        Dim dt As New DataTable


    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_living_b.trans_id, CONCAT('&nbsp;',tbl_ref_living_b.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_living_b.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_living_b.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_living_b.other_description FROM tbl_ref_living_b " & _
    '                                   "LEFT JOIN tbl_senior_living_b ON tbl_ref_living_b.trans_id = tbl_senior_living_b.dependency_id AND " & _
    '                                   "tbl_senior_living_b.senior_id = '" & hfTransId.Value & "' " & _
    '                                   "WHERE tbl_ref_living_b.is_active = 'Y' ORDER BY  tbl_ref_living_b.sort_order")

    '        _gvLivingConditionB.DataSource = dt
    '        _gvLivingConditionB.DataBind()

    '    End Sub

    '    Private Sub saveLivingConditionB()

    '        With _clsSeniorLivingB
    '            .seniorId = hfTransId.Value
    '            .deleteLivingConB()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvLivingConditionB.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorLivingB
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .dependencyId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorLivingB()
    '                End With

    '            End If

    '        Next

    '    End Sub

    '#End Region

    '#Region "IV EDUCATION / HR PROFILE"

    '    Private Sub fillGVSkills()

    '        Dim dt As New DataTable


    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_skills.trans_id, CONCAT('&nbsp;',tbl_ref_skills.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_skills.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_skills.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_skills.other_description FROM tbl_ref_skills " & _
    '                                   "LEFT JOIN tbl_senior_skills ON tbl_ref_skills.trans_id = tbl_senior_skills.skills_id AND " & _
    '                                   "tbl_senior_skills.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_skills.is_active = 'Y' ORDER BY tbl_ref_skills.sort_order")

    '        _gvSkills.DataSource = dt
    '        _gvSkills.DataBind()

    '    End Sub


    '    Private Sub saveSkills()

    '        With _clsSeniorSkills
    '            .seniorId = hfTransId.Value
    '            .deleteSkills()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvSkills.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then
    '                With _clsSeniorSkills
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .skillsId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorSkills()
    '                End With

    '            End If

    '        Next

    '    End Sub



    '    Private Sub fillGVCommunity()

    '        Dim dt As New DataTable


    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_community.trans_id, CONCAT('&nbsp;',tbl_ref_community.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_community.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_community.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_community.other_description FROM tbl_ref_community " & _
    '                                   "LEFT JOIN tbl_senior_community ON tbl_ref_community.trans_id = tbl_senior_community.community_id AND " & _
    '                                   "tbl_senior_community.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_community.is_active = 'Y' ORDER BY tbl_ref_community.sort_order")

    '        _gvCommunity.DataSource = dt
    '        _gvCommunity.DataBind()

    '    End Sub

    '    Private Sub saveCommunity()

    '        With _clsSeniorCommunity
    '            .seniorId = hfTransId.Value
    '            .deleteCommunity()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvCommunity.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorCommunity
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .communityId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorCommunity()
    '                End With

    '            End If

    '        Next

    '    End Sub

    '#End Region

    '#Region "V. ECONOMIC PROFILE"

    '    Private Sub fillGVSource()

    '        Dim dt As New DataTable


    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_source_income.trans_id, CONCAT('&nbsp;',tbl_ref_source_income.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_source_income.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_source_income.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_source_income.other_description FROM tbl_ref_source_income " & _
    '                                   "LEFT JOIN tbl_senior_source_income ON tbl_ref_source_income.trans_id = tbl_senior_source_income.income_id AND " & _
    '                                   "tbl_senior_source_income.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_source_income.is_active = 'Y' ORDER BY tbl_ref_source_income.sort_order")

    '        _gvSourceIncome.DataSource = dt
    '        _gvSourceIncome.DataBind()

    '    End Sub

    '    Private Sub saveSourceIncome()

    '        With _clsSeniorSourceIncome
    '            .seniorId = hfTransId.Value
    '            .deleteSourceIncome()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvSourceIncome.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorSourceIncome
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .incomeId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorSourceIncome()
    '                End With

    '            End If

    '        Next

    '    End Sub

    '    Private Sub fillGVAssetA()

    '        Dim dt As New DataTable


    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_asset_a.trans_id, CONCAT('&nbsp;',tbl_ref_asset_a.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_asset_a.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_asset_a.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_asset_a.other_description FROM tbl_ref_asset_a " & _
    '                                   "LEFT JOIN tbl_senior_asset_a ON tbl_ref_asset_a.trans_id = tbl_senior_asset_a.asset_id AND " & _
    '                                   "tbl_senior_asset_a.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_asset_a.is_active = 'Y' ORDER BY tbl_ref_asset_a.sort_order")

    '        _gvAssetA.DataSource = dt
    '        _gvAssetA.DataBind()

    '    End Sub

    '    Private Sub saveAssetA()

    '        With _clsSeniorAssetA
    '            .seniorId = hfTransId.Value
    '            .deleteAsset()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvAssetA.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorAssetA
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .assetId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorAssetA()
    '                End With

    '            End If

    '        Next

    '    End Sub


    '    Private Sub fillGVAssetB()

    '        Dim dt As New DataTable


    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_asset_b.trans_id, CONCAT('&nbsp;',tbl_ref_asset_b.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_asset_b.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_asset_b.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_asset_b.other_description FROM tbl_ref_asset_b " & _
    '                                   "LEFT JOIN tbl_senior_asset_b ON tbl_ref_asset_b.trans_id = tbl_senior_asset_b.asset_id AND " & _
    '                                   "tbl_senior_asset_b.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_asset_b.is_active = 'Y' ORDER BY tbl_ref_asset_b.sort_order")

    '        _gvAssetB.DataSource = dt
    '        _gvAssetB.DataBind()

    '    End Sub

    '    Private Sub saveAssetB()

    '        With _clsSeniorAssetB
    '            .seniorId = hfTransId.Value
    '            .deleteAsset()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvAssetB.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorAssetB
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .assetId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorAssetB()
    '                End With

    '            End If

    '        Next

    '    End Sub


    '    Private Sub fillRblMonthlyIncome()

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_monthly_income.trans_id, CONCAT('&nbsp;',tbl_ref_monthly_income.description) AS description FROM tbl_ref_monthly_income " & _
    '                                    "WHERE tbl_ref_monthly_income.is_active = 'Y' ORDER BY sort_order")

    '        rblMonthlyIncome.DataSource = dt
    '        rblMonthlyIncome.DataValueField = "trans_id"
    '        rblMonthlyIncome.DataTextField = "description"
    '        rblMonthlyIncome.DataBind()

    '    End Sub


    '    Private Sub fillGVPNC()

    '        Dim dt As New DataTable


    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_pnc.trans_id, CONCAT('&nbsp;',tbl_ref_pnc.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_pnc.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_pnc.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_pnc.other_description FROM tbl_ref_pnc " & _
    '                                   "LEFT JOIN tbl_senior_pnc ON tbl_ref_pnc.trans_id = tbl_senior_pnc.pnc_id AND " & _
    '                                   "tbl_senior_pnc.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_pnc.is_active = 'Y' ORDER BY tbl_ref_pnc.sort_order")

    '        _gvPNC.DataSource = dt
    '        _gvPNC.DataBind()

    '    End Sub


    '    Private Sub savePNC()

    '        With _clsSeniorPNC
    '            .seniorId = hfTransId.Value
    '            .deletePNC()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvPNC.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorPNC
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .pncId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorPnc()
    '                End With

    '            End If

    '        Next

    '    End Sub

    '#End Region

    '#Region "VI. HEALTH PROFILE"


    '    Private Sub fillGVHealth()

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_health.trans_id, CONCAT('&nbsp;',tbl_ref_health.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_health.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_health.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_health.other_description FROM tbl_ref_health " & _
    '                                   "LEFT JOIN tbl_senior_health ON tbl_ref_health.trans_id = tbl_senior_health.health_id AND " & _
    '                                   "tbl_senior_health.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_health.is_active = 'Y' ORDER BY tbl_ref_health.sort_order")

    '        _gvHealth.DataSource = dt
    '        _gvHealth.DataBind()

    '    End Sub

    '    Private Sub saveHealth()

    '        With _clsSeniorHealth
    '            .seniorId = hfTransId.Value
    '            .deleteHealth()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvHealth.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorHealth
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .healthId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorHealth()
    '                End With

    '            End If

    '        Next

    '    End Sub

    '    Private Sub fillGVDental()

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_dental.trans_id, CONCAT('&nbsp;',tbl_ref_dental.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_dental.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_dental.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_dental.other_description FROM tbl_ref_dental " & _
    '                                   "LEFT JOIN tbl_senior_dental ON tbl_ref_dental.trans_id = tbl_senior_dental.dental_id AND " & _
    '                                   "tbl_senior_dental.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_dental.is_active = 'Y' ORDER BY tbl_ref_dental.sort_order")

    '        _gvDental.DataSource = dt
    '        _gvDental.DataBind()

    '    End Sub

    '    Private Sub saveDental()

    '        With _clsSeniorDental
    '            .seniorId = hfTransId.Value
    '            .deleteDental()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvDental.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorDental
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .dentalId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorDental()
    '                End With

    '            End If

    '        Next

    '    End Sub

    '    Private Sub fillGVVisual()

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_visual.trans_id, CONCAT('&nbsp;',tbl_ref_visual.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_visual.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_visual.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_visual.other_description FROM tbl_ref_visual " & _
    '                                   "LEFT JOIN tbl_senior_visual ON tbl_ref_visual.trans_id = tbl_senior_visual.visual_id AND " & _
    '                                   "tbl_senior_visual.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_visual.is_active = 'Y' ORDER BY tbl_ref_visual.sort_order")

    '        _gvVisual.DataSource = dt
    '        _gvVisual.DataBind()

    '    End Sub

    '    Private Sub saveVisual()

    '        With _clsSeniorVisual
    '            .seniorId = hfTransId.Value
    '            .deleteVisual()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvVisual.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorVisual
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .visualId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorVisual()
    '                End With

    '            End If

    '        Next

    '    End Sub

    '    Private Sub fillGVAural()

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_aural.trans_id, CONCAT('&nbsp;',tbl_ref_aural.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_aural.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_aural.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_aural.other_description FROM tbl_ref_aural " & _
    '                                   "LEFT JOIN tbl_senior_aural ON tbl_ref_aural.trans_id = tbl_senior_aural.aural_id AND " & _
    '                                   "tbl_senior_aural.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_aural.is_active = 'Y' ORDER BY tbl_ref_aural.sort_order")

    '        _gvAural.DataSource = dt
    '        _gvAural.DataBind()

    '    End Sub


    '    Private Sub saveAural()

    '        With _clsSeniorAural
    '            .seniorId = hfTransId.Value
    '            .deleteAural()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvAural.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorAural
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .auralId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorAural()
    '                End With

    '            End If

    '        Next

    '    End Sub


    '    Private Sub fillGVSocial()

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_social.trans_id, CONCAT('&nbsp;',tbl_ref_social.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_social.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_social.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_social.other_description FROM tbl_ref_social " & _
    '                                   "LEFT JOIN tbl_senior_social ON tbl_ref_social.trans_id = tbl_senior_social.social_id AND " & _
    '                                   "tbl_senior_social.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_social.is_active = 'Y' ORDER BY tbl_ref_social.sort_order")

    '        _gvSocial.DataSource = dt
    '        _gvSocial.DataBind()

    '    End Sub


    '    Private Sub saveSocial()

    '        With _clsSeniorSocial
    '            .seniorId = hfTransId.Value
    '            .deleteSocial()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvSocial.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorSocial
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .socialId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorSocial()
    '                End With

    '            End If

    '        Next

    '    End Sub

    '    Private Sub fillGVDifficulty()

    '        Dim dt As New DataTable

    '        dt = _clsDB.Fill_DataTable("SELECT tbl_ref_difficulty.trans_id, CONCAT('&nbsp;',tbl_ref_difficulty.description) AS description, " & _
    '                                   "(CASE WHEN tbl_senior_difficulty.trans_id IS NULL THEN 'FALSE' ELSE 'TRUE' END) AS isSelected, " & _
    '                                   "(CASE WHEN tbl_ref_difficulty.is_specific = 'N' THEN 'FALSE' ELSE 'TRUE' END) AS is_specific, " & _
    '                                   "tbl_senior_difficulty.other_description FROM tbl_ref_difficulty " & _
    '                                   "LEFT JOIN tbl_senior_difficulty ON tbl_ref_difficulty.trans_id = tbl_senior_difficulty.difficulty_id AND " & _
    '                                   "tbl_senior_difficulty.senior_id = '" & hfTransId.Value & "' " & _
    '                                    "WHERE tbl_ref_difficulty.is_active = 'Y' ORDER BY tbl_ref_difficulty.sort_order")

    '        _gvDifficulty.DataSource = dt
    '        _gvDifficulty.DataBind()

    '    End Sub

    '    Private Sub saveDifficulty()

    '        With _clsSeniorDifficulty
    '            .seniorId = hfTransId.Value
    '            .deleteDifficulty()
    '        End With

    '        For Each _gvRow As GridViewRow In _gvDifficulty.Rows

    '            Dim chkSelect As CheckBox = CType(_gvRow.FindControl("chkSelect"), CheckBox)

    '            Dim otherDesc As TextBox = CType(_gvRow.FindControl("txtOtherDescription"), TextBox)

    '            If chkSelect.Checked Then

    '                With _clsSeniorDifficulty
    '                    .initialize()
    '                    .seniorId = hfTransId.Value
    '                    .difficultyId = chkSelect.Attributes("transId").ToString
    '                    .otherDescription = IIf(chkSelect.Attributes("isSpecific") = "TRUE", otherDesc.Text.Trim.ToUpper, "")
    '                    .lastUser = Session("REFCODE")
    '                    .saveSeniorDifficulty()
    '                End With

    '            End If

    '        Next

    '    End Sub

    '#End Region

    '#Region "VII ATTACHMENTS"

    '    Public Sub fillGVAttachments()
    '        Dim dtDocs As New DataTable
    '        dtDocs = _clsReqDocs.browseAttachments(hfTransId.Value)
    '        _gvRequiredDocs.DataSource = dtDocs
    '        _gvRequiredDocs.DataBind()

    '        Session("REQDOCS") = dtDocs
    '    End Sub

    '    'UPLOAD
    '    Protected Sub btnFillGVAttach_ServerClick(sender As Object, e As EventArgs) Handles btnFillGVAttach.ServerClick

    '        thisMsgBox.setModalType("UPLOADFILEOK")
    '        thisMsgBox.setInfo("INFO", "File uploaded successfully!")
    '        thisMsgBox.showConfirmBox()
    '        ' mdlUpload.Visible = False

    '    End Sub

    '    Protected Sub cmdGVUpload(ByVal sender As Object, ByVal e As CommandEventArgs)

    '        'hfDocType.Value = e.CommandArgument

    '        ' If Session("IS_UPLOAD") = "N" Then
    '        Session("DOCTYPE") = e.CommandArgument
    '        spanUploadHeaderText.InnerText = "UPLOAD: " & CType(sender, Button).Attributes("docDesc")
    '        '  ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlUpload", "var myModal = new bootstrap.Modal(document.getElementById('mdlUpload'), {});  myModal.show();", True)
    '        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlUpload", "var myModal = new bootstrap.Modal(document.getElementById('mdlUpload'), {});  myModal.show();  var imageInput = $('#fuRequirements'); imageInput.fileinput('clear').fileinput('reset');", True)

    '    End Sub

    '    Protected Sub AjaxFileUpload1_UploadComplete(sender As Object, e As EventArgs)
    '        Dim fileUpload As AjaxControlToolkit.AsyncFileUpload

    '        fileUpload = CType(sender, AjaxControlToolkit.AsyncFileUpload)

    '        ' MsgBox(fileUpload.HasFile)

    '        ' uploadFile()
    '        '  fillGVAttachments()
    '    End Sub


    '    Public Shared Function ResizeImage(ByVal InputImage As Image, ByVal inputWidth As Integer, ByVal inputHeight As Integer) As Image

    '        Return New Bitmap(InputImage, New Size(inputWidth, inputHeight))

    '    End Function

    '    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click

    '        ' MsgBox(fuRequirements.HasFile)

    '        'Dim postedFile As HttpPostedFile = Request.Files("inputFile")

    '        'If postedFile IsNot Nothing Then
    '        '    MsgBox("naa")
    '        'Else
    '        '    MsgBox("wala")
    '        'End If

    '        ' uploadFile()
    '        ' fillGVAttachments()

    '    End Sub

    '    'REMOVE
    '    Protected Sub cmdGVRemove(ByVal sender As Object, ByVal e As CommandEventArgs)

    '        hfDocType.Value = e.CommandArgument
    '        thisMsgBox.setConfirm()
    '        thisMsgBox.setHeader("RED", "YELLOW")
    '        thisMsgBox.setModalType("REMOVE ATTACHMENT")
    '        thisMsgBox.setHeaderText("REMOVE ATTACHMENT")
    '        thisMsgBox.setMessage("Are you sure to remove this attachment?")
    '        thisMsgBox.showConfirmBox()

    '    End Sub

    '    Private Sub removeAttachment()

    '        With _clsReqDocs
    '            .seniorId = hfTransId.Value
    '            .documentCode = hfDocType.Value
    '            .deleteDocument()
    '        End With

    '    End Sub


    '    'REMOVE

    '    Protected Sub cmdGVView(ByVal sender As Object, ByVal e As CommandEventArgs)
    '        displayPDF(e.CommandArgument.ToString)

    '    End Sub

    '    Public Sub displayPDF(ByVal _thisDoc As String)

    '        _clsReqDocs.getRequiredDocuments(_thisDoc)

    '        Dim size() As String = _clsReqDocs.fileSize.Split("|")
    '        Dim thisWidth As Integer = size(1)

    '        'Dim thisHeight As Integer = size(2)

    '        'If thisWidth > 1900 Then
    '        '    thisWidth = 1800
    '        'End If

    '        divMdlPreviewSize.Attributes.Add("style", "width:" & (thisWidth + 50) & "px;")

    '        ltEmbedPreview.Text = String.Format(_clsReqDocs.formatDoc, ResolveUrl("~/pdfHandler.ashx?Id="), _clsReqDocs.transId)

    '        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mdlViewUpload", "var myModal = new bootstrap.Modal(document.getElementById('mdlViewUpload'), {});  myModal.show();", True)

    '    End Sub

    '#End Region

    '#Region "SMS"

    '    Public Shared Function GetIPAddress() As String
    '        Dim context As System.Web.HttpContext = System.Web.HttpContext.Current
    '        Dim sIPAddress As String = context.Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    '        If String.IsNullOrEmpty(sIPAddress) Then
    '            Return context.Request.ServerVariables("REMOTE_ADDR")
    '        Else
    '            Dim ipArray As String() = sIPAddress.Split(New [Char]() {","c})
    '            Return ipArray(0)
    '        End If
    '    End Function

    '#End Region

End Class
