package com.vet.model;

public class Doctor extends Employee {
    private String specialization;

    public Doctor() {
    }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
}