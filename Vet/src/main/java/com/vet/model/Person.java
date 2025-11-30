package com.vet.model;

public abstract class Person {
    protected int id;
    protected String fullName;
    protected String phone;
    protected String email;
    protected String username;
    protected String password;
    protected String gender;
    protected Role role; 

    public Person() {
    }

    // Constructor 
    public Person(int id, String fullName, String phone, String email, String username, String password, String roleStr) {
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.username = username;
        this.password = password;
        
        // toUpperCase() để đảm bảo "Client" hay "client" đều hiểu là CLIENT
        try {
            this.role = Role.valueOf(roleStr.toUpperCase());
        } catch (IllegalArgumentException e) {
            this.role = Role.CLIENT;
            System.out.println("Wrong Role: " + roleStr);
        }
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender;}

    // Getter trả về Enum Role
    public Role getRole() { 
        return role; 
    }
    
    // String conver sang Enum
    public void setRole(String roleStr) { 
        this.role = Role.valueOf(roleStr.toUpperCase()); 
    }
    
    // Setter Enum
    public void setRole(Role role) {
        this.role = role;
    }

    public void setAddress(String address) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}