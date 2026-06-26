package servlet;

import dao.ApplicationDAO;
import model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/MyApplicationsServlet")
public class MyApplicationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        ApplicationDAO dao = new ApplicationDAO();
        List<ApplicationDAO.AppRow> apps = dao.getApplicationsForUser(user.getId());
        request.setAttribute("apps", apps);
        request.getRequestDispatcher("my-applications.jsp").forward(request, response);
    }
}