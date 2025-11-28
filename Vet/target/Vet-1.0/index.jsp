<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - The Simpson Clinic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Gradient nền xanh ngọc nhẹ nhàng đồng bộ với Profile/Login */
        .hero-section { 
            background: linear-gradient(135deg, #e0f7fa 0%, #80deea 100%); 
            padding: 80px 0; 
            margin-bottom: 40px; 
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
        }
        .feature-card { 
            border: none;
            border-radius: 20px;
            transition: all 0.3s ease; 
            cursor: pointer; 
            background: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            /* height: 100%;  <-- Class h-100 của Bootstrap sẽ lo việc này */
        }
        .feature-card:hover { 
            transform: translateY(-10px); 
            box-shadow: 0 15px 30px rgba(38, 198, 218, 0.2); 
            border: 1px solid #26c6da;
        }
        .icon-circle {
            width: 80px; height: 80px;
            background-color: #e0f7fa;
            color: #00acc1;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 20px auto;
            font-size: 2rem;
        }
    </style>
</head>
<body class="bg-light">

    <jsp:include page="components/navbar.jsp" />

    <div class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 fw-bold" style="color: #006064;">Welcome to The Simpson Clinic</h1>
            <p class="lead text-secondary">Hệ thống chăm sóc sức khỏe thú cưng hàng đầu.</p>
            
            <c:if test="${sessionScope.acc == null}">
                <div class="mt-4">
                    <a href="views/auth/login.jsp" class="btn btn-info text-white btn-lg rounded-pill px-5 shadow-sm fw-bold">Đăng nhập ngay</a>
                    <a href="views/auth/register.jsp" class="btn btn-outline-info btn-lg rounded-pill px-5 ms-2 fw-bold">Đăng ký</a>
                </div>
            </c:if>
        </div>
    </div>

    <div class="container pb-5">
        
        <c:if test="${sessionScope.acc.role == 'CLIENT'}">
            <div class="row g-4 justify-content-center">
                <div class="col-md-5 d-flex align-items-stretch"> <div class="card feature-card p-4 text-center w-100 h-100 d-flex flex-column"> <div class="icon-circle">
                            <i class="fa-solid fa-calendar-plus"></i>
                        </div>
                        <h3 class="card-title fw-bold text-dark">Đặt Lịch Khám</h3>
                        <p class="text-muted flex-grow-1">Chọn dịch vụ, bác sĩ và thời gian phù hợp nhất cho thú cưng của bạn.</p>
                        
                        <div class="mt-3">
                            <a href="${pageContext.request.contextPath}/client/booking" class="btn btn-info text-white rounded-pill px-4 fw-bold w-100">Đặt ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-5 d-flex align-items-stretch">
                    <div class="card feature-card p-4 text-center w-100 h-100 d-flex flex-column">
                        <div class="icon-circle" style="background-color: #e8f5e9; color: #2e7d32;">
                            <i class="fa-solid fa-clock-rotate-left"></i>
                        </div>
                        <h3 class="card-title fw-bold text-dark">Hồ Sơ Bệnh Án</h3>
                        <p class="text-muted flex-grow-1">Xem lại lịch sử khám, đơn thuốc và lời dặn dò của bác sĩ.</p>
                        
                        <div class="mt-3">
                            <a href="${pageContext.request.contextPath}/client/history" class="btn btn-success rounded-pill px-4 fw-bold w-100">Xem hồ sơ</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.acc.role == 'DOCTOR'}">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card feature-card p-5 text-center border-info">
                        <div class="icon-circle" style="background-color: #ffebee; color: #c62828;">
                            <i class="fa-solid fa-user-doctor"></i>
                        </div>
                        <h2 class="fw-bold text-dark">Trang Quản Lý Bác Sĩ</h2>
                        <p class="lead text-muted">Xin chào bác sĩ <b>${sessionScope.acc.fullName}</b>. Chúc bạn một ngày làm việc hiệu quả.</p>
                        <hr>
                        <div class="d-flex justify-content-center gap-3 mt-4">
                            <a href="${pageContext.request.contextPath}/doctor/schedule" class="btn btn-danger btn-lg rounded-pill px-5 shadow-sm">
                                <i class="fa-solid fa-clipboard-list me-2"></i> Xem Lịch Khám
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.acc == null}">
            <div class="row text-center mt-5">
                <div class="col-md-4">
                    <div class="p-3">
                        <i class="fa-solid fa-user-nurse fa-3x text-info mb-3"></i>
                        <h5>Đội ngũ chuyên nghiệp</h5>
                        <p class="text-muted small">Bác sĩ thú y giàu kinh nghiệm, tận tâm.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3">
                        <i class="fa-solid fa-microscope fa-3x text-info mb-3"></i>
                        <h5>Trang thiết bị hiện đại</h5>
                        <p class="text-muted small">Máy móc xét nghiệm, siêu âm tiên tiến.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3">
                        <i class="fa-solid fa-heart-pulse fa-3x text-info mb-3"></i>
                        <h5>Chăm sóc 24/7</h5>
                        <p class="text-muted small">Luôn sẵn sàng khi thú cưng cần cấp cứu.</p>
                    </div>
                </div>
            </div>
        </c:if>

    </div>

    <footer class="text-center mt-5 py-4 text-secondary border-top bg-white">
        <small>&copy; 2023 The Simpson Clinic. Built with Java Servlet & Bootstrap 5.</small>
    </footer>

</body>
</html>