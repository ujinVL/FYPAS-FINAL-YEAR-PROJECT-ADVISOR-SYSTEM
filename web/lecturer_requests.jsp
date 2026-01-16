<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.AdvisorRequest" %>

<%
    // Session check
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String role = (String) session.getAttribute("role");
    if (!"lecturer".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<AdvisorRequest> requests =
        (List<AdvisorRequest>) request.getAttribute("requests");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Lecturer Requests - FYPAS</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #ddd;
        }

        .PENDING {
            color: orange;
            font-weight: bold;
        }

        .APPROVED {
            color: green;
            font-weight: bold;
        }

        .REJECTED {
            color: red;
            font-weight: bold;
        }

        .btn-approve {
            background: green;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
        }

        .btn-reject {
            background: red;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
        }

        .btn-disabled {
            background: #aaa;
            color: white;
            padding: 6px 12px;
            border: none;
        }
    </style>
</head>

<body>

<h2>Student Advisor Requests</h2>

<table>
    <tr>
        <th>No</th>
        <th>Student ID</th>
        <th>Project Title</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    int i = 1;
    if (requests != null && !requests.isEmpty()) {
        for (AdvisorRequest r : requests) {
%>
    <tr>
        <td><%= i++ %></td>
        <td><%= r.getStudentId() %></td>
        <td><%= r.getProjectTitle() %></td>
        <td class="<%= r.getStatus() %>"><%= r.getStatus() %></td>
        <td>

            <% if ("PENDING".equals(r.getStatus())) { %>

                <form action="UpdateRequestServlet" method="post" style="display:inline;">
                    <input type="hidden" name="requestId"
                           value="<%= r.getRequestId() %>">
                    <button type="submit" name="action" value="approve"
                            class="btn-approve">
                        Approve
                    </button>
                </form>

                <form action="UpdateRequestServlet" method="post" style="display:inline;">
                    <input type="hidden" name="requestId"
                           value="<%= r.getRequestId() %>">
                    <button type="submit" name="action" value="reject"
                            class="btn-reject">
                        Reject
                    </button>
                </form>

            <% } else { %>

                <button class="btn-disabled" disabled>
                    Completed
                </button>

            <% } %>

        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="5">No advisor requests found</td>
    </tr>
<%
    }
%>

</table>

<br><br>
<div style="text-align:center;">
    <a href="LecturerDashboardServlet">Back to Dashboard</a>
</div>

</body>
</html>
