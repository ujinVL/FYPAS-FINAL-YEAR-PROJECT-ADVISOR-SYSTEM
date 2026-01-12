package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Lecturer;
import util.DBConnection;

public class LecturerDAO {

    public ArrayList<Lecturer> getAllLecturers() {

        ArrayList<Lecturer> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM lecturers WHERE availability='OPEN'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Lecturer l = new Lecturer();
                l.setLecturerId(rs.getString("lecturer_id"));
                l.setSpecialization(rs.getString("specialization"));
                l.setResearchArea(rs.getString("research_area"));
                l.setMaxCapacity(rs.getInt("max_capacity"));
                l.setAvailability(rs.getString("availability"));
                l.setBio(rs.getString("bio"));

                list.add(l);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
