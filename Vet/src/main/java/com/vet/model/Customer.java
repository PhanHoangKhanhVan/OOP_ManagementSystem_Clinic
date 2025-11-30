package com.vet.model;

public class Customer extends Person {
    private String address;

    public Customer() {
    }

    // Constructor khớp với UserDAO
    public Customer(int id, String fullName, String phone, String email, String username, String password, String address) {
        super(id, fullName, phone, email, username, password, "CLIENT");
        this.address = address;
    }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}