package com.POS.POS.service;

import com.POS.POS.entity.MenuItem;
import com.POS.POS.repository.MenuItemRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MenuItemService {
    @Autowired
    private MenuItemRepository menuItemRepository;

    @Transactional
    public MenuItem save(MenuItem menuItem) {
        return menuItemRepository.save(menuItem);
    }

    @Transactional
    public List<MenuItem> saveAll(List<MenuItem> menuItems) {
        return menuItemRepository.saveAll(menuItems);
    }

    public Optional<MenuItem> findById(int id) {
        return menuItemRepository.findById(id);
    }

    public List<MenuItem> findAll() {
        return menuItemRepository.findAll();
    }

    public Page<MenuItem> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return menuItemRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        menuItemRepository.deleteById(id);
    }

    @Transactional
    public MenuItem update(MenuItem menuItem) {
        return menuItemRepository.save(menuItem);
    }
}
