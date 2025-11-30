<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<nav class="navbar navbar-expand-lg navbar-dark bg-info shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.jsp">
            <i class="fa-solid fa-paw"></i> The Simpson Clinic
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                
                <li class="nav-item">
                    <a class="nav-link fw-bold text-white" href="${pageContext.request.contextPath}/intro">Introduction</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold text-white" href="${pageContext.request.contextPath}/services">Services</a>
                </li>
                
                <c:if test="${sessionScope.acc.role == 'CLIENT'}">
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-white" href="${pageContext.request.contextPath}/client/booking">Booking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-white" href="${pageContext.request.contextPath}/client/history">History</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-white" href="${pageContext.request.contextPath}/profile">Profile</a>
                    </li>
                </c:if>
                
                <c:if test="${sessionScope.acc.role == 'DOCTOR'}">
                     <li class="nav-item">
                        <a class="nav-link fw-bold text-white" href="${pageContext.request.contextPath}/doctor/schedule">Doctor Schedule</a>
                    </li>
                </c:if>

                <li class="nav-item ms-3">
                    <c:if test="${sessionScope.acc != null}">
                        <span class="text-white me-2 small">Hi, ${sessionScope.acc.fullName}</span>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-light text-info btn-sm fw-bold rounded-pill">
                            <i class="fa-solid fa-right-from-bracket"></i> Logout
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.acc == null}">
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-light text-info btn-sm fw-bold rounded-pill">
                            <i class="fa-solid fa-user"></i> Login
                        </a>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>