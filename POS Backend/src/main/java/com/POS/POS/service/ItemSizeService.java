package com.POS.POS.service;

import com.POS.POS.entity.ItemSize;
import com.POS.POS.repository.ItemSizeRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ItemSizeService {
    @Autowired
    private ItemSizeRepository itemSizeRepository;

    @Transactional
    public ItemSize save(ItemSize itemSize) {
        return itemSizeRepository.save(itemSize);
    }

    @Transactional
    public List<ItemSize> saveAll(List<ItemSize> itemSizes) {
        return itemSizeRepository.saveAll(itemSizes);
    }

    public Optional<ItemSize> findById(int id) {
        return itemSizeRepository.findById(id);
    }

    public List<ItemSize> findAll() {
        return itemSizeRepository.findAll();
    }

    public Page<ItemSize> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return itemSizeRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        itemSizeRepository.deleteById(id);
    }

    @Transactional
    public ItemSize update(ItemSize itemSize) {
        return itemSizeRepository.save(itemSize);
    }
}
