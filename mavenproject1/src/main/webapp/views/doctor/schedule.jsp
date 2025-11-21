<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Doctor's work schedule</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { background-color: #f5f7fa; }
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
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
        }
        .status-Pending { background-color: #fff3cd; color: #856404; } 
        .status-Approved { background-color: #d4edda; color: #155724; } 
        
        th { background-color: #26c6da !important; color: white; } 
    </style>
</head>
<body>

    <div class="page-header d-flex justify-content-between align-items-center">
        <h3 class="m-0 text-secondary"><i class="fa-solid fa-user-doctor"></i> Doctor: <b>${sessionScope.acc.fullName}</b></h3> <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-danger btn-sm">Đăng xuất</a>
    </div>

    <div class="container">
        <div class="table-card">
            <h2 class="mb-4 text-center" style="color: #2c3e50;">Client List</h2>
            
            <div class="table-responsive">
                <table class="table table-hover table-bordered"> <thead>
                        <tr>
                            <th>ID</th>
                            <th>Client Name</th>
                            <th>Services</th>
                            <th>Appointment</th>
                            <th>State</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listA}" var="app">
                            <tr>
                                <td>#${app.id}</td>
                                <td class="fw-bold">${app.customerName}</td>
                                <td><span class="badge bg-info text-dark">${app.serviceName}</span></td>
                                <td>${app.bookingDate}</td>
                                <td>
                                    <span class="status-badge ${app.status == 'Pending' ? 'status-Pending' : 'status-Approved'}">
                                        ${app.status}
                                    </span>
                                </td>
                                <td>
                                    <a href="prescribe.jsp?id=${app.id}" class="btn btn-primary btn-sm shadow-sm">
                                        <i class="fa-solid fa-prescription"></i> Prescription
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <c:if test="${empty listA}">
                <div class="alert alert-warning text-center">There is no appointment yet.</div>
            </c:if>
        </div>
    </div>

</body>
</html>
