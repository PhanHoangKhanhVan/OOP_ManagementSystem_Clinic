package com.vet.model;

public class Customer extends Person {
    private String address;

    public Customer() {
    }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}