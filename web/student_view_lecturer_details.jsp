<%
    String lecturerId = request.getParameter("id");
%>

<h2>Lecturer Details</h2>

<form action="AdvisorRequestServlet" method="post">
    <input type="hidden" name="lecturerId" value="<%= lecturerId %>">

    Project Title:<br>
    <input type="text" name="projectTitle" required><br><br>

    <button type="submit">Request Advisor</button>
</form>

<a href="LecturerListServlet">Back</a>
