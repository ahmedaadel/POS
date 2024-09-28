package com.POS.POS.service;

import com.POS.POS.entity.Addition;
import com.POS.POS.repository.AdditionsRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AdditionsService {
    @Autowired
    private AdditionsRepository additionsRepository;

    @Transactional
    public Addition save(Addition addition) {
        return additionsRepository.save(addition);
    }

    @Transactional
    public List<Addition> saveAll(List<Addition> additions) {
        return additionsRepository.saveAll(additions);
    }

    public Optional<Addition> findById(int id) {
        return additionsRepository.findById(id);
    }

    public List<Addition> findAll() {
        return additionsRepository.findAll();
    }

    public Page<Addition> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return additionsRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        additionsRepository.deleteById(id);
    }

    @Transactional
    public Addition update(Addition addition) {
        return additionsRepository.save(addition);
    }
}
