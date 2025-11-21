<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="activePage" value="intro" />
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Introduction - Simpson Clinic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

    <jsp:include page="../../components/navbar.jsp" /> 

    <div class="container mt-5 pb-5">
        <div class="row align-items-center">
            <div class="col-md-6">
                <img src="https://img.freepik.com/free-vector/veterinary-clinic-concept_23-2148533536.jpg" class="img-fluid rounded shadow" alt="Clinic">
            </div>
            <div class="col-md-6">
                <h1 class="display-5 fw-bold text-info">The Simpson Clinic</h1>
                <p class="lead mt-4 text-secondary">
                    Welcome to The Simpson Pet Clinic, where your pet's health is our top priority.
                </p>
                <p class="text-muted">
                    We are a full-service animal hospital offering everything from routine wellness exams to advanced surgical procedures. 
                    Our dedicated team is committed to providing the highest standard of care in a welcoming environment.
                </p>
                
                <div class="mt-4">
                     <a href="${pageContext.request.contextPath}/views/client/services.jsp" class="btn btn-info text-white rounded-pill px-4 me-2">View Services</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>