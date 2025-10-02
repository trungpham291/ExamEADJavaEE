package com.sis.dao;

import com.sis.model.Subject;
import com.sis.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO {
    public List<Subject> findAll() throws Exception {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT subject_id, subject_code, subject_name, credit FROM subject_t";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(1));
                s.setSubjectCode(rs.getString(2));
                s.setSubjectName(rs.getString(3));
                s.setCredit(rs.getInt(4));
                list.add(s);
            }
        }
        return list;
    }
}
