<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Login - The Simpson Clinic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body { background: linear-gradient(135deg, #48c6ef 0%, #6f86d6 100%); height: 100vh; display: flex; align-items: center; justify-content: center; }
        .login-card { background: white; border-radius: 15px; padding: 40px; width: 100%; max-width: 400px; box-shadow: 0 10px 25px rgba(0,0,0,0.2); }
        .btn-primary { background-color: #26c6da; border: none; padding: 12px; font-weight: bold; }
        .btn-primary:hover { background-color: #00acc1; }
        .form-control:focus { box-shadow: none; border-color: #26c6da; }
    </style>
</head>
<body>
    <div class="login-card">
        <h2 class="text-center fw-bold mb-4 text-dark">Welcome Back!</h2>
        
        <c:if test="${not empty mess}">
            <div class="alert alert-danger text-center p-2 small">
                ${mess}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            
            <div class="mb-3">
                <label class="form-label fw-bold text-secondary">Username</label>
                <input type="text" name="user" class="form-control" placeholder="Enter your username" required>
            </div>
            
            <div class="mb-4">
                <label class="form-label fw-bold text-secondary">Password</label>
                <input type="password" name="pass" class="form-control" placeholder="Enter your password" required>
            </div>
            
            <div class="d-grid">
                <button type="submit" class="btn btn-primary text-white rounded-pill">Login</button>
            </div>
        </form>

        <div class="text-center mt-3">
            <small>Do not have an Account? 
                <a href="${pageContext.request.contextPath}/register" class="fw-bold text-info text-decoration-none">Sign up here</a>
            </small>
        </div>
        
        <div class="text-center mt-2">
            <a href="${pageContext.request.contextPath}/index.jsp" class="text-secondary text-decoration-none small">
                <i class="fa-solid fa-arrow-left"></i> Back to Home
            </a>
        </div>
    </div>
</body>
</html>