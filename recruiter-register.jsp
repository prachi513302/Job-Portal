<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Recruiter Register</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="auth-box">
            <h3 class="mb-4 text-center">Recruiter Registration</h3>
            <form action="RecruiterRegisterServlet" method="post">
                <div class="mb-3"><label class="form-label">Company Name</label>
                    <input type="text" class="form-control" name="companyName" required></div>
                <div class="mb-3"><label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" required></div>
                <div class="mb-3"><label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" required></div>
                <div class="mb-3"><label class="form-label">Company Description</label>
                    <textarea class="form-control" name="description" rows="3"></textarea></div>
                <button type="submit" class="btn btn-primary w-100">Register</button>
            </form>
            <p class="text-center mt-3">Already have an account? <a href="recruiter-login.jsp">Login</a></p>
        </div>
    </body>
</html>
