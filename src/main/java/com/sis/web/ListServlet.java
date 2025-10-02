package com.sis.web;

import com.sis.dao.StudentScoreDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/report")
public class ListServlet extends HttpServlet {
    private final StudentScoreDAO dao = new StudentScoreDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            req.setAttribute("rows", dao.findStudentScoresView());
        } catch (Exception e) {
            throw new ServletException(e);
        }
        req.getRequestDispatcher("/list_students.jsp").forward(req, resp);
    }
}
