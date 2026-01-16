<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | Login</title>

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

        .header h1 {
            margin: 0;
            font-size: 36px;
        }

        .header a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        /* LOGIN CONTAINER */
        .container {
            background-color: white;
            width: 400px;
            margin: 80px auto;
            padding: 30px;
            border: 2px solid #000;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* FORM */
        .role {
            text-align: center;
            margin-bottom: 20px;
        }

        .role label {
            margin: 0 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            font-size: 14px;
        }

        .btn {
            width: 100%;
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #2563eb;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }

        /* FOOTER */
        .footer {
            background-color: #7b6ba8;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 100px;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <h1>FYPAS</h1>
    <a href="index.jsp">HOME</a>
</div>

<!-- LOGIN BOX -->
<div class="container">

    <h2>FYPAS</h2>

    <!-- ERROR MESSAGE -->
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <%
        }
    %>

    <!-- LOGIN FORM -->
    <form action="LoginServlet" method="post">

        <div class="role">
            <label><input type="radio" name="role" value="student" checked> Student</label>
            <label><input type="radio" name="role" value="lecturer"> Staff</label>
        </div>

        <div class="form-group">
            <label>User ID</label>
            <input type="text" name="userId" placeholder="Enter User ID" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter Password" required>
        </div>

        <button type="submit" class="btn">LOG IN</button>
    </form>

</div>

<!-- FOOTER -->
<div class="footer">
    FOOTER & COPYRIGHT INFORMATION
</div>

</body>
</html>
