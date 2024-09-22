package com.POS.POS.service;

import com.POS.POS.entity.Order;
import com.POS.POS.repository.OrderRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Transactional
    public Order save(Order order) {
        return orderRepository.save(order);
    }

    @Transactional
    public List<Order> saveAll(List<Order> orders) {
        return orderRepository.saveAll(orders);
    }

    public Optional<Order> findById(int id) {
        return orderRepository.findById(id);
    }

    public List<Order> findAll() {
        return orderRepository.findAll();
    }

    public Page<Order> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return orderRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        orderRepository.deleteById(id);
    }

    @Transactional
    public Order update(Order order) {
        return orderRepository.save(order);
    }
}
