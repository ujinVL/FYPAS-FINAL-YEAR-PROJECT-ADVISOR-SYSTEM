<%@ page import="java.util.ArrayList, model.Lecturer" %>
<%
    if (session == null || session.getAttribute("role") == null 
        || !"student".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    ArrayList<Lecturer> lecturers =
        (ArrayList<Lecturer>) request.getAttribute("lecturers");
%>

<h2>Student Dashboard</h2>

<a href="StudentProfileServlet">My Profile</a> |
<a href="LogoutServlet">Logout</a>

<h3>Available Lecturers</h3>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Specialization</th>
        <th>Research Area</th>
        <th>Capacity</th>
        <th>Action</th>
    </tr>

<% if (lecturers != null) {
   for (Lecturer l : lecturers) { %>
    <tr>
        <td><%= l.getLecturerId() %></td>
        <td><%= l.getSpecialization() %></td>
        <td><%= l.getResearchArea() %></td>
        <td><%= l.getMaxCapacity() %></td>
        <td>
            <a href="LecturerDetailsServlet?id=<%= l.getLecturerId() %>">
                View
            </a>
        </td>
    </tr>
<% }} %>

</table>
