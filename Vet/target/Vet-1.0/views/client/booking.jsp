<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Đặt lịch khám bệnh</title>
    <style>
        body { font-family: Arial; background-color: #f4f4f4; display: flex; justify-content: center; padding-top: 50px; }
        .booking-form { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background: #0056b3; }
        .success { color: green; text-align: center; font-weight: bold; }
    </style>
</head>
<body>

    <div class="booking-form">
        <h2 style="text-align: center">Đặt Lịch Hẹn</h2>
        
        <p class="success">${mess}</p>

        <form action="${pageContext.request.contextPath}/client/booking" method="post">
            
            <label>Chọn dịch vụ:</label>
            <select name="service">
                <option value="Khám tổng quát">Khám tổng quát (100k)</option>
                <option value="Tiêm phòng dại">Tiêm phòng dại (200k)</option>
                <option value="Cấp cứu">Cấp cứu 24/7</option>
                <option value="Spa cắt tỉa">Spa cắt tỉa lông</option>
            </select>
            
            <label>Chọn ngày khám:</label>
            <input type="date" name="date" required>
            
            <button type="submit">Đặt lịch ngay</button>
        </form>
        
        <br>
        <div style="text-align: center">
            <a href="${pageContext.request.contextPath}/index.jsp">Quay về trang chủ</a>
        </div>
    </div>

</body>
</html>