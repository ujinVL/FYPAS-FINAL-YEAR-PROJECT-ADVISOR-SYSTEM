package controller;

import dao.SupervisionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateSupervisionServlet")
public class UpdateSupervisionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int supervisionId =
            Integer.parseInt(request.getParameter("supervisionId"));

        String startSemester =
            request.getParameter("startSemester");

        String expectedEndSemester =
            request.getParameter("expectedEndSemester");

        SupervisionDAO dao = new SupervisionDAO();
        dao.updateSemester(supervisionId, startSemester, expectedEndSemester);

        response.sendRedirect("LecturerDashboardServlet");
    }
}
