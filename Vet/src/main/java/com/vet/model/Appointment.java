package com.vet.model;

public class Appointment {
    private int id;
    private int userId;
    private String customerName;
    private String serviceName;
    private String bookingDate; 
    private String bookingTime;
    private String petName;
    private String note;
    private String status;

    public Appointment() {
    }

    public Appointment(int id, int userId, String customerName, String serviceName, String bookingDate, String bookingTime, String petName, String note, String status) {
        this.id = id;
        this.userId = userId;
        this.customerName = customerName;
        this.serviceName = serviceName;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.petName = petName;
        this.note = note;
        this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public String getServiceName() { return serviceName; }
    public void setServiceName(String serviceName) { this.serviceName = serviceName; }
    public String getBookingDate() { return bookingDate; }
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }
    public String getBookingTime() { return bookingTime; }
    public void setBookingTime(String bookingTime) { this.bookingTime = bookingTime; }
    public String getPetName() { return petName; }
    public void setPetName(String petName) { this.petName = petName; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}