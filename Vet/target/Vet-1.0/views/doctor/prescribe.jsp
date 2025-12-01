<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Doctor Prescribe</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        .form-container { max-width: 500px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; }
        textarea { width: 100%; height: 100px; margin-bottom: 10px; }
        button { background-color: blue; color: white; padding: 10px 20px; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Prescription Form</h2>
        <h3>Appointment ID: ${param.id}</h3> 
        
        <form action="${pageContext.request.contextPath}/doctor/prescribe" method="post">
            <input type="hidden" name="app_id" value="${param.id}">
            
            <label>Diagnosis:</label><br>
            <textarea name="diagnosis" required placeholder="Enter diagnosis details..."></textarea><br>
            
            <label>Medication & Dosage:</label><br>
            <textarea name="medicine" required placeholder="Enter medicine name and dosage..."></textarea><br>
            
            <button type="submit">Save Prescription</button>
        </form>
        <br>
        <a href="${pageContext.request.contextPath}/doctor/schedule">Back to List</a>
    </div>
</body>
</html>