package com.vet.model;

public abstract class Employee extends Person {
    private double salary;
    // private Date hireDate; // Có thể thêm nếu muốn

    public Employee() {
    }

    public double getSalary() { return salary; }
    public void setSalary(double salary) { this.salary = salary; }
}