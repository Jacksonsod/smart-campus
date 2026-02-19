package com.smartcampus.service;

import com.smartcampus.dao.CourseDAO;
import com.smartcampus.model.Course;
import com.smartcampus.util.HttpClientUtil;
import java.sql.SQLException;
import java.util.List;

public class CourseService {
    private final CourseDAO dao = new CourseDAO();

    // 1. Business Logic for Registration: Must validate with Group 3
    public boolean registerCourse(Course course) throws SQLException {
        if (HttpClientUtil.validateLecturer(course.getLecturerId())) {
            dao.save(course);
            return true;
        }
        return false;
    }

    // 2. Fetch all courses for the list-courses.jsp
    public List<Course> getAllCourses() throws SQLException {
        return dao.getAll();
    }

    // 3. Fetch specific course for the edit-course.jsp
    public Course getCourseById(int id) throws SQLException {
        return dao.getById(id);
    }

    // 4. Handle updates
    public void updateCourse(Course course) throws SQLException {
        dao.update(course);
    }

    // 5. Handle deletions
    public void deleteCourse(int id) throws SQLException {
        dao.delete(id);
    }
}