<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>FYPAS | Sign Up</title>

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

        /* CONTAINER */
        .container {
            background-color: white;
            width: 800px;
            margin: 50px auto;
            padding: 30px;
            border: 2px solid #000;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        /* FORM GRID */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
        }

        .role {
            grid-column: span 2;
            text-align: center;
        }

        .role label {
            margin: 0 15px;
        }

        .profile-pic {
            grid-column: span 2;
            text-align: center;
        }

        .profile-pic img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: #ccc;
            margin-bottom: 10px;
        }

        .btn {
            grid-column: span 2;
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
    <a href="login.jsp">LOG IN</a>
</div>

<!-- SIGN UP FORM -->
<div class="container">

    <h2>FYPAS</h2>

    <form action="#" method="post" enctype="multipart/form-data">

        <div class="form-grid">

            <!-- PROFILE PICTURE -->
            <div class="profile-pic">
                <img src="https://via.placeholder.com/120" alt="Profile Picture">
                <br>
                <input type="file" disabled>
                <p><small>(Profile upload – future enhancement)</small></p>
            </div>

            <!-- ROLE -->
            <div class="role">
                <label><input type="radio" name="role" value="student" checked> Student</label>
                <label><input type="radio" name="role" value="lecturer"> Staff</label>
            </div>

            <!-- FULL NAME -->
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" placeholder="Enter full name" required>
            </div>

            <!-- USERNAME -->
            <div class="form-group">
                <label>User ID</label>
                <input type="text" placeholder="e.g. 2023123456 / LCT001" required>
            </div>

            <!-- EMAIL -->
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" placeholder="example@uitm.edu.my" required>
            </div>

            <!-- PASSWORD -->
            <div class="form-group">
                <label>Password</label>
                <input type="password" required>
            </div>

            <!-- PROGRAMME -->
            <div class="form-group">
                <label>Programme</label>
                <select>
                    <option>CDCS230 - Software Engineering</option>
                    <option>CDCS240 - Computer Science</option>
                </select>
            </div>

            <!-- FACULTY -->
            <div class="form-group">
                <label>Faculty</label>
                <select>
                    <option>FSKM</option>
                    <option>FKE</option>
                </select>
            </div>

            <!-- SIGN UP BUTTON -->
            <button type="submit" class="btn">SIGN UP</button>

        </div>
    </form>

</div>

<!-- FOOTER -->
<div class="footer">
    FOOTER & COPYRIGHT INFORMATION
</div>

</body>
</html>
