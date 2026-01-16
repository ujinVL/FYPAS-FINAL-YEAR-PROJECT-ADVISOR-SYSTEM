package controller;

import dao.AdvisorRequestDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AdvisorRequestServlet")
public class AdvisorRequestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2️⃣ Get logged-in student
        User student = (User) session.getAttribute("user");
        String studentId = student.getUserId();

        // 3️⃣ Get form parameters
        String lecturerId = request.getParameter("lecturerId");
        String projectTitle = request.getParameter("projectTitle");

        AdvisorRequestDAO dao = new AdvisorRequestDAO();

        // 🔒 Prevent duplicate requests
        if (dao.hasActiveRequest(studentId)) {

            request.setAttribute(
                "error",
                "You already have an active advisor request. Please wait for a response."
            );

            request.getRequestDispatcher("student_dashboard.jsp")
                   .forward(request, response);
            return;
        }

        // 4️⃣ Create request
        dao.createRequest(studentId, lecturerId, projectTitle);

        // 5️⃣ Redirect to My Requests
        response.sendRedirect("StudentMyRequestsServlet");
    }
}
