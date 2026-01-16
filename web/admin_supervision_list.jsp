<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Supervision" %>

<%
    List<Supervision> list =
        (List<Supervision>) request.getAttribute("supervisions");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin – Supervision List</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
        }

        table {
            width: 95%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #ddd;
        }

        .ACTIVE {
            color: green;
            font-weight: bold;
        }

        .COMPLETED {
            color: blue;
            font-weight: bold;
        }
    </style>
</head>

<body>

<h2>Supervision List</h2>

<table>
    <tr>
        <th>No</th>
        <th>Student ID</th>
        <th>Lecturer Name</th>
        <th>Project Title</th>
        <th>Start Semester</th>
        <th>Expected End</th>
        <th>Status</th>
    </tr>

<%
    int i = 1;
    if (list != null && !list.isEmpty()) {
        for (Supervision s : list) {
%>
    <tr>
        <td><%= i++ %></td>
        <td><%= s.getStudentId() %></td>
        <td><%= s.getLecturerName() %></td>
        <td><%= s.getProjectTitle() %></td>
        <td><%= s.getStartSemester() == null ? "-" : s.getStartSemester() %></td>
        <td><%= s.getExpectedEndSemester() == null ? "-" : s.getExpectedEndSemester() %></td>
        <td class="<%= s.getStatus() %>">
            <%= s.getStatus() %>
        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="7">No supervision records found</td>
    </tr>
<%
    }
%>

</table>

<div style="text-align:center;">
    <a href="AdminDashboardServlet">Back to Dashboard</a>
</div>

</body>
</html>
