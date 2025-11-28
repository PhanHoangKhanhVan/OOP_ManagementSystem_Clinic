<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Booking table - Vet System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        .calendar-table { width: 100%; border-collapse: collapse; margin-top: 20px; text-align: center; table-layout: fixed; }
        .calendar-table th { background-color: #f8f9fa; padding: 15px; border: 1px solid #dee2e6; width: 14.28%; font-weight: bold; color: #495057; }
        .calendar-table td { border: 1px solid #dee2e6; padding: 0; height: 60px; vertical-align: middle; }
        
        /* Ô trống (Available) */
        .available-slot { display: block; width: 100%; height: 100%; background-color: #fff; text-decoration: none; transition: 0.2s; }
        .available-slot:hover { background-color: #d4edda; cursor: pointer; }
        
        /* Ô đã đặt (Taken) - Màu đỏ nhạt */
        .not-available { background-color: #f8d7da; pointer-events: none; }
        
        /* Style cho ô chú thích */
        .legend-box { width: 20px; height: 20px; display: inline-block; border: 1px solid #ccc; margin-right: 5px; vertical-align: middle; }
        .legend-red { background-color: #f8d7da; }
        .legend-white { background-color: #fff; }
    </style>
</head>
<body class="bg-light">

    <jsp:include page="../../components/navbar.jsp" />

    <div class="container pb-5">
        <div class="card shadow-sm border-0 mt-4">
            <div class="card-body p-4">
                <h2 class="text-center mb-2 fw-bold text-dark">Time table</h2>
                <p class="text-center text-muted">Please chose the booking time</p>

                <div class="table-responsive">
                    <table class="calendar-table">
                        <thead>
                            <tr>
                                <th>Time</th><th>Mon</th><th>Tues</th><th>Wed</th><th>Thurs</th><th>Fri</th><th>Sat</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="fw-bold bg-light">8:00 AM</td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=8:00 AM&date=Mon" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=8:00 AM&date=Tue" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=8:00 AM&date=Wed" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=8:00 AM&date=Thu" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=8:00 AM&date=Fri" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=8:00 AM&date=Sat" class="available-slot"></a></td>
                            </tr>
                            
                            <tr>
                                <td class="fw-bold bg-light">9:00 AM</td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=9:00 AM&date=Mon" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=9:00 AM&date=Tue" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=9:00 AM&date=Wed" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=9:00 AM&date=Thu" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=9:00 AM&date=Fri" class="available-slot"></a></td>
                                <td class="not-available"></td> 
                            </tr>

                            <tr>
                                <td class="fw-bold bg-light">10:00 AM</td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=10:00 AM&date=Mon" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=10:00 AM&date=Tue" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=10:00 AM&date=Wed" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=10:00 AM&date=Thu" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=10:00 AM&date=Fri" class="available-slot"></a></td>
                                <td><a href="${pageContext.request.contextPath}/views/client/booking-form.jsp?time=10:00 AM&date=Sat" class="available-slot"></a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="mt-4 d-flex gap-4 justify-content-center align-items-center">
                    
                    <div class="d-flex align-items-center">
                        <span class="legend-box legend-white"></span> 
                        <span class="ms-2">Available</span>
                    </div>

                    <div class="d-flex align-items-center">
                        <span class="legend-box legend-red"></span> 
                        <span class="ms-2">Taken</span>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

</body>
</html>