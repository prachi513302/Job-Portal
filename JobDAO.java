package dao;

import java.sql.*;
import java.util.*;
import model.Job;
import util.DBConnection;

public class JobDAO {

    public List<Job> getAllJobs() {
        List<Job> jobs = new ArrayList<>();
        String sql = "select * from jobs";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Job j = new Job();
                j.setJobId(rs.getInt("job_id"));
                j.setTitle(rs.getString("title"));
                j.setCompany(rs.getString("company"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getString("salary"));
                j.setDescription(rs.getString("description"));
                j.setRecruiterId(rs.getInt("recruiter_id"));
                jobs.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jobs;
    }

    // Apply to a job, prevents duplicate applications
    public boolean applyToJob(int userId, int jobId) {
        String check = "select application_id from applications where user_id=? and job_id=?";
        String insert = "insert into applications(user_id, job_id, status) values(?,?,'Applied')";
        try (Connection con = DBConnection.getConnection()) {
            try (PreparedStatement ps = con.prepareStatement(check)) {
                ps.setInt(1, userId);
                ps.setInt(2, jobId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) return false; // already applied
                }
            }
            try (PreparedStatement ps = con.prepareStatement(insert)) {
                ps.setInt(1, userId);
                ps.setInt(2, jobId);
                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // add inside JobDAO.java

public boolean postJob(Job j) {
    String sql = "insert into jobs(title,company,location,salary,description,recruiter_id) values(?,?,?,?,?,?)";
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, j.getTitle());
        ps.setString(2, j.getCompany());
        ps.setString(3, j.getLocation());
        ps.setString(4, j.getSalary());
        ps.setString(5, j.getDescription());
        ps.setInt(6, j.getRecruiterId());
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

public List<Job> getJobsByRecruiter(int recruiterId) {
    List<Job> jobs = new ArrayList<>();
    String sql = "select * from jobs where recruiter_id=?";
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, recruiterId);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Job j = new Job();
                j.setJobId(rs.getInt("job_id"));
                j.setTitle(rs.getString("title"));
                j.setCompany(rs.getString("company"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getString("salary"));
                j.setDescription(rs.getString("description"));
                j.setRecruiterId(rs.getInt("recruiter_id"));
                jobs.add(j);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return jobs;
}
}