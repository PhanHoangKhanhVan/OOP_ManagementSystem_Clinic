package com.vet.model;
import java.util.Date;

public class Doctor extends Employee {
    private String specialization;

    public Doctor() {
    }

    // Constructor khớp với UserDAO
    public Doctor(int id, String fullName, String phone, String email, String username, String password, double salary, Date hireDate, String specialization) {
        super(id, fullName, phone, email, username, password, "DOCTOR", salary, hireDate);
        this.specialization = specialization;
    }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
}