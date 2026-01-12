package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import dao.UserDAO;
import model.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(userId, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());

            if (user.getRole().equals("student")) {
                response.sendRedirect("student_dashboard.jsp");
            } else if (user.getRole().equals("lecturer")) {
                response.sendRedirect("lecturer_dashboard.jsp");
            } else {
                response.sendRedirect("admin_dashboard.jsp");
            }

        } else {
            request.setAttribute("error", "Invalid User ID or Password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
