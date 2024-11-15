package com.POS.POS.service;

import com.POS.POS.entity.ItemAddOn;
import com.POS.POS.repository.ItemAddOnRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ItemAddOnService {
    @Autowired
    private ItemAddOnRepository itemAddOnRepository;

    @Transactional
    public ItemAddOn save(ItemAddOn itemAddOn) {
        return itemAddOnRepository.save(itemAddOn);
    }

    @Transactional
    public List<ItemAddOn> saveAll(List<ItemAddOn> itemAddOns) {
        return itemAddOnRepository.saveAll(itemAddOns);
    }

    public Optional<ItemAddOn> findById(int id) {
        return itemAddOnRepository.findById(id);
    }

    public List<ItemAddOn> findAll() {
        return itemAddOnRepository.findAll();
    }

    public Page<ItemAddOn> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return itemAddOnRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        itemAddOnRepository.deleteById(id);
    }

    @Transactional
    public ItemAddOn update(ItemAddOn itemAddOn) {
        return itemAddOnRepository.save(itemAddOn);
    }
}
