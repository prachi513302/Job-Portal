package servlet;

import dao.JobDAO;
import model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {

            String jobIdStr = request.getParameter("jobId");

            System.out.println("Job ID = " + jobIdStr);

            int jobId = Integer.parseInt(jobIdStr);

            JobDAO dao = new JobDAO();

            boolean applied =
                    dao.applyToJob(user.getId(), jobId);

            if (applied) {

                response.sendRedirect("success.jsp");

            } else {

                response.getWriter().println(
                        "<h2>Already Applied!</h2>"
                        + "<br>"
                        + "<a href='JobListServlet'>Back</a>");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h2>Error : "
                    + e.getMessage()
                    + "</h2>");
        }
    }
}