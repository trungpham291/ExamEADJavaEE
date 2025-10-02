package com.sis.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Subject {
    private int subjectId;
    private String subjectCode;
    private String subjectName;
    private int credit;
}
