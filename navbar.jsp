<%
    Object loggedUser = session.getAttribute("user");
    Object loggedRecruiter = session.getAttribute("recruiter");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <span class="brand-mark">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect x="3" y="7" width="18" height="13" rx="2" stroke="white" stroke-width="2"/>
                    <path d="M8 7V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" stroke="white" stroke-width="2"/>
                </svg>
            </span>
            <span>Job<span class="accent">Portal</span></span>
        </a>
        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav ms-auto align-items-lg-center">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <% if (loggedUser != null) { %>
                <li class="nav-item">
                    <a class="nav-link" href="JobListServlet">Find Jobs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="MyApplicationsServlet">My Applications</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item ms-lg-2">
                    <a class="nav-link btn-nav-cta" href="LogoutServlet">Logout</a>
                </li>
                <% } else if (loggedRecruiter != null) { %>
                <li class="nav-item">
                    <a class="nav-link" href="recruiter-dashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="post-job.jsp">Post a Job</a>
                </li>
                <li class="nav-item ms-lg-2">
                    <a class="nav-link btn-nav-cta" href="LogoutServlet">Logout</a>
                </li>
                <% } else { %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        Login
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="login.jsp">Job Seeker</a></li>
                        <li><a class="dropdown-item" href="recruiter-login.jsp">Recruiter</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        Register
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="register.jsp">Job Seeker</a></li>
                        <li><a class="dropdown-item" href="recruiter-register.jsp">Recruiter</a></li>
                    </ul>
                </li>
                <% }%>
            </ul>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
