package com.smartcampus.controller;

import com.google.gson.Gson;
import com.smartcampus.model.Course;
import com.smartcampus.service.CourseService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/courses")
public class CourseServlet extends HttpServlet {

    private final CourseService courseService = new CourseService();
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String format = req.getParameter("format");

        try {
            List<Course> courses = courseService.getAllCourses();

            // Check if JSON is requested via URL parameter (?format=json)
            // OR via Postman Header (Accept: application/json)
            String acceptHeader = req.getHeader("Accept");

            if ("json".equals(format) || (acceptHeader != null && acceptHeader.contains("application/json"))) {

                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");

                String jsonOutput = this.gson.toJson(courses);
                resp.getWriter().write(jsonOutput);
                resp.getWriter().flush();

                return; // CRITICAL: Stop the method here so it doesn't run the HTML code below
            }

            // Default behavior: Show the HTML table for browser users
            req.setAttribute("courses", courses);
            req.getRequestDispatcher("/views/list-courses.jsp").forward(req, resp);

        } catch (SQLException e) {
            resp.setStatus(500);
            resp.setContentType("application/json");
            resp.getWriter().write("{\"error\": \"Database error: " + e.getMessage() + "\"}");
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");

        // Wrap in try-catch to handle number format errors
        try {
            Course c = new Course(
                    req.getParameter("courseCode"),
                    req.getParameter("courseName"),
                    Integer.parseInt(req.getParameter("credits")),
                    Integer.parseInt(req.getParameter("deptId")),
                    Integer.parseInt(req.getParameter("lecturerId"))
            );

            boolean success;
            if (idStr == null || idStr.isEmpty()) {
                success = courseService.registerCourse(c);
            } else {
                c.setId(Integer.parseInt(idStr));
                courseService.updateCourse(c);
                success = true;
            }

            if (success) {
                resp.sendRedirect("courses");
            } else {
                req.setAttribute("error", "Lecturer ID not found in Group 3's records.");
                req.getRequestDispatcher("/views/add-course.jsp").forward(req, resp);
            }
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException(e);
        }
    }
}