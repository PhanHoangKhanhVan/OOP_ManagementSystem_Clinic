<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Kê đơn thuốc</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        .form-container { max-width: 500px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; }
        textarea { width: 100%; height: 100px; margin-bottom: 10px; }
        button { background-color: blue; color: white; padding: 10px 20px; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Phiếu Kê Đơn Thuốc</h2>
        <h3>Mã lịch hẹn: ${param.id}</h3> <form action="${pageContext.request.contextPath}/doctor/prescribe" method="post">
            <input type="hidden" name="app_id" value="${param.id}">
            
            <label>Chẩn đoán bệnh:</label><br>
            <textarea name="diagnosis" required></textarea><br>
            
            <label>Thuốc & Liều lượng:</label><br>
            <textarea name="medicine" required></textarea><br>
            
            <button type="submit">Lưu đơn thuốc</button>
        </form>
        <br>
        <a href="schedule">Quay lại danh sách</a>
    </div>
</body>
</html>