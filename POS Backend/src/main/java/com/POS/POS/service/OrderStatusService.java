package com.POS.POS.services;
import com.POS.POS.repository.OrderStatusRepository;
import com.POS.POS.entity.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderStatusService {

    @Autowired
    private OrderStatusRepository orderStatusRepository;

    // Create a new OrderStatus
    public OrderStatus createOrderStatus(OrderStatus orderStatus) {
        return orderStatusRepository.save(orderStatus);
    }

    // Get all OrderStatuses
    public List<OrderStatus> getAllOrderStatuses() {
        return orderStatusRepository.findAll();
    }

    // Get an OrderStatus by ID
    public Optional<OrderStatus> getOrderStatusById(Integer id) {
        return orderStatusRepository.findById(id);
    }

    // Update an OrderStatus
    public OrderStatus updateOrderStatus(Integer id, OrderStatus orderStatus) {
        if (orderStatusRepository.existsById(id)) {
            orderStatus.setId(id);
            return orderStatusRepository.save(orderStatus);
        }
        return null;
    }

    // Delete an OrderStatus
    public void deleteOrderStatus(Integer id) {
        orderStatusRepository.deleteById(id);
    }
}
