<%@ page import="model.Student" %>
<%
    if (session == null || session.getAttribute("role") == null 
        || !"student".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    Student student = (Student) request.getAttribute("student");
%>

<h2>Student Profile</h2>

<form action="StudentProfileServlet" method="post">
    Programme:
    <input type="text" name="programme"
           value="<%= student != null ? student.getProgramme() : "" %>"><br><br>

    Faculty:
    <input type="text" name="faculty"
           value="<%= student != null ? student.getFaculty() : "" %>"><br><br>

    <button type="submit">Save</button>
</form>

<br>
<a href="student_dashboard.jsp">Back to Dashboard</a>
