<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lịch làm việc bác sĩ</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .status-pending { color: orange; font-weight: bold; }
        .status-approved { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Danh sách bệnh nhân đặt lịch</h1>
    <p>Xin chào bác sĩ: <b>${sessionScope.acc.fullName}</b> | <a href="${pageContext.request.contextPath}/login">Đăng xuất</a></p>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên Khách Hàng</th>
                <th>Dịch vụ</th>
                <th>Ngày hẹn</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listA}" var="app">
                <tr>
                    <td>${app.id}</td>
                    <td>${app.customerName}</td>
                    <td>${app.serviceName}</td>
                    <td>${app.bookingDate}</td>
                    <td>
                        <span class="${app.status == 'Pending' ? 'status-pending' : 'status-approved'}">
                            ${app.status}
                        </span>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/doctor/prescribe?id=${app.id}">Kê đơn thuốc</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>