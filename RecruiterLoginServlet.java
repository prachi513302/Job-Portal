package servlet;

import dao.RecruiterDAO;
import model.Recruiter;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RecruiterLoginServlet")
public class RecruiterLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        RecruiterDAO dao = new RecruiterDAO();
        Recruiter r = dao.login(email, password);
        if (r != null) {
            HttpSession session = request.getSession();
            session.setAttribute("recruiter", r);
            response.sendRedirect("recruiter-dashboard.jsp");
        } else {
            response.getWriter().println("Invalid credentials. <a href='recruiter-login.jsp'>Try Again</a>");
        }
    }
}