<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setAttribute("pageTitle", "Nhập điểm");
    request.setAttribute("page", "scores");
%>
<!DOCTYPE html>
<html lang="vi">
<head><%@ include file="/WEB-INF/jspf/_head.jspf" %></head>
<body>
<%@ include file="/WEB-INF/jspf/_nav.jspf" %>

<div class="container py-4">
    <div class="card p-4 mx-auto" style="max-width:680px;">
        <h5 class="mb-3">Nhập điểm</h5>
        <form method="post" action="scores" class="row g-3 needs-validation" novalidate>
            <div class="col-md-6">
                <label class="form-label">Sinh viên</label>
                <select name="student_id" class="form-select">
                    <c:forEach var="s" items="${students}">
                        <option value="${s.studentId}">${s.fullName} — ${s.studentCode}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Môn học</label>
                <select name="subject_id" class="form-select">
                    <c:forEach var="sb" items="${subjects}">
                        <option value="${sb.subjectId}">${sb.subjectName} — ${sb.subjectCode}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Score1 (0–10)</label>
                <input name="score1" type="number" step="0.01" min="0" max="10" class="form-control" required>
                <div class="invalid-feedback">0–10 nhé.</div>
            </div>
            <div class="col-md-6">
                <label class="form-label">Score2 (0–10)</label>
                <input name="score2" type="number" step="0.01" min="0" max="10" class="form-control" required>
                <div class="invalid-feedback">0–10 nhé.</div>
            </div>

            <div class="col-12">
                <button class="btn btn-primary w-100">Lưu</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/jspf/_scripts.jspf" %>
<script>
    (()=>{const f=document.querySelector('form');f.addEventListener('submit',e=>{if(!f.checkValidity()){e.preventDefault();e.stopPropagation()}f.classList.add('was-validated')});})();
</script>
</body>
</html>
