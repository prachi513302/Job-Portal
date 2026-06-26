package servlet;

import dao.JobDAO;
import model.Job;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/JobListServlet")
public class JobListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        JobDAO dao = new JobDAO();
        List<Job> jobs = dao.getAllJobs();
        request.setAttribute("jobs", jobs);
        request.getRequestDispatcher("joblist.jsp").forward(request, response);
    }
}