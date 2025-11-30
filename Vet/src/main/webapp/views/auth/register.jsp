<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Register - The Simpson Clinic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #48c6ef 0%, #6f86d6 100%); height: 100vh; display: flex; align-items: center; justify-content: center; }
        .register-card { background: white; border-radius: 15px; padding: 30px; width: 100%; max-width: 450px; box-shadow: 0 10px 25px rgba(0,0,0,0.2); }
        .btn-info { background-color: #26c6da; border: none; color: white; }
        .btn-info:hover { background-color: #00acc1; color: white;}
    </style>
</head>
<body>
    <div class="register-card">
        <h2 class="text-center fw-bold mb-3 text-dark">Create Account</h2>
        
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="mb-2">
                <label class="form-label small fw-bold">Full Name</label>
                <input type="text" name="fullName" class="form-control" required>
            </div>
            <div class="mb-2">
                <label class="form-label small fw-bold">Phone Number</label>
                <input type="tel" name="phone" class="form-control" pattern="[0-9]{10}" title="Please enter 10 digits" required>
            </div>
            <div class="mb-2">
                <label class="form-label small fw-bold">Username</label>
                <input type="text" name="user" class="form-control" required>
            </div>
            <div class="mb-2">
                <label class="form-label small fw-bold">Password</label>
                <input type="password" name="pass" class="form-control" required>
            </div>
            
            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-info rounded-pill fw-bold">Sign up</button>
            </div>
        </form>
        
        <div class="text-center mt-3">
            <small>Already registered? <a href="login.jsp" class="fw-bold text-primary text-decoration-none">Log in here</a></small>
        </div>
    </div>
</body>
</html>