package controller;

import dao.SupervisionDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDAO userDAO = new UserDAO();
        SupervisionDAO supervisionDAO = new SupervisionDAO();

        // Dashboard statistics
        int totalStudents = userDAO.countByRole("student");
        int totalLecturers = userDAO.countByRole("lecturer");
        int activeSupervisions = supervisionDAO.countActiveSupervisions();

        // Set attributes
        request.setAttribute("totalStudents", totalStudents);
        request.setAttribute("totalLecturers", totalLecturers);
        request.setAttribute("activeSupervisions", activeSupervisions);

        // Optional (if you want later)
        request.setAttribute("pendingRequests", 0);

        request.getRequestDispatcher("admin_dashboard.jsp")
               .forward(request, response);
    }
}
