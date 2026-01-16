package controller;

import dao.AdvisorRequestDAO;
import dao.SupervisionDAO;
import model.AdvisorRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateRequestServlet")
public class UpdateRequestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String action = request.getParameter("action"); // approve / reject

        AdvisorRequestDAO requestDAO = new AdvisorRequestDAO();

        if ("approve".equals(action)) {

            // 1️⃣ Get request details
            AdvisorRequest ar = requestDAO.getRequestById(requestId);

            if (ar != null) {
                // 2️⃣ Update request status
                requestDAO.updateRequestStatus(
                        String.valueOf(requestId), "APPROVED"
                );

                // 3️⃣ Create supervision
                SupervisionDAO supervisionDAO = new SupervisionDAO();
                supervisionDAO.createSupervision(
                        ar.getStudentId(),
                        ar.getLecturerId(),
                        ar.getProjectTitle()
                );
            }

        } else if ("reject".equals(action)) {

            requestDAO.updateRequestStatus(
                    String.valueOf(requestId), "REJECTED"
            );
        }

        // 4️⃣ Redirect back to lecturer dashboard
        response.sendRedirect("LecturerDashboardServlet");
    }
}
