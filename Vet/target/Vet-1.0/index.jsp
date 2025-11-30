<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - The Simpson Clinic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body { 
            display: flex; 
            flex-direction: column; 
            min-height: 100vh; 
            background-color: #f8f9fa; 
        }
        main { flex: 1; }
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
<body class="bg-light d-flex flex-column min-vh-100">

    <jsp:include page="components/navbar.jsp" />

    <main>
        <div class="hero-section text-center">
            <div class="container">
                <h1 class="display-4 fw-bold" style="color: #006064;">Welcome to The Simpson Clinic</h1>
                <p class="lead text-secondary">Premium Veterinary Health Care System</p>
                
                <c:if test="${sessionScope.acc == null}">
                    <div class="mt-4">
                        <a href="views/auth/login.jsp" class="btn btn-info text-white btn-lg rounded-pill px-5 shadow-sm fw-bold">Login Now</a>
                        <a href="views/auth/register.jsp" class="btn btn-outline-info btn-lg rounded-pill px-5 ms-2 fw-bold">Register</a>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="container pb-5">
            
            <c:if test="${sessionScope.acc.role == 'CLIENT'}">
                <div class="row g-4 justify-content-center">
                    
                    <div class="col-md-5 d-flex align-items-stretch"> 
                        <div class="card feature-card p-4 text-center w-100 h-100 d-flex flex-column"> 
                            <div class="icon-circle">
                                <i class="fa-solid fa-calendar-plus"></i>
                            </div>
                            <h3 class="card-title fw-bold text-dark">Book Appointment</h3>
                            <p class="text-muted flex-grow-1">Choose the service, doctor, and time slot that best suits your pet.</p>
                            
                            <div class="mt-3">
                                <a href="${pageContext.request.contextPath}/client/booking" class="btn btn-info text-white rounded-pill px-4 fw-bold w-100">Book Now</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5 d-flex align-items-stretch">
                        <div class="card feature-card p-4 text-center w-100 h-100 d-flex flex-column">
                            <div class="icon-circle" style="background-color: #e8f5e9; color: #2e7d32;">
                                <i class="fa-solid fa-clock-rotate-left"></i>
                            </div>
                            <h3 class="card-title fw-bold text-dark">Medical Records</h3>
                            <p class="text-muted flex-grow-1">Review medical history, prescriptions, and doctor's instructions.</p>
                            
                            <div class="mt-3">
                                <a href="${pageContext.request.contextPath}/client/history" class="btn btn-success rounded-pill px-4 fw-bold w-100">View Records</a>
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
                            <h2 class="fw-bold text-dark">Doctor Dashboard</h2>
                            <p class="lead text-muted">Welcome Dr <b>${sessionScope.acc.fullName}</b> Have a productive day!</p>
                            <hr>
                            <div class="d-flex justify-content-center gap-3 mt-4">
                                <a href="${pageContext.request.contextPath}/doctor/schedule" class="btn btn-danger btn-lg rounded-pill px-5 shadow-sm">
                                    <i class="fa-solid fa-clipboard-list me-2"></i> View Schedule
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

        </div>
    </main>

    <footer class="text-center mt-auto py-4 text-secondary border-top bg-white">
        <small>&copy; 2025 The Simpson Clinic</small>
    </footer>

</body>
</html>