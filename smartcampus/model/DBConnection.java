package com.smartcampus.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver"); // Use "com.mysql.cj.jdbc.Driver" for MySQL
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5437/db_course_service", "jackson", "jackson123");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}