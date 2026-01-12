package controller;

import dao.LecturerDAO;
import model.Lecturer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/LecturerListServlet")
public class LecturerListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        LecturerDAO dao = new LecturerDAO();
        ArrayList<Lecturer> lecturers = dao.getAllLecturers();

        request.setAttribute("lecturers", lecturers);
        request.getRequestDispatcher("student_dashboard.jsp").forward(request, response);
    }
}
