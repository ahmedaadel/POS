package com.POS.POS.services;

import com.POS.POS.repository.OrderTypeRepository;
import com.POS.POS.entity.OrderType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderTypeService {

    @Autowired
    private OrderTypeRepository orderTypeRepository;

    // Create a new OrderType
    public OrderType createOrderType(OrderType orderType) {
        return orderTypeRepository.save(orderType);
    }

    // Get all OrderTypes
    public List<OrderType> getAllOrderTypes() {
        return orderTypeRepository.findAll();
    }

    // Get an OrderType by ID
    public Optional<OrderType> getOrderTypeById(Integer id) {
        return orderTypeRepository.findById(id);
    }

    // Update an OrderType
    public OrderType updateOrderType(Integer id, OrderType orderType) {
        if (orderTypeRepository.existsById(id)) {
            orderType.setId(id);
            return orderTypeRepository.save(orderType);
        }
        return null;
    }

    // Delete an OrderType
    public void deleteOrderType(Integer id) {
        orderTypeRepository.deleteById(id);
    }
}

