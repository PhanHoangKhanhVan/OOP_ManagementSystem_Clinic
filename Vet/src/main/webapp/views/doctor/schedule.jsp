<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lịch làm việc bác sĩ</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .card { border: none; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .table th { font-weight: 600; }
        .badge { font-size: 0.9rem; padding: 8px 12px; }
    </style>
</head>
<body>

    <nav class="navbar navbar-dark bg-primary mb-4 shadow-sm">
        <div class="container">
            <span class="navbar-brand mb-0 h1"><i class="fa-solid fa-user-doctor"></i> Hệ Thống Bác Sĩ</span>
            <div class="text-white">
                Xin chào, <b>${sessionScope.acc.fullName}</b> &nbsp;|&nbsp; 
                <a href="${pageContext.request.contextPath}/login" class="btn btn-light btn-sm text-primary fw-bold">Đăng xuất</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="card">
            <div class="card-header bg-white py-3 border-bottom-0">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="mb-0 text-primary"><i class="fa-solid fa-calendar-check"></i> Danh sách bệnh nhân đặt lịch</h4>
                    <span class="text-muted">Ngày hôm nay</span>
                </div>
            </div>
            
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover table-striped mb-0 align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th class="text-center">ID</th>
                                <th>Tên Khách Hàng</th>
                                <th>Dịch vụ</th>
                                <th>Ngày hẹn</th>
                                <th class="text-center">Trạng thái</th>
                                <th class="text-center">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listA}" var="app">
                                <tr>
                                    <td class="text-center fw-bold">#${app.id}</td>
                                    <td>${app.customerName}</td>
                                    <td>
                                        <span class="badge bg-info text-dark">
                                            <i class="fa-solid fa-paw"></i> ${app.serviceName}
                                        </span>
                                    </td>
                                    <td>${app.bookingDate}</td>
                                    
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${app.status == 'Pending'}">
                                                <span class="badge bg-warning text-dark">
                                                    <i class="fa-regular fa-clock"></i> Chờ khám
                                                </span>
                                            </c:when>
                                            <c:when test="${app.status == 'Completed' || app.status == 'Approved'}">
                                                <span class="badge bg-success">
                                                    <i class="fa-solid fa-check"></i> Đã khám xong
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">${app.status}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td class="text-center">
                                        <c:if test="${app.status != 'Completed'}">
                                            <a href="${pageContext.request.contextPath}/doctor/prescribe?id=${app.id}" 
                                               class="btn btn-primary btn-sm shadow-sm">
                                                <i class="fa-solid fa-pen-to-square"></i> Kê đơn thuốc
                                            </a>
                                        </c:if>
                                        
                                        <c:if test="${app.status == 'Completed'}">
                                            <button class="btn btn-secondary btn-sm" disabled>
                                                <i class="fa-solid fa-lock"></i> Đã hoàn tất
                                            </button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach> 
                            </tbody>
                    </table>
                </div>
            </div>
            
            <div class="card-footer bg-white text-center py-3">
                <small class="text-muted">Hệ thống quản lý thú y - Vet Management</small>
            </div>
        </div>
    </div>

</body>
</html>