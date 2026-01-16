<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Users - Admin</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid black; padding: 8px; }
        th { background: #ddd; }
    </style>
</head>
<body>

<h2>Manage Users</h2>

<table>
    <tr>
        <th>Name</th>
        <th>User ID</th>
        <th>Email</th>
        <th>Role</th>
        <th>Faculty</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <c:forEach var="u" items="${users}">
        <tr>
            <td>${u.fullName}</td>
            <td>${u.userId}</td>
            <td>${u.email}</td>
            <td>${u.role}</td>
            <td>${u.faculty}</td>
            <td>${u.status}</td>
            <td>
                <a href="DeleteUserServlet?id=${u.userId}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<br>
<a href="AdminDashboardServlet">Back</a>

</body>
</html>
