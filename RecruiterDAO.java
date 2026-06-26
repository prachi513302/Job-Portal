package dao;

import java.sql.*;
import model.Recruiter;
import util.DBConnection;

public class RecruiterDAO {

    public boolean register(Recruiter r) {
        String check = "select id from recruiters where email=?";
        try (Connection con = DBConnection.getConnection()) {
            try (PreparedStatement ps = con.prepareStatement(check)) {
                ps.setString(1, r.getEmail());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) return false;
                }
            }
            String sql = "insert into recruiters(company_name,email,password,description) values(?,?,?,?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, r.getCompanyName());
                ps.setString(2, r.getEmail());
                ps.setString(3, r.getPassword());
                ps.setString(4, r.getDescription());
                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Recruiter login(String email, String password) {
        String sql = "select * from recruiters where email=? and password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Recruiter r = new Recruiter();
                    r.setId(rs.getInt("id"));
                    r.setCompanyName(rs.getString("company_name"));
                    r.setEmail(rs.getString("email"));
                    r.setPassword(rs.getString("password"));
                    r.setDescription(rs.getString("description"));
                    return r;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}