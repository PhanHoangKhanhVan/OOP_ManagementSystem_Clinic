package com.vet.model;
import java.util.Date;

public abstract class Employee extends Person {
    protected double salary;
    protected Date hireDate;

    public Employee() {
    }

    public Employee(int id, String fullName, String phone, String email, String username, String password, String role, double salary, Date hireDate) {
        super(id, fullName, phone, email, username, password, role);
        this.salary = salary;
        this.hireDate = hireDate;
    }

    public double getSalary() { return salary; }
    public void setSalary(double salary) { this.salary = salary; }
    public Date getHireDate() { return hireDate; }
    public void setHireDate(Date hireDate) { this.hireDate = hireDate; }
}