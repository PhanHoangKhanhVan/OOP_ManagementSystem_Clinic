package com.vet.model;

import java.sql.Date; // Lưu ý import sql.Date

public class Appointment {
    private int id;
    private int userId;         // ID khách hàng
    private String customerName; // Tên khách hàng (để hiển thị cho dễ)
    private String serviceName; // Tên dịch vụ (Khám, tiêm...)
    private Date bookingDate;   // Ngày đặt
    private String status;      // Pending, Approved...

    public Appointment() {
    }

    public Appointment(int id, int userId, String customerName, String serviceName, Date bookingDate, String status) {
        this.id = id;
        this.userId = userId;
        this.customerName = customerName;
        this.serviceName = serviceName;
        this.bookingDate = bookingDate;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getServiceName() { return serviceName; }
    public void setServiceName(String serviceName) { this.serviceName = serviceName; }

    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}