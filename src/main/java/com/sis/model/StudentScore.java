package com.sis.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudentScore {
    private int studentScoreId;
    private int studentId;
    private int subjectId;
    private double score1;
    private double score2;

    public double total() {
        return 0.3 * score1 + 0.7 * score2;
    }
    public String grade() {
        double t = total();
        if (t >= 8.0) return "A";
        if (t >= 6.0) return "B";
        if (t >= 4.0) return "D";
        return "F";
    }
}
