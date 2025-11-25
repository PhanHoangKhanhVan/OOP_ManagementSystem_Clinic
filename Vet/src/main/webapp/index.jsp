<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hệ Thống Quản Lý Thú Y</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-section { background: linear-gradient(to right, #00c6ff, #0072ff); color: white; padding: 50px 0; margin-bottom: 30px; }
        .feature-card { transition: transform 0.3s; cursor: pointer; }
        .feature-card:hover { transform: translateY(-10px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
    </style>
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fa-solid fa-paw"></i> VetManager</a>
            <div class="d-flex text-white align-items-center">
                <c:if test="${sessionScope.acc != null}">
                    <span class="me-3">Xin chào, <b>${sessionScope.acc.fullName}</b> (${sessionScope.acc.role})</span>
                    <a href="login" class="btn btn-outline-light btn-sm">Đăng xuất</a>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <a href="views/auth/login.jsp" class="btn btn-primary btn-sm">Đăng nhập</a>
                </c:if>
            </div>
        </div>
    </nav>

    <div class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 fw-bold">Chào mừng đến với Vet Clinic</h1>
            <p class="lead">Hệ thống chăm sóc sức khỏe thú cưng hàng đầu.</p>
        </div>
    </div>

    

[Image of Bootstrap Grid System layout]

    <div class="container">
        <div class="row g-4">
            
            <c:if test="${sessionScope.acc.role == 'CLIENT'}">
                <div class="col-md-6">
                    <div class="card feature-card h-100 border-primary">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-calendar-plus fa-3x text-primary mb-3"></i>
                            <h3 class="card-title">Đặt Lịch Khám</h3>
                            <p class="card-text">Chọn dịch vụ và đặt lịch hẹn nhanh chóng.</p>
                            <a href="${pageContext.request.contextPath}/client/booking" class="btn btn-primary">Đặt ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card feature-card h-100 border-success">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-clock-rotate-left fa-3x text-success mb-3"></i>
                            <h3 class="card-title">Lịch Sử Khám</h3>
                            <p class="card-text">Xem lại hồ sơ bệnh án và đơn thuốc.</p>
                            <a href="${pageContext.request.contextPath}/client/history" class="btn btn-success">Xem hồ sơ</a>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${sessionScope.acc.role == 'DOCTOR'}">
                <div class="col-md-12">
                    <div class="card feature-card h-100 border-danger">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-user-doctor fa-3x text-danger mb-3"></i>
                            <h3 class="card-title">Lịch Làm Việc</h3>
                            <p class="card-text">Quản lý danh sách bệnh nhân và kê đơn thuốc.</p>
                            <a href="${pageContext.request.contextPath}/doctor/schedule" class="btn btn-danger btn-lg">Vào trang quản lý</a>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${sessionScope.acc == null}">
                <div class="col-12 text-center mt-5">
                    <h3>Vui lòng đăng nhập để sử dụng dịch vụ</h3>
                </div>
            </c:if>

        </div>
    </div>

    <footer class="text-center mt-5 py-4 text-muted">
        &copy; 2023 Vet Management System. Built with Java & Bootstrap 5.
    </footer>

</body>
</html>