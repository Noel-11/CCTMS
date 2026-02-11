<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" 
    Inherits="_Login" MasterPageFile="~/MasterPage/Public.master" %>

<%@ Register Src="~/Include/wucConfirmBoxBS5.ascx" TagName="wucConfirmBox" TagPrefix="wucConfirmBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">
       
      <section class="page1">
            <div class="container">
                <div class="college"><b>CITY COLLEGE</b></div>
                <div class="empower">EMPOWER YOUR FUTURE</div>

                <div class="highlight mb-2">SEMINAR</div>
                <div class="cont mb-3"><span style="color: #e5b417;">CONTINUING </span><span>PROFESSIONAL</span> <span style="color: black;">DEVELOPMENT</span></div>
                <div class="sub mb-2">TRAINING</div>
            </div>
        </section>

        <!-- LOGIN --> 
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <div class="login-box text-center">
                    <div class="mb-3">
                        <asp:TextBox runat="server" CssClass="form-control" Placeholder="username" ID="txtUserName" />
                    </div>
                    <div class="mb-3">
                        <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" Placeholder="password" ID="txtPassword" />
                    </div>

                    <asp:Button runat="server" Text="LOGIN" class="btn btn-green px-5" ID="btnLogin" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel runat="server" ID="upUpdate">
            <ContentTemplate>

                <wucConfirmBox:wucConfirmBox runat="server" ID="thisMsgBox" />
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

