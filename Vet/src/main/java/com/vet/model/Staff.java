package com.vet.model;
import java.util.Date;

public class Staff extends Employee {
    private String jobTitle;

    public Staff() {
    }

    // Constructor khớp với UserDAO
    public Staff(int id, String fullName, String phone, String email, String username, String password, double salary, Date hireDate, String jobTitle) {
        super(id, fullName, phone, email, username, password, "STAFF", salary, hireDate);
        this.jobTitle = jobTitle;
    }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }
}