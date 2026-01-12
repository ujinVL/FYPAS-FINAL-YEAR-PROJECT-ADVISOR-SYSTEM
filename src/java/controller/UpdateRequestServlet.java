package controller;

import dao.AdvisorRequestDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateRequestServlet")
public class UpdateRequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int requestId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        AdvisorRequestDAO dao = new AdvisorRequestDAO();
        dao.updateRequestStatus(requestId, status);

        response.sendRedirect("LecturerDashboardServlet");
    }
}
