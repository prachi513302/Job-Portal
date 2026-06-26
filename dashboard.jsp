<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">

                    <div class="card dashboard-card">
                        <div class="card-body text-center p-4">

                            <h3 class="fw-bold mb-2">
                                Welcome back, <%= user.getName()%> 👋
                            </h3>

                            <p class="text-muted mb-2" style="font-size:16px;">
                                <%= user.getEmail()%>
                            </p>

                            <span class="badge bg-primary px-3 py-2">
                                <%= user.getSkills()%>
                            </span>

                            <hr class="my-3">

                            <p style="font-size:18px;color:#6c757d;">
                                Ready to apply for your dream job?
                            </p>

                            <div class="row mt-4">
                                <div class="col-md-4">
                                    <div class="card stat-card bg-primary text-white">
                                        <div class="card-body">
                                            <h2>100+</h2>
                                            <h6>Jobs Available</h6>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card stat-card bg-success text-white">
                                        <div class="card-body">
                                            <h2>50+</h2>
                                            <h6>Companies</h6>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card stat-card bg-warning">
                                        <div class="card-body">
                                            <h2>24</h2>
                                            <h6>Applications</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mt-4">
                                <a href="JobListServlet" class="btn btn-primary me-2">Browse Jobs</a>
                                <a href="MyApplicationsServlet" class="btn btn-success me-2">My Applications</a>
                                <a href="LogoutServlet" class="btn btn-danger">Logout</a>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>
