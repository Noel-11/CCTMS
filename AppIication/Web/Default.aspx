<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb"
    Inherits="_Default" MasterPageFile="~/MasterPage/Public.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpConTent" runat="Server">

    <section class="page1">
        <div class="container">
            <div class="hero-title">
                <div class="brand-logos brand-logos-themed d-inline-flex mb-3">
                    <img src="<%=ResolveClientUrl("~/Images/CDOSeal.png")%>" alt="City of Cagayan de Oro Seal" class="brand-logo" />
                    <img src="<%=ResolveClientUrl("~/Images/RISE.png")%>" alt="RISE Cagayan de Oro" class="brand-logo brand-logo-wide" />
                </div>
                <div class="college"><b>CITY COLLEGE</b></div>
                <div class="empower mb-3">EMPOWER YOUR FUTURE</div>

                <span class="badge rounded-pill badge-gold badge-gold-lg mb-2">SEMINAR</span>
                <div class="cont mb-3"><span class="text-warning-em">CONTINUING </span><span>PROFESSIONAL</span> <span>DEVELOPMENT</span></div>
                <div class="sub mb-2">TRAINING</div>
            </div>
        </div>
    </section>

    <section class="pb-5">
        <div class="container">
            <div class="col-lg-8 mx-auto">
                <div class="card home-card border-0 shadow-lg rounded-4 p-4 p-md-5 text-center">
                    <p class="mb-3">
                        The City College of Cagayan de Oro, through the Office for Lifelong Learning and Professional Development (OLLPD), is committed to fostering
                        a culture of continuous growth and excellence.
                    </p>

                    <p class="mb-4">
                        Pre-registration is now available for Continuing Professional Development (CPD) programs, specialized training sessions, and seminars.
                        Whether you are a professional seeking license renewal, a worker looking to upskill, or a lifelong learner,
                        our programs are designed to meet the evolving demands of the global workforce.
                    </p>

                    <div class="d-flex flex-wrap justify-content-center gap-3">
                        <a href="Join.aspx" class="btn btn-outline-success btn-lg px-4 rounded-pill">
                            <i class="bi bi-info-circle me-1"></i>WHY JOIN OUR PROGRAMS?
                        </a>
                        <a href="Registration.aspx" class="btn btn-green btn-lg px-4 rounded-pill">
                            REGISTER <i class="bi bi-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
