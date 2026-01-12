<%@ page import="java.util.ArrayList, model.AdvisorRequest" %>
<%
    if (session == null || session.getAttribute("role") == null 
        || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    int totalUsers = (Integer) request.getAttribute("totalUsers");
    ArrayList<AdvisorRequest> requests =
        (ArrayList<AdvisorRequest>) request.getAttribute("requests");
%>

<h2>Admin Dashboard</h2>

<a href="LogoutServlet">Logout</a>

<p><strong>Total Users:</strong> <%= totalUsers %></p>

<h3>All Advisor Requests</h3>

<table border="1">
    <tr>
        <th>Student</th>
        <th>Lecturer</th>
        <th>Project Title</th>
        <th>Status</th>
    </tr>

<% if (requests != null) {
   for (AdvisorRequest ar : requests) { %>
    <tr>
        <td><%= ar.getStudentId() %></td>
        <td><%= ar.getLecturerId() %></td>
        <td><%= ar.getProjectTitle() %></td>
        <td><%= ar.getStatus() %></td>
    </tr>
<% }} %>

</table>
