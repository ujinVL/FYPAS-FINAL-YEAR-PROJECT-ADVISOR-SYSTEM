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
    <title>FYPAS | Lecturer Profile</title>

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
            width: 80%;
            margin: 30px auto;
            background-color: white;
            border: 2px solid #000;
            padding: 30px;
        }

        h2 {
            margin-top: 0;
        }

        .row {
            display: flex;
            gap: 40px;
        }

        .left, .right {
            flex: 1;
        }

        .profile-pic {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-pic img {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            background-color: #ccc;
        }

        .info-box {
            background-color: #eef2f7;
            padding: 15px;
            margin-bottom: 15px;
        }

        .info-row {
            margin-bottom: 10px;
        }

        .info-row b {
            display: inline-block;
            width: 180px;
        }

        input, select, textarea {
            width: 100%;
            padding: 8px;
            font-size: 14px;
        }

        textarea {
            height: 80px;
        }

        .actions {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            font-size: 14px;
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

    <h2>Lecturer Profile</h2>

    <form action="LecturerProfileServlet" method="post">

        <div class="row">

            <!-- LEFT -->
            <div class="left">

                <div class="profile-pic">
                    <img src="https://via.placeholder.com/130" alt="Profile Picture">
                    <p><small>(Change photo – future feature)</small></p>
                </div>

                <div class="info-box">
                    <div class="info-row"><b>Name:</b> Dr. Ahmad Bin Salleh</div>
                    <div class="info-row"><b>Staff ID:</b> <%= lecturerId %></div>
                    <div class="info-row"><b>Faculty:</b> FSKM</div>
                </div>

            </div>

            <!-- RIGHT -->
            <div class="right">

                <div class="info-row">
                    <b>Email</b>
                    <input type="email" value="ahmad@uitm.edu.my" readonly>
                </div>

                <div class="info-row">
                    <b>Research Area</b>
                    <input type="text" placeholder="e.g. Requirements Engineering">
                </div>

                <div class="info-row">
                    <b>Specialization Category</b>
                    <select>
                        <option>Software Engineering</option>
                        <option>Data Science</option>
                        <option>Artificial Intelligence</option>
                        <option>Information Systems</option>
                    </select>
                </div>

                <div class="info-row">
                    <b>Max Supervision Capacity</b>
                    <input type="number" min="1" max="10" value="5">
                </div>

                <div class="info-row">
                    <b>Availability</b>
                    <select>
                        <option>OPEN</option>
                        <option>CLOSED</option>
                    </select>
                </div>

                <div class="info-row">
                    <b>Bio / Description</b>
                    <textarea placeholder="Short academic background or expectations..."></textarea>
                </div>

            </div>

        </div>

        <div class="actions">
            <button type="submit" class="btn btn-blue">
                EDIT PROFILE INFORMATION
            </button>
        </div>

    </form>

</div>

<!-- FOOTER -->
<div class="footer">
    FOOTER & COPYRIGHT INFORMATION
</div>

</body>
</html>
