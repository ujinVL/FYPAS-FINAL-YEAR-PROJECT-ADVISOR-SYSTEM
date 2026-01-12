<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | User Registration</title>
</head>
<body>

<h2>User Registration</h2>

<% if (request.getAttribute("error") != null) { %>
    <p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>

<% if (request.getAttribute("success") != null) { %>
    <p style="color:green;"><%= request.getAttribute("success") %></p>
<% } %>

<form action="RegisterServlet" method="post">
    <input type="text" name="userId" placeholder="User ID" required><br><br>
    <input type="text" name="fullName" placeholder="Full Name" required><br><br>
    <input type="email" name="email" placeholder="Email" required><br><br>
    <input type="password" name="password" placeholder="Password" required><br><br>

    <select name="role" required>
        <option value="">-- Select Role --</option>
        <option value="student">Student</option>
        <option value="lecturer">Lecturer</option>
        <option value="admin">Admin</option>
    </select><br><br>

    <button type="submit">Register</button>
</form>

<br>
<a href="login.jsp">Back to Login</a>

</body>
</html>
