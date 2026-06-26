package servlet;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String skills = request.getParameter("skills");

        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            response.getWriter().println("All required fields must be filled. <a href='register.jsp'>Back</a>");
            return;
        }

        User user = new User(name, email, password, phone, skills);
        UserDAO dao = new UserDAO();

        if (dao.registerUser(user)) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration Failed: Email may already be registered. " +
                    "<a href='register.jsp'>Try Again</a>");
        }
    }
}