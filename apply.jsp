<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String jobId = request.getParameter("jobId");
%>
<h3>Job ID = <%= jobId%></h3>
<!DOCTYPE html>
<html>
    <head>
        <title>Apply for Job</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="container mt-5">
            <div class="card shadow p-4">
                <h2 class="text-center mb-4">Job Application Form</h2>

                <form action="ApplyServlet" method="post">
                    <input type="hidden" name="jobId" value="<%= jobId%>">
                    <div class="mb-3">
                        <label>Full Name</label>
                        <input type="text" name="fullname" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Mobile Number</label>
                        <input type="text" name="mobile" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Degree</label>
                        <select name="degree" class="form-control">
                            <option>BCA</option>
                            <option>MCA</option>
                            <option>B.Tech</option>
                            <option>M.Tech</option>
                            <option>B.Sc IT</option>
                            <option>M.Sc IT</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>College Name</label>
                        <input type="text" name="college" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>CGPA</label>
                        <select name="cgpa" class="form-control">
                            <option>6.0</option>
                            <option>6.5</option>
                            <option>7.0</option>
                            <option>7.5</option>
                            <option>8.0</option>
                            <option>8.5</option>
                            <option>9.0</option>
                            <option>9.5</option>
                            <option>10.0</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Role Applied For</label>
                        <select name="role" class="form-control">
                            <option>Java Developer</option>
                            <option>Python Developer</option>
                            <option>Data Analyst</option>
                            <option>Frontend Developer</option>
                            <option>Full Stack Developer</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Skills</label>
                        <input type="text" name="skills" class="form-control"
                               placeholder="Java, SQL, HTML, CSS">
                    </div>

                    <div class="mb-3">
                        <label>Upload Resume (PDF)</label>
                        <input type="file" name="resume" class="form-control"
                               accept=".pdf,.doc,.docx" required>
                    </div>

                    <div class="mb-3">
                        <label>Cover Letter</label>
                        <textarea name="coverletter" class="form-control" rows="4"></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">
                        Submit Application
                    </button>

                </form>
            </div>
        </div>

    </body>
</html>