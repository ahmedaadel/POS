package com.POS.POS.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "item_add_ons")
public class ItemAddOn {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private int additionId;
    @Column(nullable = false)
    private int itemsPerOrderId;
    @Column(nullable = false)
    private float additionsPrice;
    @Column(nullable = false)
    private int quantity;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdditionId() {
        return additionId;
    }

    public void setAdditionId(int additionId) {
        this.additionId = additionId;
    }

    public int getItemsPerOrderId() {
        return itemsPerOrderId;
    }

    public void setItemsPerOrderId(int itemsPerOrderId) {
        this.itemsPerOrderId = itemsPerOrderId;
    }

    public float getAdditionsPrice() {
        return additionsPrice;
    }

    public void setAdditionsPrice(float additionsPrice) {
        this.additionsPrice = additionsPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
