<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="activePage" value="home" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Simpson Clinic - Home</title>
    <style>
        .hero-section {
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            padding: 100px 0;
            min-height: 85vh;
            display: flex;
            align-items: center;
            border-bottom-right-radius: 200px;
        }
        .hero-title {
            font-size: 4rem; font-weight: 800; color: #2c3e50; line-height: 1.1;
        }
        .btn-cta {
            background-color: #ef5350; color: white; padding: 15px 40px;
            border-radius: 50px; font-weight: bold; font-size: 1.2rem;
            text-decoration: none; box-shadow: 0 10px 20px rgba(239, 83, 80, 0.3);
            transition: 0.3s;
        }
        .btn-cta:hover { transform: translateY(-5px); background-color: #d32f2f; color: white; }
    </style>
</head>
<body>

    <jsp:include page="components/navbar.jsp" />

    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="hero-title">We love <br> <span style="color: #26c6da;">animals!</span></h1>
                    <p class="lead text-secondary mt-3 mb-5">
                        Let us take care of your pet. <br>
                        International standard pet care service.
                    </p>
                    
                    <a href="${sessionScope.acc != null ? 'views/client/booking.jsp' : 'views/auth/login.jsp'}" class="btn-cta">
                        Let's Start <i class="fa-solid fa-arrow-right ms-2"></i>
                    </a>
                </div>
                <div class="col-lg-6 text-center">
                    <img src="https://cdn-icons-png.flaticon.com/512/3048/3048122.png" 
                         alt="Vet Doctor" 
                         style="max-width: 80%; animation: float 3s ease-in-out infinite;">
                </div>
            </div>
        </div>
    </section>

    <style>
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
    </style>

</body>
</html>