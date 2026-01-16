package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();
        user.setUserId(request.getParameter("userId"));
        user.setFullName(request.getParameter("fullName"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setRole(request.getParameter("role"));

        // SAFE DEFAULTS (important)
        user.setFaculty(
            request.getParameter("faculty") == null ? "NA" : request.getParameter("faculty")
        );
        user.setStatus("active");

        UserDAO dao = new UserDAO();
        boolean success = dao.registerUser(user);

        if (success) {
            request.setAttribute("success", "Registration successful. Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Registration failed. User ID may exist.");
            request.getRequestDispatcher("sign_up.jsp").forward(request, response);
        }
    }
}
