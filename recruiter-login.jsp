<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Recruiter Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="auth-box">
            <h3 class="mb-4 text-center">Recruiter Login</h3>
            <form action="RecruiterLoginServlet" method="post">
                <div class="mb-3"><label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" required></div>
                <div class="mb-3"><label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" required></div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
            <p class="text-center mt-3">New company? <a href="recruiter-register.jsp">Register</a></p>
        </div>
    </body>
</html>
