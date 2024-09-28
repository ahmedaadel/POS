package com.POS.POS.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "subtotal_price", nullable = false)
    private float subtotalPrice = 0; // Default value

    @Column(name = "tax_price", nullable = false)
    private float taxPrice = 0; // Default value

    @Column(name = "total_price", nullable = false)
    private float totalPrice;

    @Column(name = "discount_price", nullable = false)
    private float discountPrice = 0; // Default value

    @Column(name = "service_fee", nullable = false)
    private float serviceFee = 0; // Default value

    @Column(name = "order_date", nullable = false)
    private Date orderDate = new Date(); // Default to current date

    @Column(name = "shift_id", nullable = false)
    private int shiftId;

    @Column(name = "order_status", nullable = false)
    private int orderStatus = 0; // Default value

    private String notes;

    @Column(name = "type", nullable = false)
    private int type;

    @Column(name = "delivery_info_id")
    private Integer deliveryInfoId; // Nullable

    @Column(name = "is_delivery_order", nullable = false)
    private boolean isDeliveryOrder;

    @Column(name = "cashier_id", nullable = false)
    private int cashierId;

    @Column(name = "client_id", nullable = false)
    private int clientId;
    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getSubtotalPrice() {
        return subtotalPrice;
    }

    public void setSubtotalPrice(float subtotalPrice) {
        this.subtotalPrice = subtotalPrice;
    }

    public float getTaxPrice() {
        return taxPrice;
    }

    public void setTaxPrice(float taxPrice) {
        this.taxPrice = taxPrice;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public float getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(float discountPrice) {
        this.discountPrice = discountPrice;
    }

    public float getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(float serviceFee) {
        this.serviceFee = serviceFee;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getShiftId() {
        return shiftId;
    }

    public void setShiftId(int shiftId) {
        this.shiftId = shiftId;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Integer getDeliveryInfoId() {
        return deliveryInfoId;
    }

    public void setDeliveryInfoId(Integer deliveryInfoId) {
        this.deliveryInfoId = deliveryInfoId;
    }

    public boolean isDeliveryOrder() {
        return isDeliveryOrder;
    }

    public void setDeliveryOrder(boolean deliveryOrder) {
        isDeliveryOrder = deliveryOrder;
    }

    public int getCashierId() {
        return cashierId;
    }

    public void setCashierId(int cashierId) {
        this.cashierId = cashierId;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }
}
