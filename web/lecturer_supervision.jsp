<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Supervision" %>
<%@ page import="model.User" %>

<%
    // Session & role check
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    User lecturer = (User) session.getAttribute("user");
    if (!"lecturer".equals(lecturer.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    Supervision s = (Supervision) request.getAttribute("supervision");
%>

<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | Supervision Details</title>

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
            width: 90%;
            margin: 30px auto;
            background-color: white;
            border: 2px solid #000;
            padding: 30px;
        }

        h2 {
            margin-top: 0;
        }

        .row {
            display: flex;
            gap: 40px;
        }

        .box {
            flex: 1;
            background-color: #eef2f7;
            padding: 20px;
        }

        .info-row {
            margin-bottom: 12px;
        }

        .info-row b {
            display: inline-block;
            width: 180px;
        }

        input {
            padding: 6px;
            width: 220px;
        }

        textarea {
            width: 100%;
            height: 160px;
            padding: 10px;
        }

        .actions {
            margin-top: 30px;
            text-align: right;
        }

        .btn {
            padding: 10px 18px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
        }

        .btn-green {
            background-color: green;
            color: white;
        }

        .btn-red {
            background-color: red;
            color: white;
        }

        .footer {
            background-color: #7b6ba8;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <h1>FYPAS</h1>
    <div class="nav">
        <span>Lecturer: <%= lecturer.getFullName() %></span>
        <a href="LecturerDashboardServlet">Home</a>
        <a href="LogoutServlet">Log Out</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">

    <h2>Student Supervision Details</h2>

    <% if (s != null) { %>

    <form action="UpdateSupervisionServlet" method="post">

        <input type="hidden" name="supervisionId"
               value="<%= s.getSupervisionId() %>">

        <div class="row">

            <!-- LEFT: INFO -->
            <div class="box">

                <div class="info-row">
                    <b>Student ID:</b> <%= s.getStudentId() %>
                </div>

                <div class="info-row">
                    <b>Project Title:</b> <%= s.getProjectTitle() %>
                </div>

                <div class="info-row">
                    <b>Status:</b> <%= s.getStatus() %>
                </div>

                <br>

                <div class="info-row">
                    <b>Start Semester:</b>
                    <input type="text" name="startSemester"
                           value="<%= s.getStartSemester() == null ? "" : s.getStartSemester() %>">
                </div>

                <div class="info-row">
                    <b>Expected End Semester:</b>
                    <input type="text" name="expectedEndSemester"
                           value="<%= s.getExpectedEndSemester() == null ? "" : s.getExpectedEndSemester() %>">
                </div>

            </div>

            <!-- RIGHT: NOTES (OPTIONAL, NOT STORED YET) -->
            <div class="box">
                <b>Supervision Notes (Optional):</b><br><br>
                <textarea placeholder="Notes feature can be implemented in future enhancement"
                          disabled></textarea>
            </div>

        </div>

        <div class="actions">
            <button type="submit" class="btn btn-green">SAVE / UPDATE</button>
            <a href="LecturerDashboardServlet">
                <button type="button" class="btn btn-red">CANCEL</button>
            </a>
        </div>

    </form>

    <% } else { %>

        <p>No supervision record found.</p>

    <% } %>

</div>

<div class="footer">
    FOOTER & COPYRIGHT INFORMATION
</div>

</body>
</html>
