package dao;

import java.sql.*;
import util.DBConnection;

public class AdminDAO {

    public int countUsersByRole(String role) {
        String sql = "SELECT COUNT(*) FROM users WHERE role=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, role);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int countActiveSupervisions() {
        String sql = "SELECT COUNT(*) FROM supervision WHERE status='ACTIVE'";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int countPendingRequests() {
        String sql = "SELECT COUNT(*) FROM advisor_requests WHERE status='PENDING'";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
