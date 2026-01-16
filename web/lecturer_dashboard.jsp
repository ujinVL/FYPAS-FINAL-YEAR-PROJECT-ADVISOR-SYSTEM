<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session == null || session.getAttribute("role") == null
        || !"lecturer".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    String lecturerId = (String) session.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | Lecturer Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        /* HEADER */
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

        /* MAIN */
        .container {
            padding: 30px;
        }

        .dashboard {
            display: flex;
            gap: 20px;
        }

        .card {
            background-color: white;
            flex: 1;
            border: 2px solid #000;
            padding: 20px;
        }

        .card h3 {
            background-color: #dfe7df;
            padding: 10px;
            text-align: center;
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        td {
            padding: 6px;
            border-bottom: 1px solid #ccc;
        }

        .action {
            text-align: center;
            margin-top: 10px;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-green {
            background-color: green;
            color: white;
        }

        .btn-red {
            background-color: red;
            color: white;
        }

        .btn-blue {
            background-color: #3b82f6;
            color: white;
        }

        /* FOOTER */
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
        <span>Lecturer ID: <%= lecturerId %></span>
        <a href="LecturerDashboardServlet">Home</a>
        <a href="LogoutServlet">Log Out</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">

    <div class="dashboard">

        <!-- INCOMING REQUESTS -->
        <div class="card">
            <h3>Incoming Requests</h3>
            <table>
                <tr><td><b>Student Name</b></td><td>Full name</td></tr>
                <tr><td><b>Programme</b></td><td>Student programme</td></tr>
                <tr><td><b>Request Semester</b></td><td>Oct–Feb / Mar–July</td></tr>
                <tr><td><b>Project Title</b></td><td>Proposed title</td></tr>
                <tr><td><b>Proposal</b></td><td><a href="#">Download PDF</a></td></tr>
            </table>
            <div class="action">
                <button class="btn btn-green">Approve</button>
                <button class="btn btn-red">Reject</button>
            </div>
        </div>

        <!-- STUDENTS UNDER ME -->
        <div class="card">
            <h3>Students Under Me (FYP Part 1)</h3>
            <table>
                <tr><td><b>Student Name</b></td><td>Full name</td></tr>
                <tr><td><b>Project Title</b></td><td>Confirmed title</td></tr>
                <tr><td><b>Accepted Semester</b></td><td>Approved semester</td></tr>
                <tr><td><b>Status</b></td><td>Active</td></tr>
            </table>
            <div class="action">
                <button class="btn btn-blue">View Supervision Details</button>
            </div>
        </div>

        <!-- FINISHING STUDENTS -->
        <div class="card">
            <h3>Finishing Students (FYP Part 2)</h3>
            <table>
                <tr><td><b>Student Name</b></td><td>Full name</td></tr>
                <tr><td><b>Project Title</b></td><td>Title</td></tr>
                <tr><td><b>Status</b></td><td>Pending Decision</td></tr>
            </table>
            <div class="action">
                <button class="btn btn-green">Pass</button>
                <button class="btn btn-red">Fail</button>
            </div>
        </div>

    </div>

</div>

<!-- FOOTER -->
<div class="footer">
    FOOTER & COPYRIGHT INFORMATION
</div>

</body>
</html>
