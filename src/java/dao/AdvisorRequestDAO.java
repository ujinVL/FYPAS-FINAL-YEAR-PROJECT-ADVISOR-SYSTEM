package dao;

import model.AdvisorRequest;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdvisorRequestDAO {

    /* ===============================
       CREATE REQUEST (STUDENT)
       =============================== */
    public void createRequest(String studentId, String lecturerId, String projectTitle) {

        String sql = "INSERT INTO advisor_requests (student_id, lecturer_id, project_title, status) "
                   + "VALUES (?, ?, ?, 'PENDING')";

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

    /* ===============================
       GET REQUESTS BY STUDENT
       =============================== */
    public List<AdvisorRequest> getRequestsByStudent(String studentId) {

        List<AdvisorRequest> list = new ArrayList<>();
        String sql = "SELECT * FROM advisor_requests WHERE student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AdvisorRequest ar = new AdvisorRequest();
                ar.setRequestId(rs.getInt("request_id"));
                ar.setStudentId(rs.getString("student_id"));
                ar.setLecturerId(rs.getString("lecturer_id"));
                ar.setProjectTitle(rs.getString("project_title"));
                ar.setStatus(rs.getString("status"));
                list.add(ar);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /* ===============================
       GET REQUESTS BY LECTURER
       =============================== */
    public List<AdvisorRequest> getRequestsByLecturer(String lecturerId) {

        List<AdvisorRequest> list = new ArrayList<>();
        String sql = "SELECT * FROM advisor_requests WHERE lecturer_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, lecturerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AdvisorRequest ar = new AdvisorRequest();
                ar.setRequestId(rs.getInt("request_id"));
                ar.setStudentId(rs.getString("student_id"));
                ar.setLecturerId(rs.getString("lecturer_id"));
                ar.setProjectTitle(rs.getString("project_title"));
                ar.setStatus(rs.getString("status"));
                list.add(ar);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /* ===============================
       UPDATE REQUEST STATUS
       =============================== */
    public void updateRequestStatus(String requestId, String status) {

        String sql = "UPDATE advisor_requests SET status = ? WHERE request_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(requestId));
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* ===============================
       DELETE REQUEST (CANCEL)
       =============================== */
    public void deleteRequest(String requestId) {

        String sql = "DELETE FROM advisor_requests WHERE request_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, Integer.parseInt(requestId));
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public AdvisorRequest getRequestById(int requestId) {

        AdvisorRequest ar = null;
        String sql = "SELECT * FROM advisor_requests WHERE request_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, requestId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ar = new AdvisorRequest();
                ar.setRequestId(rs.getInt("request_id"));
                ar.setStudentId(rs.getString("student_id"));
                ar.setLecturerId(rs.getString("lecturer_id"));
                ar.setProjectTitle(rs.getString("project_title"));
                ar.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ar;
    }
    
    public boolean hasActiveRequest(String studentId) {

        boolean exists = false;

        String sql =
            "SELECT COUNT(*) FROM advisor_requests " +
            "WHERE student_id = ? AND status IN ('PENDING', 'APPROVED')";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                exists = rs.getInt(1) > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }


}
