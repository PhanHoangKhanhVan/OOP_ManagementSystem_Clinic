<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="activePage" value="booking" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Confirm Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px; margin: 30px auto; padding: 30px;
            background-color: #fff; border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        label { font-weight: bold; color: #555; }
    </style>
</head>
<body>

    <jsp:include page="../../components/navbar.jsp" />

    <div class="container">
        <div class="form-container">
            <h2 class="text-center mb-3">Fill in appointment information</h2>
            <p class="text-center text-muted">
                Time selected: <strong>${param.time}</strong> - <strong>${param.date}</strong>
            </p>
            
            <form action="${pageContext.request.contextPath}/booking" method="post">
                <input type="hidden" name="selectedTime" value="${param.time}">
                <input type="hidden" name="selectedDate" value="${param.date}">
                
                <div class="mb-3">
                    <label class="form-label">Name:</label>
                    <input type="text" name="name" class="form-control" value="${sessionScope.acc.fullName}" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Pet:</label>
                    <input type="text" name="petName" class="form-control" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Choose service:</label>
                    <select name="service" class="form-select" required>
                        <option value="">-- Please choose --</option>
                        <option value="kham-suc-khoe">Medical check-up</option>
                        <option value="tiem-vaccine">Vaccination</option>
                    </select>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Phone number:</label>
                    <input type="text" name="phone" class="form-control" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Note:</label>
                    <textarea name="note" class="form-control" rows="4"></textarea>
                </div>
                
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg">Confirm</button>
                </div>
            </form>
            
            <div class="text-center mt-3">
                <a href="booking.jsp" class="text-secondary text-decoration-none">Back to Calendar</a>
            </div>
        </div>
    </div>

</body>
</html>