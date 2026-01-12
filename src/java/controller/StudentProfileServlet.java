package controller;

import dao.StudentDAO;
import model.Student;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/StudentProfileServlet")
public class StudentProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        StudentDAO dao = new StudentDAO();
        Student student = dao.getStudentById(user.getUserId());

        request.setAttribute("student", student);
        request.getRequestDispatcher("student_profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String programme = request.getParameter("programme");
        String faculty = request.getParameter("faculty");

        Student student = new Student();
        student.setStudentId(user.getUserId());
        student.setProgramme(programme);
        student.setFaculty(faculty);

        StudentDAO dao = new StudentDAO();
        dao.saveStudent(student);

        response.sendRedirect("StudentProfileServlet");
    }
}
