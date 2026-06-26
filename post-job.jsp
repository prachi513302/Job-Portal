<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Recruiter"%>
<%
    Recruiter r = (Recruiter) session.getAttribute("recruiter");
    if (r == null) {
        response.sendRedirect("recruiter-login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Post a Job</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="auth-box" style="max-width:600px;">
            <h3 class="mb-4 text-center">Post a New Job</h3>
            <form action="PostJobServlet" method="post">
                <div class="mb-3"><label class="form-label">Job Title</label>
                    <input type="text" class="form-control" name="title" required></div>
                <div class="mb-3"><label class="form-label">Company</label>
                    <input type="text" class="form-control" name="company" value="<%= r.getCompanyName()%>" required></div>
                <div class="mb-3"><label class="form-label">Location</label>
                    <input type="text" class="form-control" name="location" required></div>
                <div class="mb-3"><label class="form-label">Salary</label>
                    <input type="text" class="form-control" name="salary" placeholder="e.g. 6-10 LPA"></div>
                <div class="mb-3"><label class="form-label">Description</label>
                    <textarea class="form-control" name="description" rows="4" required></textarea></div>
                <button type="submit" class="btn btn-primary w-100">Post Job</button>
            </form>
        </div>
    </body>
</html>
