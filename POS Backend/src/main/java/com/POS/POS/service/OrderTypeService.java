package com.POS.POS.service;

import com.POS.POS.entity.OrderType;
import com.POS.POS.repository.OrderTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderTypeService {
    @Autowired
    private OrderTypeRepository orderTypeRepository;

    @Transactional
    public OrderType save(OrderType orderType) {
        return orderTypeRepository.save(orderType);
    }

    @Transactional
    public List<OrderType> saveAll(List<OrderType> orderTypes) {
        return orderTypeRepository.saveAll(orderTypes);
    }

    public List<OrderType> findAll() {
        return orderTypeRepository.findAll();
    }

    public Page<OrderType> findAll(Pageable pageable) {
        return orderTypeRepository.findAll(pageable);
    }

    public OrderType findById(Integer id) {
        return orderTypeRepository.findById(id).orElse(null);
    }

    @Transactional
    public OrderType update(Integer id, OrderType orderType) {
        if (!orderTypeRepository.existsById(id)) {
            throw new RuntimeException("OrderType not found");
        }
        orderType.setId(id);
        return orderTypeRepository.save(orderType);
    }

    @Transactional
    public void delete(Integer id) {
        if (!orderTypeRepository.existsById(id)) {
            throw new RuntimeException("OrderType not found");
        }
        orderTypeRepository.deleteById(id);
    }
}
