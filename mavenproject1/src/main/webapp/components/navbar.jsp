<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .navbar {
        background-color: white;
        border-bottom: 1px solid #eaeaea;
        padding: 15px 0;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    .navbar-brand {
        font-size: 1.6rem;
        font-weight: 800;
        color: #26c6da !important; 
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .nav-link {
        color: #555 !important;
        font-weight: 600;
        font-size: 1rem;
        margin-left: 20px;
        padding-bottom: 5px;
        border-bottom: 2px solid transparent;
        transition: all 0.3s ease;
    }
    /* taskbar scroll effect*/
    .nav-link:hover, .nav-link.active-link {
        color: #26c6da !important;
        border-bottom: 2px solid #26c6da;
        transform: translateY(-2px);
    }
    .btn-login-nav {
        border: 2px solid #26c6da;
        color: #26c6da;
        font-weight: bold;
        border-radius: 50px;
        padding: 5px 20px;
        transition: 0.3s;
    }
    .btn-login-nav:hover {
        background-color: #26c6da;
        color: white;
    }
</style>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
            <i class="fa-solid fa-paw"></i> Simpson Clinic
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav align-items-center">
                <li class="nav-item">
                    <a class="nav-link ${activePage == 'home' ? 'active-link' : ''}" 
                       href="${pageContext.request.contextPath}/index.jsp">Home</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link ${activePage == 'intro' ? 'active-link' : ''}" 
                       href="${pageContext.request.contextPath}/views/client/about.jsp">Introduction</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link ${activePage == 'services' ? 'active-link' : ''}" 
                       href="${pageContext.request.contextPath}/views/client/services.jsp">Services</a>
                </li>
                
                <c:if test="${sessionScope.acc != null}">
                     <li class="nav-item">
                         <a class="nav-link ${activePage == 'profile' ? 'active-link' : ''}" 
                            href="${pageContext.request.contextPath}/views/client/profile.jsp">Information</a>
                     </li>
                </c:if>

                <li class="nav-item">
                    <a class="nav-link ${activePage == 'booking' ? 'active-link' : ''}" 
                       href="${sessionScope.acc != null ? pageContext.request.contextPath.concat('/views/client/booking.jsp') : pageContext.request.contextPath.concat('/views/auth/login.jsp')}">
                        Booking
                    </a>
                </li>
                
                <c:if test="${sessionScope.acc == null}">
                     <li class="nav-item ms-3">
                         <a class="nav-link btn-login-nav" href="${pageContext.request.contextPath}/views/auth/login.jsp">Login/Sign up</a>
                     </li>
                </c:if>
                
                <c:if test="${sessionScope.acc != null}">
                     <li class="nav-item ms-3">
                         <a class="btn btn-danger btn-sm rounded-pill px-3" href="${pageContext.request.contextPath}/logout">
                            <i class="fa-solid fa-right-from-bracket"></i> Logout
                         </a>
                     </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>