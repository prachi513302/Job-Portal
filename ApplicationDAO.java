package dao;

import java.sql.*;
import java.util.*;
import util.DBConnection;

public class ApplicationDAO {

    public static class AppRow {
        public int applicationId, jobId;
        public String title, company, status, applyDate;
    }

    public List<AppRow> getApplicationsForUser(int userId) {
        List<AppRow> list = new ArrayList<>();
        String sql = "select a.application_id, a.job_id, j.title, j.company, a.status, a.apply_date " +
                     "from applications a join jobs j on a.job_id = j.job_id " +
                     "where a.user_id = ? order by a.apply_date desc";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AppRow row = new AppRow();
                    row.applicationId = rs.getInt("application_id");
                    row.jobId = rs.getInt("job_id");
                    row.title = rs.getString("title");
                    row.company = rs.getString("company");
                    row.status = rs.getString("status");
                    row.applyDate = rs.getTimestamp("apply_date").toString();
                    list.add(row);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // for recruiter side: applicants for a job
    public List<AppRow> getApplicantsForJob(int jobId) {
        List<AppRow> list = new ArrayList<>();
        String sql = "select a.application_id, a.user_id, u.name, u.email, a.status, a.apply_date " +
                     "from applications a join users u on a.user_id = u.id " +
                     "where a.job_id = ? order by a.apply_date desc";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, jobId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AppRow row = new AppRow();
                    row.applicationId = rs.getInt("application_id");
                    row.title = rs.getString("name");   // reused field = applicant name
                    row.company = rs.getString("email"); // reused field = applicant email
                    row.status = rs.getString("status");
                    row.applyDate = rs.getTimestamp("apply_date").toString();
                    list.add(row);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateStatus(int applicationId, String status) {
        String sql = "update applications set status=? where application_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, applicationId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}