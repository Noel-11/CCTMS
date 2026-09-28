<%@ Page Title="CCTMS" Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Secured_Default" Theme="Skins" MasterPageFile="~/MasterPage/Admin.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <div class="d-flex flex-column flex-md-row align-items-center gap-3 mt-4">
        <div class="brand-logos">
            <img src="<%=ResolveClientUrl("~/Images/CDOSeal.png")%>" alt="City of Cagayan de Oro Seal" class="brand-logo" />
            <img src="<%=ResolveClientUrl("~/Images/RISE.png")%>" alt="RISE Cagayan de Oro" class="brand-logo brand-logo-wide" />
        </div>
        <h1 class="mb-0">WELCOME TO CITY COLLEGE TRAINING MANAGEMENT SYSTEM</h1>
    </div>
   
</asp:Content>
