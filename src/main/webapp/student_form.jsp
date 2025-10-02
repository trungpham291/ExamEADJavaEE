<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setAttribute("pageTitle", "Thêm sinh viên");
    request.setAttribute("page", "students");
%>
<!DOCTYPE html>
<html lang="vi">
<head><%@ include file="/WEB-INF/jspf/_head.jspf" %></head>
<body>
<%@ include file="/WEB-INF/jspf/_nav.jspf" %>

<div class="container py-4">
    <div class="row g-4">
        <div class="col-lg-5">
            <div class="card p-4">
                <h5 class="mb-3">Thêm sinh viên</h5>
                <form method="post" action="students" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label class="form-label">Mã SV</label>
                        <input name="student_code" class="form-control" required>
                        <div class="invalid-feedback">Không được bỏ trống.</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Họ tên</label>
                        <input name="full_name" class="form-control" required>
                        <div class="invalid-feedback">Không được bỏ trống.</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Địa chỉ</label>
                        <input name="address" class="form-control">
                    </div>
                    <button class="btn btn-primary w-100">Lưu</button>
                </form>
            </div>
        </div>

        <div class="col-lg-7">
            <div class="card p-4">
                <h5 class="mb-3">Danh sách sinh viên</h5>
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead><tr><th>#</th><th>Mã SV</th><th>Họ tên</th><th>Địa chỉ</th></tr></thead>
                        <tbody>
                        <c:forEach var="s" items="${students}">
                            <tr>
                                <td>${s.studentId}</td>
                                <td><code>${s.studentCode}</code></td>
                                <td>${s.fullName}</td>
                                <td>${s.address}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jspf/_scripts.jspf" %>
<script>
    (()=>{const f=document.querySelector('form');f.addEventListener('submit',e=>{if(!f.checkValidity()){e.preventDefault();e.stopPropagation()}f.classList.add('was-validated')});})();
</script>
</body>
</html>
