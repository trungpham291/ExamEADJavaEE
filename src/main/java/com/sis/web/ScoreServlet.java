package com.sis.web;

import com.sis.dao.StudentDAO;
import com.sis.dao.StudentScoreDAO;
import com.sis.dao.SubjectDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/scores")
public class ScoreServlet extends HttpServlet {
    private final StudentDAO studentDAO = new StudentDAO();
    private final SubjectDAO subjectDAO = new SubjectDAO();
    private final StudentScoreDAO scoreDAO = new StudentScoreDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            req.setAttribute("students", studentDAO.findAll());
            req.setAttribute("subjects", subjectDAO.findAll());
        } catch (Exception e) {
            throw new ServletException(e);
        }
        req.getRequestDispatcher("/score_form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int studentId = Integer.parseInt(req.getParameter("student_id"));
        int subjectId = Integer.parseInt(req.getParameter("subject_id"));
        double score1 = Double.parseDouble(req.getParameter("score1"));
        double score2 = Double.parseDouble(req.getParameter("score2"));
        try {
            scoreDAO.insert(studentId, subjectId, score1, score2);
        } catch (Exception e) {
            throw new ServletException(e);
        }
        resp.sendRedirect(req.getContextPath() + "/scores");
    }
}
