package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String selectedRole = request.getParameter("role"); // student / lecturer (staff)

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(userId, password);

        // ❌ Invalid ID or password
        if (user == null) {
            request.setAttribute("error", "Invalid User ID or Password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String actualRole = user.getRole(); // student / lecturer / admin

        // ❌ ROLE VALIDATION
        if ("student".equals(selectedRole) && !"student".equals(actualRole)) {
            request.setAttribute(
                "error",
                "This account is not a student account"
            );
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if ("lecturer".equals(selectedRole)
                && !(actualRole.equals("lecturer") || actualRole.equals("admin"))) {
            request.setAttribute(
                "error",
                "This account is not a staff account"
            );
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // ✅ LOGIN SUCCESS
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("role", actualRole);

        // ✅ REDIRECT BY REAL ROLE
        switch (actualRole) {
            case "student":
                response.sendRedirect("LecturerListServlet");
                break;
            case "lecturer":
                response.sendRedirect("LecturerDashboardServlet");
                break;
            case "admin":
                response.sendRedirect("AdminDashboardServlet");
                break;
            default:
                response.sendRedirect("login.jsp");
        }
    }
}
