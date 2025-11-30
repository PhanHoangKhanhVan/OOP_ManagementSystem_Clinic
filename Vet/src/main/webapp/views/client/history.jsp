<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Medical history</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #007bff; color: white; }
        .back-btn { display: inline-block; margin-top: 20px; text-decoration: none; color: blue; }
    </style>
</head>
<body>
    <h1>Hồ sơ sức khỏe thú cưng</h1>
    <p>Khách hàng: <b>${sessionScope.acc.fullName}</b></p>
    
    <c:if test="${empty history}">
        <p style="color: red">Bạn chưa có hồ sơ khám bệnh nào.</p>
    </c:if>
        
    <c:if test="${not empty history}">
        <table>
            <thead>
                <tr>
                    <th>Ngày khám</th>
                    <th>Dịch vụ</th>
                    <th>Chẩn đoán của Bác sĩ</th>
                    <th>Đơn thuốc & Dặn dò</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${history}" var="h">
                    <tr>
                        <td>${h.bookingDate}</td>
                        <td>${h.serviceName}</td>
                        <td>${h.status}</td>       <td>${h.customerName}</td> </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    
    <a class="back-btn" href="${pageContext.request.contextPath}/index.jsp">Quay về trang chủ</a>
</body>
</html>