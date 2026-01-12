<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            text-align: center;
            padding-top: 100px;
        }
        .container {
            background: white;
            width: 400px;
            margin: auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #6a5acd;
            border-radius: 5px;
        }
        a:hover {
            background-color: #483d8b;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Welcome to FYPAS</h2>
    <p>Final Year Project Advisor System</p>

    <a href="login.jsp">Login</a>
    <a href="sign_up.jsp">Sign Up</a>
</div>

</body>
</html>
