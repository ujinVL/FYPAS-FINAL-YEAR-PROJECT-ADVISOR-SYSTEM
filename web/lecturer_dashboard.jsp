<%@ page import="java.util.ArrayList, model.AdvisorRequest" %>
<%
    if (session == null || session.getAttribute("role") == null 
        || !"lecturer".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    ArrayList<AdvisorRequest> requests =
        (ArrayList<AdvisorRequest>) request.getAttribute("requests");
%>

<h2>Lecturer Dashboard</h2>

<a href="LogoutServlet">Logout</a>

<h3>Advisor Requests</h3>

<table border="1">
    <tr>
        <th>Student ID</th>
        <th>Project Title</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<% if (requests != null) {
   for (AdvisorRequest ar : requests) { %>
    <tr>
        <td><%= ar.getStudentId() %></td>
        <td><%= ar.getProjectTitle() %></td>
        <td><%= ar.getStatus() %></td>
        <td>
            <a href="UpdateRequestServlet?id=<%= ar.getRequestId() %>&status=APPROVED">Approve</a>
            |
            <a href="UpdateRequestServlet?id=<%= ar.getRequestId() %>&status=REJECTED">Reject</a>
        </td>
    </tr>
<% }} %>

</table>
