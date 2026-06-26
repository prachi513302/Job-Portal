package servlet;

import dao.RecruiterDAO;
import model.Recruiter;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RecruiterRegisterServlet")
public class RecruiterRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Recruiter r = new Recruiter();
        r.setCompanyName(request.getParameter("companyName"));
        r.setEmail(request.getParameter("email"));
        r.setPassword(request.getParameter("password"));
        r.setDescription(request.getParameter("description"));

        RecruiterDAO dao = new RecruiterDAO();
        if (dao.register(r)) {
            response.sendRedirect("recruiter-login.jsp");
        } else {
            response.getWriter().println("Registration failed: email may already be used. <a href='recruiter-register.jsp'>Back</a>");
        }
    }
}