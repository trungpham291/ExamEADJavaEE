<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setAttribute("pageTitle", "Báo cáo điểm & Grade");
    request.setAttribute("page", "report");
%>
<!DOCTYPE html>
<html lang="vi">
<head><%@ include file="/WEB-INF/jspf/_head.jspf" %></head>
<body>
<%@ include file="/WEB-INF/jspf/_nav.jspf" %>

<div class="container py-4">
    <div class="card p-4">
        <div class="d-flex align-items-center justify-content-between mb-3">
            <h5 class="mb-0">Báo cáo điểm</h5>
            <span class="text-secondary small">Total = 0.3 × S1 + 0.7 × S2</span>
        </div>
        <div class="table-responsive">
            <table class="table table-striped align-middle">
                <thead>
                <tr>
                    <th>Mã SV</th><th>Họ tên</th>
                    <th>Mã môn</th><th>Tên môn</th><th>Tín chỉ</th>
                    <th>Score1</th><th>Score2</th><th>Total</th><th>Grade</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="r" items="${rows}">
                    <tr>
                        <td><code>${r[0]}</code></td>
                        <td>${r[1]}</td>
                        <td>${r[2]}</td>
                        <td>${r[3]}</td>
                        <td>${r[4]}</td>
                        <td><fmt:formatNumber value="${r[5]}" maxFractionDigits="2"/></td>
                        <td><fmt:formatNumber value="${r[6]}" maxFractionDigits="2"/></td>
                        <td><fmt:formatNumber value="${r[7]}" maxFractionDigits="2"/></td>
                        <td>
                            <c:set var="g" value="${r[8]}"/>
                            <c:choose>
                                <c:when test="${g=='A'}"><span class="badge text-bg-success">A</span></c:when>
                                <c:when test="${g=='B'}"><span class="badge text-bg-primary">B</span></c:when>
                                <c:when test="${g=='D'}"><span class="badge text-bg-warning">D</span></c:when>
                                <c:otherwise><span class="badge text-bg-danger">F</span></c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jspf/_scripts.jspf" %>
</body>
</html>
