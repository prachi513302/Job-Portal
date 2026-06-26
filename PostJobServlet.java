package servlet;

import dao.JobDAO;
import model.Job;
import model.Recruiter;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PostJobServlet")
public class PostJobServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Recruiter r = (Recruiter) request.getSession().getAttribute("recruiter");
        if (r == null) {
            response.sendRedirect("recruiter-login.jsp");
            return;
        }
        Job j = new Job();
        j.setTitle(request.getParameter("title"));
        j.setCompany(request.getParameter("company"));
        j.setLocation(request.getParameter("location"));
        j.setSalary(request.getParameter("salary"));
        j.setDescription(request.getParameter("description"));
        j.setRecruiterId(r.getId());

        JobDAO dao = new JobDAO();
        if (dao.postJob(j)) {
            response.sendRedirect("recruiter-dashboard.jsp");
        } else {
            response.getWriter().println("Failed to post job. <a href='post-job.jsp'>Back</a>");
        }
    }
}