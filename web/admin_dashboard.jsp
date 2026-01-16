<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - FYPAS</title>
    <style>
        body { font-family: Arial; }
        .cards { display: flex; gap: 20px; }
        .card {
            width: 200px;
            height: 120px;
            background: #ffbf69;
            text-align: center;
            padding-top: 30px;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Admin Dashboard</h2>

<div class="cards">
    <div class="card">
        Total Students<br><br>
        ${totalStudents}
    </div>
    <div class="card">
        Total Lecturers<br><br>
        ${totalLecturers}
    </div>
    <div class="card">
        Active Supervisions<br><br>
        ${activeSupervisions}
    </div>
    <div class="card">
        Pending Requests<br><br>
        ${pendingRequests}
    </div>
</div>

<br>
<a href="AdminManageUsersServlet">Manage Users</a> |
<a href="SupervisionListServlet">Supervision List</a> |
<a href="LogoutServlet">Logout</a>

</body>
</html>
