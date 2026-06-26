package servlet;

import dao.ApplicationDAO;
import model.Recruiter;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Recruiter r = (Recruiter) request.getSession().getAttribute("recruiter");
        if (r == null) {
            response.sendRedirect("recruiter-login.jsp");
            return;
        }
        int applicationId = Integer.parseInt(request.getParameter("applicationId"));
        String status = request.getParameter("status");
        new ApplicationDAO().updateStatus(applicationId, status);
        response.sendRedirect("recruiter-dashboard.jsp");
    }
}