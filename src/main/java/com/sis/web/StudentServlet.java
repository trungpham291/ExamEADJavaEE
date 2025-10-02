package com.sis.web;

import com.sis.dao.StudentDAO;
import com.sis.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {
    private final StudentDAO dao = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // show form add student + list students
        try {
            req.setAttribute("students", dao.findAll());
        } catch (Exception e) {
            throw new ServletException(e);
        }
        req.getRequestDispatcher("/student_form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Student s = new Student();
        s.setStudentCode(req.getParameter("student_code"));
        s.setFullName(req.getParameter("full_name"));
        s.setAddress(req.getParameter("address"));
        try {
            dao.insert(s);
        } catch (Exception e) {
            throw new ServletException(e);
        }
        resp.sendRedirect(req.getContextPath() + "/students");
    }
}
