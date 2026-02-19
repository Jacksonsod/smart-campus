package com.smartcampus.dao;
import com.smartcampus.model.*;
import java.sql.*;
import java.util.*;

public class CourseDAO {
    public void save(Course c) throws SQLException {
        String sql = "INSERT INTO courses(course_code, course_name, credits, dept_id, lecturer_id) VALUES(?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getCourseCode()); ps.setString(2, c.getCourseName());
            ps.setInt(3, c.getCredits()); ps.setInt(4, c.getDeptId()); ps.setInt(5, c.getLecturerId());
            ps.executeUpdate();
        }
    }
    public Course getById(int id) throws SQLException {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM courses WHERE id=?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Course c = new Course(rs.getString("course_code"), rs.getString("course_name"), rs.getInt("credits"), rs.getInt("dept_id"), rs.getInt("lecturer_id"));
                c.setId(rs.getInt("id"));
                return c;
            }
        }
        return null;
    }

    public void update(Course c) throws SQLException {
        String sql = "UPDATE courses SET course_code=?, course_name=?, credits=?, dept_id=?, lecturer_id=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getCourseCode());
            ps.setString(2, c.getCourseName());
            ps.setInt(3, c.getCredits());
            ps.setInt(4, c.getDeptId());
            ps.setInt(5, c.getLecturerId());
            ps.setInt(6, c.getId());
            ps.executeUpdate();
        }
    }

    public List<Course> getAll() throws SQLException {
        List<Course> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection(); Statement st = conn.createStatement()) {
            ResultSet rs = st.executeQuery("SELECT * FROM courses ORDER BY id ASC");
            while (rs.next()) {
                Course c = new Course(rs.getString("course_code"), rs.getString("course_name"), rs.getInt("credits"), rs.getInt("dept_id"), rs.getInt("lecturer_id"));
                c.setId(rs.getInt("id")); list.add(c);
            }
        }
        return list;
    }

    public void delete(int id) throws SQLException {
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement("DELETE FROM courses WHERE id=?")) {
            ps.setInt(1, id); ps.executeUpdate();
        }
    }
}