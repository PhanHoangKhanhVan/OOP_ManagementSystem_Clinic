<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="activePage" value="booking" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Booking - Select Time</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* choose appointment */
        .calendar-table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px; 
            text-align: center;
            table-layout: fixed; 
        }
        .calendar-table th { 
            background-color: #f2f2f2; 
            padding: 15px; 
            border: 1px solid #ddd;
            width: 14.28%; 
        }
        .calendar-table td { 
            border: 1px solid #ddd; 
            padding: 0; 
            height: 60px; 
            vertical-align: middle; 
        }
        
        .not-available { 
            background-color: #fde0e0; 
            pointer-events: none; 
        }
        
        .available-slot {
            display: block; width: 100%; height: 100%;
            background-color: #fff;
            text-decoration: none;
            transition: 0.2s;
        }
        .available-slot:hover { 
            background-color: #e0fde0; 
            cursor: pointer; 
        }

        /* note */
        .legend-box {
            width: 20px; height: 20px;
            display: inline-block;
            border: 1px solid #ccc;
            margin-right: 5px;
            vertical-align: middle;
        }
        .legend-red { background-color: #fde0e0; }
        .legend-white { background-color: #fff; }
    </style>
</head>
<body>

    <jsp:include page="../../components/navbar.jsp" />

    <div class="container mt-5 pb-5">
        <h2 class="text-center mb-4 fw-bold text-dark">Booking Schedule</h2>
        <p class="text-center text-muted">Please select an available time slot</p>

        <div class="table-responsive">
            <table class="calendar-table">
                <thead>
                    <tr>
                        <th>Time</th><th>Mon</th><th>Tues</th><th>Wed</th><th>Thurs</th><th>Fri</th><th>Sat</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="fw-bold bg-light">8 AM</td>
                        <td><a href="booking-form.jsp?time=8AM&date=Mon" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=8AM&date=Tue" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=8AM&date=Wed" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=8AM&date=Thu" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=8AM&date=Fri" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=8AM&date=Sat" class="available-slot"></a></td>
                    </tr>
                    
                    <tr>
                        <td class="fw-bold bg-light">9 AM</td>
                        <td><a href="booking-form.jsp?time=9AM&date=Mon" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=9AM&date=Tue" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=9AM&date=Wed" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=9AM&date=Thu" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=9AM&date=Fri" class="available-slot"></a></td>
                        <td class="not-available"></td> </tr>
                    
                    <tr>
                        <td class="fw-bold bg-light">10 AM</td>
                        <td><a href="booking-form.jsp?time=10AM&date=Mon" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=10AM&date=Tue" class="available-slot"></a></td>
                        <td class="not-available"></td>
                        <td><a href="booking-form.jsp?time=10AM&date=Thu" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=10AM&date=Fri" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=10AM&date=Sat" class="available-slot"></a></td>
                    </tr>
                    
                    <tr>
                        <td class="fw-bold bg-light">1 PM</td>
                        <td><a href="booking-form.jsp?time=1PM&date=Mon" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=1PM&date=Tue" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=1PM&date=Wed" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=1PM&date=Thu" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=1PM&date=Fri" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=1PM&date=Sat" class="available-slot"></a></td>
                    </tr>

                    <tr>
                        <td class="fw-bold bg-light">2 PM</td>
                        <td class="not-available"></td>
                        <td><a href="booking-form.jsp?time=2PM&date=Tue" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=2PM&date=Wed" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=2PM&date=Thu" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=2PM&date=Fri" class="available-slot"></a></td>
                        <td><a href="booking-form.jsp?time=2PM&date=Sat" class="available-slot"></a></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="mt-4 d-flex gap-4 justify-content-center align-items-center">
            <div class="d-flex align-items-center">
                <span class="legend-box legend-red"></span>
                <span>Not Available</span>
            </div>
            <div class="d-flex align-items-center">
                <span class="legend-box legend-white"></span>
                <span>Available</span>
            </div>
        </div>

    </div>

</body>
</html>