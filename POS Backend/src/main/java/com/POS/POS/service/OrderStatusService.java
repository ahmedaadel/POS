package com.POS.POS.service;

import com.POS.POS.entity.OrderStatus;
import com.POS.POS.repository.OrderStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderStatusService {
    @Autowired
    private OrderStatusRepository orderStatusRepository;

    @Transactional
    public OrderStatus save(OrderStatus orderStatus) {
        return orderStatusRepository.save(orderStatus);
    }

    @Transactional
    public List<OrderStatus> saveAll(List<OrderStatus> orderStatuses) {
        return orderStatusRepository.saveAll(orderStatuses);
    }

    public List<OrderStatus> findAll() {
        return orderStatusRepository.findAll();
    }

    public Page<OrderStatus> findAll(Pageable pageable) {
        return orderStatusRepository.findAll(pageable);
    }

    public OrderStatus findById(Integer id) {
        return orderStatusRepository.findById(id).orElse(null);
    }

    @Transactional
    public OrderStatus update(Integer id, OrderStatus orderStatus) {
        if (!orderStatusRepository.existsById(id)) {
            throw new RuntimeException("OrderStatus not found");
        }
        orderStatus.setId(id);
        return orderStatusRepository.save(orderStatus);
    }

    @Transactional
    public void delete(Integer id) {
        if (!orderStatusRepository.existsById(id)) {
            throw new RuntimeException("OrderStatus not found");
        }
        orderStatusRepository.deleteById(id);
    }
}
