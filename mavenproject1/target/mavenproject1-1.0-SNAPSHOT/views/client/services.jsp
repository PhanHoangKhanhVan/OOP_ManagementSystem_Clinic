<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="activePage" value="services" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Services - Simpson Clinic</title>
    <style>
        body { background-color: #f8f9fa; }
        .service-card {
            background: white;
            border-radius: 20px;
            padding: 40px 20px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            border: 1px solid #eee;
        }
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(38, 198, 218, 0.2);
            border-color: #26c6da;
        }
        .icon-box {
            width: 90px;
            height: 90px;
            background: #e0f7fa;
            color: #26c6da;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px auto;
            font-size: 2.5rem; 
        }
        h3 { color: #333; font-weight: bold; margin-bottom: 15px; }
        p { color: #666; }
    </style>
</head>
<body>

    <jsp:include page="../../components/navbar.jsp" />
    
    <div class="container py-5">
        <div class="text-center mb-5">
            <h2 class="display-5 fw-bold text-dark">Takes care of your pets, together</h2>
            <p class="lead text-secondary">High quality medical services dedicated to your pet</p>
        </div>

        <div class="row justify-content-center g-4">
            
            <div class="col-md-4">
                <div class="service-card">
                    <div class="icon-box">
                        <i class="fa-solid fa-stethoscope"></i>
                    </div>
                    <h3>Medical Check-up</h3>
                    <p>General health check-up, modern testing and diagnostic imaging.</p>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="service-card">
                    <div class="icon-box">
                        <i class="fa-solid fa-syringe"></i>
                    </div>
                    <h3>Vaccination</h3>
                    <p>Fully vaccinate your pet to protect it from disease.</p>
                </div>
            </div>
            
        </div>
    </div>

</body>
</html>