package controller;

import dao.AdvisorRequestDAO;
import model.AdvisorRequest;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/LecturerDashboardServlet")
public class LecturerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User lecturer = (User) session.getAttribute("user");

        AdvisorRequestDAO dao = new AdvisorRequestDAO();
        ArrayList<AdvisorRequest> requests =
                dao.getRequestsByLecturer(lecturer.getUserId());

        request.setAttribute("requests", requests);
        request.getRequestDispatcher("lecturer_dashboard.jsp").forward(request, response);
    }
}
