<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Prescribtion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { background-color: #e0f7fa; padding: 40px 0; }
        .form-container {
            background: white;
            max-width: 600px; 
            margin: 0 auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            border-top: 5px solid #26c6da;
        }
        textarea { resize: none; height: 120px !important; } 
    </style>
</head>
<body>

    <div class="container">
        <div class="form-container">
            <div class="text-center mb-4">
                <h2 class="fw-bold" style="color: #2c3e50;">Prescription Form</h2>
                <p class="text-muted">Appointment ID: <span class="badge bg-secondary">#${param.id}</span></p>
            </div>

            <form action="${pageContext.request.contextPath}/doctor/prescribe" method="post">
                <input type="hidden" name="app_id" value="${param.id}">
                
                <div class="mb-3">
                    <label class="form-label fw-bold"><i class="fa-solid fa-stethoscope"></i> Diagnosis of disease:</label>
                    <textarea name="diagnosis" class="form-control" placeholder="Enter doctor's diagnosis..." required></textarea>
                </div>
                
                <div class="mb-4">
                    <label class="form-label fw-bold"><i class="fa-solid fa-pills"></i> Medication & Dosage:</label> <textarea name="medicine" class="form-control" placeholder="Enter the drug name and how to use it..." required></textarea>
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg" style="background-color: #26c6da; border: none;"> <i class="fa-solid fa-save"></i> Save prescription
                    </button>
                    <a href="schedule.jsp" class="btn btn-light text-secondary">Back to the list</a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
