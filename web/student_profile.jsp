<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Student" %>

<%
    if (session == null || session.getAttribute("role") == null
        || !"student".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | Student Profile</title>

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

        /* CONTENT */
        .container {
            background-color: white;
            width: 700px;
            margin: 40px auto;
            padding: 30px;
            border: 2px solid #000;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        /* PROFILE IMAGE */
        .profile-pic {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-pic img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: #ccc;
        }

        /* FORM */
        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            font-size: 14px;
        }

        .form-group input[readonly] {
            background-color: #eee;
        }

        .btn {
            width: 100%;
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: #2563eb;
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
        <a href="LecturerListServlet">Home</a>
        <a href="MyRequestsServlet">My Request</a>
        <a href="LogoutServlet">Log Out</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">

    <h2>Student Profile</h2>

    <!-- PROFILE IMAGE -->
    <div class="profile-pic">
        <img src="https://via.placeholder.com/120" alt="Profile Picture">
        <p><small>(Profile picture – future enhancement)</small></p>
    </div>

    <!-- PROFILE FORM -->
    <form action="StudentProfileServlet" method="post">

        <div class="form-group">
            <label>Student ID</label>
            <input type="text" name="studentId"
                   value="<%= student != null ? student.getStudentId() : "" %>"
                   readonly>
        </div>

        <div class="form-group">
            <label>Programme</label>
            <input type="text" name="programme"
                   value="<%= student != null ? student.getProgramme() : "" %>"
                   required>
        </div>

        <div class="form-group">
            <label>Faculty</label>
            <input type="text" name="faculty"
                   value="<%= student != null ? student.getFaculty() : "" %>"
                   required>
        </div>

        <button type="submit" class="btn">SAVE PROFILE</button>

    </form>

</div>

<!-- FOOTER -->
<div class="footer">
    FOOTER & COPYRIGHT INFORMATION
</div>

</body>
</html>
