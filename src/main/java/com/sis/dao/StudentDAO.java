package com.sis.dao;

import com.sis.model.Student;
import com.sis.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    public void insert(Student s) throws Exception {
        String sql = "INSERT INTO student_t(student_code, full_name, address) VALUES (?,?,?)";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, s.getStudentCode());
            ps.setString(2, s.getFullName());
            ps.setString(3, s.getAddress());
            ps.executeUpdate();
        }
    }

    public List<Student> findAll() throws Exception {
        String sql = "SELECT student_id, student_code, full_name, address FROM student_t";
        List<Student> list = new ArrayList<>();
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setStudentId(rs.getInt(1));
                s.setStudentCode(rs.getString(2));
                s.setFullName(rs.getString(3));
                s.setAddress(rs.getString(4));
                list.add(s);
            }
        }
        return list;
    }
}
