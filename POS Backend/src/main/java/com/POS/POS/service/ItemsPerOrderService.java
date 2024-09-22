package com.POS.POS.service;

import com.POS.POS.entity.ItemsPerOrder;
import com.POS.POS.repository.ItemsPerOrderRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ItemsPerOrderService {
    @Autowired
    private ItemsPerOrderRepository itemsPerOrderRepository;

    @Transactional
    public ItemsPerOrder save(ItemsPerOrder itemsPerOrder) {
        return itemsPerOrderRepository.save(itemsPerOrder);
    }

    @Transactional
    public List<ItemsPerOrder> saveAll(List<ItemsPerOrder> itemsPerOrders) {
        return itemsPerOrderRepository.saveAll(itemsPerOrders);
    }

    public Optional<ItemsPerOrder> findById(int id) {
        return itemsPerOrderRepository.findById(id);
    }

    public List<ItemsPerOrder> findAll() {
        return itemsPerOrderRepository.findAll();
    }

    public Page<ItemsPerOrder> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return itemsPerOrderRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        itemsPerOrderRepository.deleteById(id);
    }

    @Transactional
    public ItemsPerOrder update(ItemsPerOrder itemsPerOrder) {
        return itemsPerOrderRepository.save(itemsPerOrder);
    }
}
