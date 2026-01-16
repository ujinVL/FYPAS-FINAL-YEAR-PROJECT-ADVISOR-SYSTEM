package controller;

import dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminManageUsersServlet")
public class AdminManageUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO userDAO = new UserDAO();
        request.setAttribute("users", userDAO.getAllUsers());

        request.getRequestDispatcher("admin_manage_users.jsp")
               .forward(request, response);
    }
}
