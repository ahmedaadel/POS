package com.POS.POS.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "shift")
public class Shift {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private java.sql.Date shiftDate;
    @Column(nullable = false)
    private java.sql.Time startHour;
    @Column(nullable = false)
    private java.sql.Time endHour;
    private int cashierId;
    @Column(nullable = false)
    private float balance;
    private int clientId;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public java.sql.Date getShiftDate() {
        return shiftDate;
    }

    public void setShiftDate(java.sql.Date shiftDate) {
        this.shiftDate = shiftDate;
    }

    public java.sql.Time getStartHour() {
        return startHour;
    }

    public void setStartHour(java.sql.Time startHour) {
        this.startHour = startHour;
    }

    public java.sql.Time getEndHour() {
        return endHour;
    }

    public void setEndHour(java.sql.Time endHour) {
        this.endHour = endHour;
    }

    public int getCashierId() {
        return cashierId;
    }

    public void setCashierId(int cashierId) {
        this.cashierId = cashierId;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }
}
