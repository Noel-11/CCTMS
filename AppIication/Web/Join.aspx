<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Join.aspx.vb" 
    Inherits="_Join" MasterPageFile="~/MasterPage/Public.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

     <section class="page_join mb-5">
            <div class="container text-center">
                <div class="brand-logos brand-logos-themed d-inline-flex mb-3">
                    <img src="<%=ResolveClientUrl("~/Images/CDOSeal.png")%>" alt="City of Cagayan de Oro Seal" class="brand-logo" />
                    <img src="<%=ResolveClientUrl("~/Images/RISE.png")%>" alt="RISE Cagayan de Oro" class="brand-logo brand-logo-wide" />
                </div>
                <br />
                <span class="badge rounded-pill badge-gold mb-3">GET INVOLVED</span>
                <div class="join"><b>WHY JOIN OUR
                    <br>
                    PROGRAMS?</b></div>
            </div>
        </section>

        <section class="pb-5">
            <div class="container">
                <div class="col-lg-9 mx-auto">
                    <p class="mb-4 text-center fs-5">
                        By registering your interest, you get early access to high-quality training tailored to the needs of the Kagay-anon community and beyond:
                    </p>

                    <div class="row g-4 mb-3">
                        <div class="col-md-6">
                            <div class="card feature-card h-100 border-0 shadow-sm rounded-4">
                                <div class="card-body d-flex">
                                    <i class="bi bi-patch-check-fill fs-3 me-3"></i>
                                    <div>
                                        <h6 class="fw-bold mb-1">PRC-Accredited CPD Units</h6>
                                        <span class="text-secondary">Earn the required units for professional license renewal in various fields.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card feature-card h-100 border-0 shadow-sm rounded-4">
                                <div class="card-body d-flex">
                                    <i class="bi bi-gear-fill fs-3 me-3"></i>
                                    <div>
                                        <h6 class="fw-bold mb-1">Industry-Relevant Skills</h6>
                                        <span class="text-secondary">Gain practical knowledge in technology, pedagogy, leadership, and management.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card feature-card h-100 border-0 shadow-sm rounded-4">
                                <div class="card-body d-flex">
                                    <i class="bi bi-mortarboard-fill fs-3 me-3"></i>
                                    <div>
                                        <h6 class="fw-bold mb-1">Expert Mentorship</h6>
                                        <span class="text-secondary">Learn from seasoned practitioners and academic leaders.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card feature-card h-100 border-0 shadow-sm rounded-4">
                                <div class="card-body d-flex">
                                    <i class="bi bi-people-fill fs-3 me-3"></i>
                                    <div>
                                        <h6 class="fw-bold mb-1">Networking Opportunities</h6>
                                        <span class="text-secondary">Connect with a diverse community of professionals and experts in your field.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

</asp:Content>

