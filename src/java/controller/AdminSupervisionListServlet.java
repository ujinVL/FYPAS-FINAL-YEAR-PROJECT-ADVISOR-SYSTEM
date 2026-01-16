package controller;

import dao.SupervisionDAO;
import model.Supervision;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminSupervisionListServlet")
public class AdminSupervisionListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        SupervisionDAO dao = new SupervisionDAO();
        List<Supervision> list = dao.getAllSupervisions();

        request.setAttribute("supervisions", list);
        request.getRequestDispatcher("admin_supervision_list.jsp")
               .forward(request, response);
    }
}
