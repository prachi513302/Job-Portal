<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JobPortal — Find Your Next Role</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <style>
            .hero {
                background: var(--ink);
                color: #fff;
                padding: 5rem 0 6rem;
                position: relative;
                overflow: hidden;
            }
            .hero::after {
                content: "";
                position: absolute;
                right: -60px;
                bottom: -120px;
                width: 320px;
                height: 320px;
                border: 60px solid var(--gold);
                opacity: .12;
                border-radius: 4px;
                transform: rotate(18deg);
            }
            .hero h1 {
                color: #fff;
                font-size: 2.8rem;
                max-width: 620px;
            }
            .hero .accent {
                color: var(--gold);
            }
            .hero p.lead {
                color: rgba(255,255,255,.75);
                max-width: 520px;
                margin-top: 1rem;
            }
            .hero-actions {
                margin-top: 2rem;
                display: flex;
                gap: .75rem;
                flex-wrap: wrap;
            }
            .hero .btn-outline-light {
                border-radius: var(--radius);
                font-weight: 600;
            }
            .feature-strip {
                background: var(--paper-card);
                border-bottom: 1px solid var(--line);
            }
            .feature-strip .col {
                padding: 2.5rem 1rem;
                text-align: center;
                border-right: 1px solid var(--line);
            }
            .feature-strip .col:last-child {
                border-right: none;
            }
            .feature-strip h3 {
                font-family: var(--font-mono);
                color: var(--gold-deep);
                font-size: 2rem;
                margin-bottom: .25rem;
            }
            .feature-strip span {
                color: var(--text-muted);
                font-size: .85rem;
                text-transform: uppercase;
                letter-spacing: .05em;
            }
            .section-title {
                text-align: center;
                margin: 3.5rem 0 2rem;
            }
            .how-step {
                text-align: center;
                padding: 1.5rem;
            }
            .how-step .num {
                font-family: var(--font-mono);
                color: var(--gold-deep);
                font-size: .85rem;
                letter-spacing: .1em;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <section class="hero">
            <div class="container">
                <h1>Your next role is one application away<span class="accent">.</span></h1>
                <p class="lead">JobPortal connects job seekers with companies that are hiring right now — track every application from first click to offer letter.</p>
                <div class="hero-actions">
                    <a href="register.jsp" class="btn btn-primary">Create a Free Account</a>
                    <a href="JobListServlet" class="btn btn-outline-light">Browse Open Roles</a>
                </div>
            </div>
        </section>

        <div class="feature-strip">
            <div class="container">
                <div class="row g-0">
                    <div class="col"><h3>100+</h3><span>Open Roles</span></div>
                    <div class="col"><h3>50+</h3><span>Hiring Companies</span></div>
                    <div class="col"><h3>24h</h3><span>Avg. Response Time</span></div>
                </div>
            </div>
        </div>

        <div class="container">
            <h2 class="section-title">How it works</h2>
            <div class="row">
                <div class="col-md-4 how-step">
                    <div class="num">STEP 01</div>
                    <h5 class="mt-2">Build your profile</h5>
                    <p class="text-muted small">Add your skills and experience once, use it for every application.</p>
                </div>
                <div class="col-md-4 how-step">
                    <div class="num">STEP 02</div>
                    <h5 class="mt-2">Apply in one click</h5>
                    <p class="text-muted small">Browse open roles and apply directly — no separate accounts per company.</p>
                </div>
                <div class="col-md-4 how-step">
                    <div class="num">STEP 03</div>
                    <h5 class="mt-2">Track every status</h5>
                    <p class="text-muted small">Watch each application move from Applied to Shortlisted to Hired.</p>
                </div>
            </div>
        </div>

        <div class="container mb-5 mt-3 text-center">
            <p class="text-muted">Hiring instead of applying? <a href="recruiter-register.jsp">Post a job as a recruiter →</a></p>
        </div>

    </body>
</html>
