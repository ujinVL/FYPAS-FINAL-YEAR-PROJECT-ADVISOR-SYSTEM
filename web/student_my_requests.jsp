<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.AdvisorRequest" %>

<html>
<head>
    <title>My Advisor Requests</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 10px; text-align: center; }
        th { background: #f0f0f0; }
        .PENDING { color: orange; }
        .APPROVED { color: green; }
        .REJECTED { color: red; }
    </style>
</head>
<body>

<h2>My Advisor Requests</h2>

<table>
    <tr>
        <th>No</th>
        <th>Lecturer Name</th>
        <th>Project Title</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    List<AdvisorRequest> list =
        (List<AdvisorRequest>) request.getAttribute("requests");
    int i = 1;

    if (list != null && !list.isEmpty()) {
        for (AdvisorRequest r : list) {
%>
    <tr>
        <td><%= i++ %></td>
        <td><%= r.getLecturerName() %></td>
        <td><%= r.getProjectTitle() %></td>
        <td class="<%= r.getStatus() %>"><%= r.getStatus() %></td>
        <td>
            <% if ("PENDING".equals(r.getStatus())) { %>
                <a href="CancelRequestServlet?id=<%= r.getRequestId() %>">
                    Cancel
                </a>
            <% } else { %>
                -
            <% } %>
        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="5">No requests found</td>
    </tr>
<%
    }
%>

</table>

</body>
</html>
