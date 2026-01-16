<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Lecturer" %>

<%
    if (session == null || session.getAttribute("role") == null
        || !"student".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    Lecturer lecturer = (Lecturer) request.getAttribute("lecturer");
%>

<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | Lecturer Details</title>

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
            width: 85%;
            margin: 30px auto;
            background-color: white;
            border: 2px solid #000;
            padding: 30px;
        }

        .row {
            display: flex;
            gap: 40px;
        }

        .left {
            flex: 1;
        }

        .right {
            flex: 1.2;
        }

        .profile-pic img {
            width: 220px;
            border: 1px solid #000;
        }

        h2 {
            margin-top: 0;
        }

        .info p {
            font-size: 15px;
            margin: 6px 0;
        }

        .highlight {
            background-color: #9eff66;
            padding: 12px;
            margin-top: 15px;
            font-size: 14px;
        }

        input, select, textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            font-size: 14px;
        }

        textarea {
            height: 100px;
        }

        .btn {
            padding: 10px 18px;
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

        .actions {
            text-align: right;
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

    <div class="row">

        <!-- LEFT: LECTURER INFO -->
        <div class="left">

            <div class="profile-pic">
                <img src="https://via.placeholder.com/220" alt="Lecturer Photo">
            </div>

        </div>

        <!-- RIGHT: DETAILS -->
        <div class="right">

            <h2><%= lecturer.getLecturerName() %></h2>

            <div class="info">
                <p><b>Specialization:</b> <%= lecturer.getSpecialization() %></p>
                <p><b>Research Area:</b> <%= lecturer.getResearchArea() %></p>
                <p><b>Supervising:</b> 3 / <%= lecturer.getMaxCapacity() %> students</p>
                <p><b>Status:</b> <%= lecturer.getAvailability() %></p>
            </div>

            <div class="highlight">
                <b>PROJECT ELIGIBILITY:</b><br>
                Suitable for software development and AI-related projects.
            </div>

        </div>

    </div>

    <hr><br>

    <!-- REQUEST FORM -->
    <h3>Requesting Advisor</h3>

    <form action="AdvisorRequestServlet" method="post" enctype="multipart/form-data">

        <input type="hidden" name="lecturerId" value="...">
        <input type="text" name="projectTitle">

        <label>Semester Applying For</label>
        <select name="semester" required>
            <option value="OCT25-FEB26">OCT25 – FEB26</option>
            <option value="MAC26-JULY26">MAC26 – JULY26</option>
        </select>

        <label>Project Title</label>
        <input type="text" name="projectTitle" required>

        <label>Upload Proposal (PDF only)</label>
        <input type="file" name="proposal" accept="application/pdf">

        <label>Additional Notes (Optional)</label>
        <textarea name="notes"></textarea>

        <div class="actions">
            <button type="submit" class="btn btn-green">SUBMIT REQUEST</button>
            <a href="LecturerListServlet">
                <button type="button" class="btn btn-red">CANCEL</button>
            </a>
        </div>

    </form>

</div>

<!-- FOOTER -->
<div class="footer">
    FOOTER & COPYRIGHT INFORMATION
</div>

</body>
</html>
