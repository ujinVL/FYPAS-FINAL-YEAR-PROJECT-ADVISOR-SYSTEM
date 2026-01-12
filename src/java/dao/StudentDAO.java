package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Student;
import util.DBConnection;

public class StudentDAO {

    // Get student profile
    public Student getStudentById(String studentId) {

        Student student = null;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM students WHERE student_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                student = new Student();
                student.setStudentId(rs.getString("student_id"));
                student.setProgramme(rs.getString("programme"));
                student.setFaculty(rs.getString("faculty"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

    // Update / Insert student profile
    public void saveStudent(Student student) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "REPLACE INTO students (student_id, programme, faculty) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, student.getStudentId());
            ps.setString(2, student.getProgramme());
            ps.setString(3, student.getFaculty());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
