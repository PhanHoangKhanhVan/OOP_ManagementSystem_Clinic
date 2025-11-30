<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="activePage" value="profile" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Information - User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .profile-header { background-color: #e0f7fa; padding: 40px 0; margin-bottom: 30px; border-radius: 0 0 50px 50px; }
    </style>
</head>
<body>

    <jsp:include page="../../components/navbar.jsp" />

    <div class="profile-header text-center">
        <div class="mb-3">
             <div class="bg-white rounded-circle d-inline-flex align-items-center justify-content-center shadow-sm" style="width: 100px; height: 100px;">
                 <i class="fa-solid fa-user fa-3x text-info"></i>
             </div>
        </div>
        <h2 class="fw-bold text-dark">Personal Information</h2>
        <p class="text-muted">Manage your profile and pet's info</p>
    </div>

    <div class="container pb-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow border-0 rounded-4">
                    <div class="card-body p-5">
                        <form action="${pageContext.request.contextPath}/updateProfile" method="post">
                            
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label fw-bold text-secondary">User Name:</label>
                                <div class="col-sm-9">
                                    <input type="text" readonly class="form-control-plaintext text-primary fw-bold" value="${sessionScope.acc.username}">
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label fw-bold text-secondary">Full Name:</label>
                                <div class="col-sm-9">
                                    <input type="text" name="fullname" class="form-control" value="${sessionScope.acc.fullName}">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label fw-bold text-secondary">Gender:</label>
                                <div class="col-sm-9">
                                    <select name="gender" class="form-select">
                                        <option value="Male" ${sessionScope.acc.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${sessionScope.acc.gender == 'Female' ? 'selected' : ''}>Female</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label fw-bold text-secondary">Address:</label>
                                <div class="col-sm-9">
                                    <input type="text" name="address" class="form-control" 
                                           value="${sessionScope.acc.role == 'CLIENT' ? sessionScope.acc.address : ''}">
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label fw-bold text-secondary">Pet Note:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="Enter the name and type...">
                                </div>
                            </div>

                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-info text-white px-5 rounded-pill fw-bold shadow-sm">Update Information</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>