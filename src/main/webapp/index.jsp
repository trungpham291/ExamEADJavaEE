<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setAttribute("pageTitle", "SIS — Dashboard");
    request.setAttribute("page", "home");
%>
<!DOCTYPE html>
<html lang="vi">
<head><%@ include file="/WEB-INF/jspf/_head.jspf" %></head>
<body>
<%@ include file="/WEB-INF/jspf/_nav.jspf" %>

<div class="container py-4">
    <div class="row g-4">
        <div class="col-md-4">
            <a class="text-decoration-none" href="${pageContext.request.contextPath}/students">
                <div class="card p-4 h-100">
                    <h5 class="mb-2">+ Thêm sinh viên</h5>
                    <p class="text-secondary mb-0">Tạo mới hồ sơ sinh viên với mã, họ tên, địa chỉ.</p>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a class="text-decoration-none" href="${pageContext.request.contextPath}/scores">
                <div class="card p-4 h-100">
                    <h5 class="mb-2">+ Nhập điểm</h5>
                    <p class="text-secondary mb-0">Chọn sinh viên, môn học và nhập Score1/Score2.</p>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a class="text-decoration-none" href="${pageContext.request.contextPath}/report">
                <div class="card p-4 h-100">
                    <h5 class="mb-2">Báo cáo</h5>
                    <p class="text-secondary mb-0">Xem tổng điểm (0.3·S1 + 0.7·S2) và Grade.</p>
                </div>
            </a>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jspf/_scripts.jspf" %>
</body>
</html>
