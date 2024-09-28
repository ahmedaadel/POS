package com.POS.POS.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "contact_info")
public class ContactInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "phone_number", length = 255, nullable = false)
    private String phoneNumber;

    @Column(name = "additional_number", length = 255)
    private String additionalNumber;

    @Column(name = "address", length = 255)
    private String address;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAdditionalNumber() {
        return additionalNumber;
    }

    public void setAdditionalNumber(String additionalNumber) {
        this.additionalNumber = additionalNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
