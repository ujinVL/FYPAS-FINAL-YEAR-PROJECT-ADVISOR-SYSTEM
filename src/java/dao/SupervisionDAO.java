package dao;

import model.Supervision;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class SupervisionDAO {

    /* =========================================
       CREATE SUPERVISION (ON LECTURER APPROVE)
       ========================================= */
    public void createSupervision(String studentId,
                                  String lecturerId,
                                  String projectTitle) {

        String sql =
            "INSERT INTO supervision " +
            "(student_id, lecturer_id, project_title, start_semester, expected_end_semester, status) " +
            "VALUES (?, ?, ?, NULL, NULL, 'ACTIVE')";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, studentId);
            ps.setString(2, lecturerId);
            ps.setString(3, projectTitle);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* =========================================
       GET ACTIVE SUPERVISION FOR A STUDENT
       ========================================= */
    public Supervision getSupervisionByStudent(String studentId) {

        Supervision s = null;

        String sql =
            "SELECT sup.supervision_id, sup.project_title, " +
            "sup.start_semester, sup.expected_end_semester, sup.status, " +
            "u.full_name AS lecturer_name " +
            "FROM supervision sup " +
            "JOIN users u ON sup.lecturer_id = u.user_id " +
            "WHERE sup.student_id = ? AND sup.status = 'ACTIVE'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                s = new Supervision();
                s.setSupervisionId(rs.getInt("supervision_id"));
                s.setProjectTitle(rs.getString("project_title"));
                s.setStartSemester(rs.getString("start_semester"));
                s.setExpectedEndSemester(rs.getString("expected_end_semester"));
                s.setStatus(rs.getString("status"));
                s.setLecturerName(rs.getString("lecturer_name"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }
    
    public int countActiveSupervisions() {

        int count = 0;

        String sql = "SELECT COUNT(*) FROM supervision WHERE status = 'ACTIVE'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
    
    public List<Supervision> getAllSupervisions() {

        List<Supervision> list = new ArrayList<>();

        String sql =
            "SELECT sup.supervision_id, sup.student_id, sup.project_title, " +
            "sup.start_semester, sup.expected_end_semester, sup.status, " +
            "u.full_name AS lecturer_name " +
            "FROM supervision sup " +
            "JOIN users u ON sup.lecturer_id = u.user_id " +
            "ORDER BY sup.supervision_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Supervision s = new Supervision();
                s.setSupervisionId(rs.getInt("supervision_id"));
                s.setStudentId(rs.getString("student_id"));
                s.setProjectTitle(rs.getString("project_title"));
                s.setStartSemester(rs.getString("start_semester"));
                s.setExpectedEndSemester(rs.getString("expected_end_semester"));
                s.setStatus(rs.getString("status"));
                s.setLecturerName(rs.getString("lecturer_name"));
                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public void updateSemester(
        int supervisionId,
        String startSemester,
        String expectedEndSemester) {

        String sql =
            "UPDATE supervision " +
            "SET start_semester = ?, expected_end_semester = ? " +
            "WHERE supervision_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, startSemester);
            ps.setString(2, expectedEndSemester);
            ps.setInt(3, supervisionId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
