package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import util.DBConnection;
import model.AdvisorRequest;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdvisorRequestDAO {

    public void submitRequest(AdvisorRequest req) {

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO advisor_requests (student_id, lecturer_id, project_title) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, req.getStudentId());
            ps.setString(2, req.getLecturerId());
            ps.setString(3, req.getProjectTitle());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public ArrayList<AdvisorRequest> getRequestsByLecturer(String lecturerId) {

        ArrayList<AdvisorRequest> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM advisor_requests WHERE lecturer_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
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
    public void updateRequestStatus(int requestId, String status) {

        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE advisor_requests SET status = ? WHERE request_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, requestId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<AdvisorRequest> getAllRequests() {

        ArrayList<AdvisorRequest> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM advisor_requests";
            PreparedStatement ps = con.prepareStatement(sql);
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


}
