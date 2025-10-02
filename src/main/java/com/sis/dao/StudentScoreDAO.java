package com.sis.dao;

import com.sis.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentScoreDAO {
    public void insert(int studentId, int subjectId, double score1, double score2) throws Exception {
        String sql = "INSERT INTO student_score_t(student_id, subject_id, score1, score2) VALUES (?,?,?,?)";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setInt(2, subjectId);
            ps.setDouble(3, score1);
            ps.setDouble(4, score2);
            ps.executeUpdate();
        }
    }

    // Truy vấn để hiển thị Student + Subject + điểm + grade
    public List<Object[]> findStudentScoresView() throws Exception {
        String sql =
                "SELECT st.student_code, st.full_name, sb.subject_code, sb.subject_name, sb.credit," +
                        " ss.score1, ss.score2, (0.3*ss.score1 + 0.7*ss.score2) AS total " +
                        "FROM student_score_t ss " +
                        "JOIN student_t st ON ss.student_id = st.student_id " +
                        "JOIN subject_t sb ON ss.subject_id = sb.subject_id " +
                        "ORDER BY st.full_name, sb.subject_code";
        List<Object[]> rows = new ArrayList<>();
        try (Connection c = DBUtil.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                double total = rs.getDouble("total");
                String grade = (total >= 8.0) ? "A" : (total >= 6.0) ? "B" : (total >= 4.0) ? "D" : "F";
                rows.add(new Object[]{
                        rs.getString("student_code"),
                        rs.getString("full_name"),
                        rs.getString("subject_code"),
                        rs.getString("subject_name"),
                        rs.getInt("credit"),
                        rs.getDouble("score1"),
                        rs.getDouble("score2"),
                        total,
                        grade
                });
            }
        }
        return rows;
    }
}
