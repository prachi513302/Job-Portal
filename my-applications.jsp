<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dao.ApplicationDAO.AppRow"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Applications</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container mt-4">
            <h3 class="mb-4">My Applications</h3>
            <% List<AppRow> apps = (List<AppRow>) request.getAttribute("apps");
                if (apps == null || apps.isEmpty()) { %>
            <p class="text-muted">You haven't applied to any jobs yet.</p>
            <% } else { %>
            <table class="table table-bordered bg-white">
                <thead><tr><th>Job Title</th><th>Company</th><th>Status</th><th>Applied On</th></tr></thead>
                <tbody>
                    <% for (AppRow a : apps) {%>
                    <tr>
                        <td><%= a.title%></td>
                        <td><%= a.company%></td>
                        <td><span class="status-badge <%= a.status%>"><%= a.status%></span></td>
                        <td><%= a.applyDate%></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% }%>
        </div>
    </body>
</html>
