<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Lecturer" %>
<%@ page import="model.User" %>

<%
    // Session & role check (CONSISTENT VERSION)
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    User student = (User) session.getAttribute("user");
    if (!"student".equals(student.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Lecturer> lecturers =
        (List<Lecturer>) request.getAttribute("lecturers");
%>

<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | Student Home</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .header {
            background-color: #7b6ba8;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
        }

        .container {
            background-color: white;
            width: 90%;
            margin: 30px auto;
            padding: 30px;
            border: 2px solid #000;
        }

        h2 {
            margin-top: 0;
        }

        .search-box {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #eee;
        }

        .btn {
            padding: 6px 12px;
            background-color: #3b82f6;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        .btn:hover {
            background-color: #2563eb;
        }

        .footer {
            background-color: #7b6ba8;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 30px;
        }

        .error {
            color: red;
            margin-bottom: 15px;
            font-weight: bold;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <h1>FYPAS</h1>
    <div class="nav">
        <a href="LecturerListServlet">Home</a>
        <a href="StudentMyRequestsServlet">My Request</a>
        <a href="LogoutServlet">Log Out</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">

    <% if (request.getAttribute("error") != null) { %>
        <div class="error">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <input type="text" class="search-box"
           placeholder="Search Advisor by Name / Specialization"
           disabled>

    <h2>List of Advisors</h2>

    <table>
        <tr>
            <th>No.</th>
            <th>Lecturer Name</th>
            <th>Specialization</th>
            <th>View Details</th>
        </tr>

        <%
            int no = 1;
            if (lecturers != null && !lecturers.isEmpty()) {
                for (Lecturer l : lecturers) {
        %>
        <tr>
            <td><%= no++ %></td>
            <td><%= l.getLecturerName() %></td>
            <td><%= l.getSpecialization() %></td>
            <td>
                <a class="btn"
                   href="ViewLecturerServlet?lecturerId=<%= l.getLecturerId() %>">
                    View
                </a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No advisors available</td>
        </tr>
        <%
            }
        %>

    </table>

</div>

<!-- FOOTER -->
<div class="footer">
    FOOTER & COPYRIGHT INFORMATION
</div>

</body>
</html>
