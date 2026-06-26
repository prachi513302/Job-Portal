<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <h1>Start Your Career Journey</h1>
        <p>Create an account and apply to top companies today.</p>
        <div class="auth-box">
            <h3 class="mb-4 text-center">Create Account</h3>
            <form action="RegisterServlet" method="post">
                <div class="mb-3"><label class="form-label">Name</label>
                    <input type="text" class="form-control" name="name" required></div>
                <div class="mb-3"><label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" required></div>
                <div class="mb-3"><label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" required></div>
                <div class="mb-3"><label class="form-label">Phone</label>
                    <input type="text" class="form-control" name="phone"></div>
                <div class="mb-3"><label class="form-label">Skills</label>
                    <input type="text" class="form-control" name="skills" placeholder="e.g. Java, SQL, React"></div>
                <button type="submit" class="btn btn-primary w-100">Register</button>
            </form>
            <p class="text-center mt-3">Already registered? <a href="login.jsp">Login</a></p>
        </div>
    </body>
</html>
