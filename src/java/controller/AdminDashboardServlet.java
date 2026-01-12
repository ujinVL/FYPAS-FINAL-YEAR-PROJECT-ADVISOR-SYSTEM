package controller;

import dao.UserDAO;
import dao.AdvisorRequestDAO;
import model.AdvisorRequest;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO userDAO = new UserDAO();
        AdvisorRequestDAO reqDAO = new AdvisorRequestDAO();

        int totalUsers = userDAO.countUsers();
        ArrayList<AdvisorRequest> requests = reqDAO.getAllRequests();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("requests", requests);

        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
    }
}
