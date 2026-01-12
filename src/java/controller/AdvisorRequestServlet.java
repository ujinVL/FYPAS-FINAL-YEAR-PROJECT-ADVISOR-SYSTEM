package controller;

import dao.AdvisorRequestDAO;
import model.AdvisorRequest;
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

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String lecturerId = request.getParameter("lecturerId");
        String projectTitle = request.getParameter("projectTitle");

        AdvisorRequest ar = new AdvisorRequest();
        ar.setStudentId(user.getUserId());
        ar.setLecturerId(lecturerId);
        ar.setProjectTitle(projectTitle);

        AdvisorRequestDAO dao = new AdvisorRequestDAO();
        dao.submitRequest(ar);

        response.sendRedirect("LecturerListServlet");
    }
}
