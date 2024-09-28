package com.POS.POS.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "credit_debit")
public class CreditDebit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "amount", nullable = false)
    private float amount;

    @Column(name = "type", nullable = false)
    private int type; // Foreign key for credit_type

    @Column(name = "description")
    private String description;

    @Column(name = "shift_id", nullable = false)
    private int shiftId; // Foreign key for shift

    @Column(name = "client_id", nullable = false)
    private int clientId; // Foreign key for client

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getShiftId() {
        return shiftId;
    }

    public void setShiftId(int shiftId) {
        this.shiftId = shiftId;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }
}
