<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor's Work Schedule</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { background-color: #f5f7fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .page-header {
            background: white;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }
        .table-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        /* Style cho trạng thái */
        .status-badge { padding: 5px 12px; border-radius: 20px; font-size: 0.85rem; font-weight: 600; }
        .status-Pending { background-color: #fff3cd; color: #856404; border: 1px solid #ffeeba; } 
        .status-Approved { background-color: #d1e7dd; color: #0f5132; border: 1px solid #badbcc; } 
        .status-Completed { background-color: #e2e3e5; color: #41464b; border: 1px solid #d3d6d8; } /* Thêm màu cho trạng thái Completed */
        
        th { background-color: #26c6da !important; color: white; font-weight: 600; } 
        td { vertical-align: middle; }
    </style>
</head>
<body>

    <div class="page-header d-flex justify-content-between align-items-center">
        <h3 class="m-0 text-secondary">
            <i class="fa-solid fa-user-doctor text-info"></i> Doctor: <b class="text-dark">${sessionScope.acc.fullName}</b>
        </h3> 
        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-danger btn-sm rounded-pill px-3">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>

    <div class="container">
        <div class="table-card">
            <h2 class="mb-4 text-center fw-bold" style="color: #2c3e50;">Appointment List</h2>
            
            <c:choose>
                
                <%-- Trường hợp 1: Không có lịch hẹn nào --%>
                <c:when test="${empty listA}">
                    <div class="alert alert-warning text-center p-5 rounded-3">
                        <i class="fa-regular fa-calendar-xmark fa-3x mb-3 text-warning"></i><br>
                        <strong class="fs-5">There are no appointments today.</strong>
                    </div>
                </c:when>
                
                <%-- Trường hợp 2: Có lịch hẹn --%>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered align-middle"> 
                            <thead>
                                <tr class="text-center">
                                    <th>ID</th>
                                    <th>Client Name</th>
                                    <th>Services</th>
                                    <th>Booking Time</th>
                                    <th>State</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listA}" var="app">
                                    <tr>
                                        <td class="text-center">#${app.id}</td>
                                        <td class="fw-bold">${app.customerName}</td>
                                        <td>
                                            <span class="badge bg-info text-dark">
                                                <i class="fa-solid fa-notes-medical"></i> ${app.serviceName}
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            ${app.bookingDate} 
                                            </td>
                                        
                                        <td class="text-center">
                                            <span class="status-badge status-${app.status}">
                                                ${app.status}
                                            </span>
                                        </td>
                                        
                                        <td class="text-center">
                                            <c:if test="${app.status != 'Completed'}">
                                                <a href="${pageContext.request.contextPath}/doctor/prescribe?id=${app.id}" 
                                                   class="btn btn-primary btn-sm shadow-sm rounded-pill px-3" 
                                                   style="background-color: #26c6da; border: none;">
                                                    <i class="fa-solid fa-file-prescription"></i> Prescribe
                                                </a>
                                            </c:if>
                                            
                                            <c:if test="${app.status == 'Completed'}">
                                                <button class="btn btn-secondary btn-sm rounded-pill px-3" disabled>
                                                    <i class="fa-solid fa-check"></i> Done
                                                </button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                        </table>
                    </div>
                </c:otherwise>
                
            </c:choose>
            
        </div>
    </div>

</body>
</html>