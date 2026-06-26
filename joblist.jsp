<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Job"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Available Jobs</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            .job-card{
                border:1px solid #ddd;
                border-radius:10px;
                padding:15px;
                box-shadow:0 2px 5px rgba(0,0,0,0.1);
            }

            .job-card:hover{
                transform:translateY(-3px);
                transition:0.3s;
            }
        </style>
    </head>

    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="container mt-4">

            <h2 class="mb-4">Available Jobs</h2>

            <div class="row">

                <%
                    List<Job> jobs = (List<Job>) request.getAttribute("jobs");

                    if (jobs == null || jobs.isEmpty()) {
                %>

                <div class="alert alert-warning">
                    No Jobs Available
                </div>

                <%
                } else {

                    for (Job j : jobs) {
                %>

                <div class="col-md-6 mb-4">

                    <div class="job-card h-100">

                        <h4><%= j.getTitle()%></h4>

                        <span class="badge bg-primary mb-2">
                            <%= j.getCompany()%>
                        </span>

                        <p>
                            📍 <%= j.getLocation()%>
                        </p>

                        <p>
                            💰 <%= j.getSalary()%>
                        </p>

                        <p class="text-muted">
                            <%= j.getDescription()%>
                        </p>

                        <a href="apply.jsp?jobId=<%= j.getJobId()%>"
                           class="btn btn-primary w-100">
                            Apply Now
                        </a>

                    </div>

                </div>

                <%
                        }
                    }
                %>

            </div>

        </div>

    </body>
</html>