<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f0f2f5; }
        .form-container { max-width: 600px; margin: 50px auto; padding: 30px; background-color: #fff; border-radius: 12px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); }
        .time-box { background: #e7f1ff; color: #0d6efd; padding: 10px; border-radius: 8px; text-align: center; margin-bottom: 20px; font-weight: bold; border: 1px solid #cff4fc; }
    </style>
</head>
<body>

    <div class="container">
        <div class="form-container">
            <h3 class="text-center mb-4 fw-bold text-primary">Appointment</h3>
            
            <div class="time-box">
                <i class="fa-regular fa-clock"></i> 
                Time: ${param.time} - Date: ${param.date}
            </div>
            
            <form action="${pageContext.request.contextPath}/client/booking" method="post">
                <input type="hidden" name="time" value="${param.time}">
                <input type="hidden" name="date" value="${param.date}">
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Client name:</label>
                    <input type="text" class="form-control" value="${sessionScope.acc.fullName}" disabled>
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Pet:</label>
                    <input type="text" name="petName" class="form-control" placeholder="Nhập tên chó/mèo..." required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Services:</label>
                    <select name="service" class="form-select" required>
                        <option value="Tiêm vaccine">Vaccination</option>
                        <option value="Spa - Cắt tỉa">Medical Check-up</option>
                    </select>
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Note:</label>
                    <textarea name="note" class="form-control" rows="3" placeholder="(symptom)"></textarea>
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg">Confirm</button>
                    <a href="booking.jsp" class="btn btn-outline-secondary">Back</a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>