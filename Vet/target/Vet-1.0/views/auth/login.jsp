<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng nhập hệ thống</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Tạo nền gradient đẹp mắt */
        body {
            background: linear-gradient(120deg, #2980b9, #8e44ad);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            border: none;
        }
        .btn-login {
            background-color: #2980b9;
            color: white;
            font-weight: bold;
            transition: all 0.3s;
        }
        .btn-login:hover {
            background-color: #2c3e50;
            transform: scale(1.02);
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-lg-4">
                <div class="card p-4">
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <div class="bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                                <i class="fa-solid fa-user-doctor fa-2x"></i>
                            </div>
                            <h3 class="mt-3 fw-bold text-secondary">Vet System</h3>
                            <p class="text-muted">Đăng nhập để tiếp tục</p>
                        </div>

                        <c:if test="${not empty mess}">
                            <div class="alert alert-danger d-flex align-items-center" role="alert">
                                <i class="fa-solid fa-circle-exclamation me-2"></i>
                                <div>${mess}</div>
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/login" method="post">
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold">Tài khoản</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="fa-solid fa-user"></i></span>
                                    <input type="text" name="user" class="form-control" placeholder="Nhập username..." required>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-bold">Mật khẩu</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="fa-solid fa-lock"></i></span>
                                    <input type="password" name="pass" class="form-control" placeholder="Nhập password..." required>
                                </div>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-login py-2">
                                    ĐĂNG NHẬP <i class="fa-solid fa-arrow-right-to-bracket ms-2"></i>
                                </button>
                            </div>
                            
                            <div class="text-center mt-3">
                                <a href="${pageContext.request.contextPath}/index.jsp" class="text-decoration-none text-muted small">
                                    <i class="fa-solid fa-house"></i> Quay về trang chủ
                                </a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
