<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Supervision" %>

<%
    Supervision s = (Supervision) request.getAttribute("supervision");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Supervisor - FYPAS</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            width: 70%;
            margin: 60px auto;
            background-color: white;
            border: 2px solid #000;
            padding: 30px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .row {
            margin-bottom: 15px;
            font-size: 16px;
        }

        .label {
            display: inline-block;
            width: 220px;
            font-weight: bold;
        }

        .ACTIVE {
            color: green;
            font-weight: bold;
        }

        .NO {
            color: red;
            font-weight: bold;
        }

        .back {
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>My Supervisor</h2>

    <% if (s != null) { %>

        <div class="row">
            <span class="label">Supervisor Name:</span>
            <%= s.getLecturerName() %>
        </div>

        <div class="row">
            <span class="label">Project Title:</span>
            <%= s.getProjectTitle() %>
        </div>

        <div class="row">
            <span class="label">Start Semester:</span>
            <%= s.getStartSemester() == null ? "-" : s.getStartSemester() %>
        </div>

        <div class="row">
            <span class="label">Expected End Semester:</span>
            <%= s.getExpectedEndSemester() == null ? "-" : s.getExpectedEndSemester() %>
        </div>

        <div class="row">
            <span class="label">Status:</span>
            <span class="<%= s.getStatus() %>">
                <%= s.getStatus() %>
            </span>
        </div>

    <% } else { %>

        <p class="NO">
            You are currently not assigned to any supervisor.
        </p>

    <% } %>

    <div class="back">
        <a href="LecturerListServlet">Back to Dashboard</a>
    </div>

</div>

</body>
</html>
