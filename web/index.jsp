<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | Welcome</title>

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

        .nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
        }

        .nav a:hover {
            text-decoration: underline;
        }

        /* MAIN CONTENT */
        .content {
            display: flex;
            padding: 50px;
            background-color: white;
        }

        .text-section {
            width: 50%;
            padding-right: 40px;
        }

        .text-section h2 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .text-section h3 {
            color: #555;
            font-weight: normal;
        }

        .text-section p {
            margin-top: 20px;
            font-size: 16px;
            line-height: 1.6;
        }

        .infographic {
            margin-top: 30px;
            border: 2px dashed #999;
            padding: 30px;
            text-align: center;
            color: #666;
        }

        .image-section {
            width: 50%;
            text-align: center;
        }

        .image-section img {
            width: 80%;
            max-width: 350px;
        }

        /* FOOTER */
        .footer {
            background-color: #7b6ba8;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 30px;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <h1>FYPAS</h1>
    <div class="nav">
        <a href="login.jsp">LOG IN</a>
        <a href="signup.jsp">SIGN UP</a>
    </div>
</div>

<!-- MAIN CONTENT -->
<div class="content">

    <div class="text-section">
        <h2>WELCOME TO FYPAS</h2>
        <h3>FINAL YEAR PROJECT ADVISOR SYSTEM</h3>

        <p>
            Find the right Final Year Project advisor for your project.
            Search, compare, and connect with lecturers based on your
            interests and their availability.
        </p>

        <div class="infographic">
            <strong>INFOGRAPHIC</strong><br><br>
            This section displays a visual overview of the advisor
            selection workflow.
        </div>
    </div>

    <div class="image-section">
        <!-- Placeholder illustration -->
        <img src="https://via.placeholder.com/300x300.png?text=Advisor+Discussion" alt="Discussion">
    </div>

</div>

<!-- FOOTER -->
<div class="footer">
    FOOTER & COPYRIGHT INFORMATION
</div>

</body>
</html>
