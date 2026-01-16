package controller;

import dao.AdvisorRequestDAO;
import model.AdvisorRequest;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/StudentMyRequestsServlet")
public class StudentMyRequestsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Check login session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2️⃣ Get logged-in student
        User student = (User) session.getAttribute("user");
        String studentId = student.getUserId();

        // 3️⃣ Fetch advisor requests from DB
        AdvisorRequestDAO dao = new AdvisorRequestDAO();
        List<AdvisorRequest> requests = dao.getRequestsByStudent(studentId);

        // 4️⃣ Send data to JSP
        request.setAttribute("requests", requests);

        // 5️⃣ Forward to student_my_requests.jsp
        request.getRequestDispatcher("student_my_requests.jsp")
               .forward(request, response);
    }
}
