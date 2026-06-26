<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Recruiter, model.Job, dao.JobDAO, dao.ApplicationDAO, dao.ApplicationDAO.AppRow, java.util.List"%>
<%
    Recruiter r = (Recruiter) session.getAttribute("recruiter");
    if (r == null) {
        response.sendRedirect("recruiter-login.jsp");
        return;
    }
    JobDAO jobDao = new JobDAO();
    ApplicationDAO appDao = new ApplicationDAO();
    List<Job> jobs = jobDao.getJobsByRecruiter(r.getId());
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Recruiter Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container mt-4">
            <h3>Welcome, <%= r.getCompanyName()%></h3>
            <a href="post-job.jsp" class="btn btn-primary mb-4">+ Post New Job</a>
            <% if (jobs.isEmpty()) { %>
            <p class="text-muted">You haven't posted any jobs yet.</p>
            <% } else {
                for (Job j : jobs) {
                    List<AppRow> applicants = appDao.getApplicantsForJob(j.getJobId());
            %>
            <div class="card p-3 mb-4">
                <h5><%= j.getTitle()%> <span class="badge bg-secondary"><%= j.getLocation()%></span></h5>
                <p class="text-muted"><%= j.getDescription()%></p>
                <h6>Applicants (<%= applicants.size()%>)</h6>
                <% if (applicants.isEmpty()) { %>
                <p class="text-muted small">No applicants yet.</p>
                <% } else { %>
                <table class="table table-sm table-bordered">
                    <thead><tr><th>Name</th><th>Email</th><th>Status</th><th>Update</th></tr></thead>
                    <tbody>
                        <% for (AppRow a : applicants) {%>
                        <tr>
                            <td><%= a.title%></td>
                            <td><%= a.company%></td>
                            <td><span class="status-badge <%= a.status%>"><%= a.status%></span></td>
                            <td>
                                <form action="UpdateStatusServlet" method="post" class="d-flex gap-2">
                                    <input type="hidden" name="applicationId" value="<%= a.applicationId%>">
                                    <select name="status" class="form-select form-select-sm">
                                        <option value="Applied">Applied</option>
                                        <option value="Shortlisted">Shortlisted</option>
                                        <option value="Rejected">Rejected</option>
                                        <option value="Hired">Hired</option>
                                    </select>
                                    <button type="submit" class="btn btn-sm btn-outline-primary">Save</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <% } %>
            </div>
            <% }
                }%>
        </div>
    </body>
</html>
