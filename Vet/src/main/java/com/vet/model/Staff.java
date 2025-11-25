package com.vet.model;

public class Staff extends Employee {
    private String jobTitle;

    public Staff() {
    }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }
}