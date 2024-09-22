package com.POS.POS.service;

import com.POS.POS.entity.Industry;
import com.POS.POS.repository.IndustryRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class IndustryService {
    @Autowired
    private IndustryRepository industryRepository;

    @Transactional
    public Industry save(Industry industry) {
        return industryRepository.save(industry);
    }

    @Transactional
    public List<Industry> saveAll(List<Industry> industries) {
        return industryRepository.saveAll(industries);
    }

    public Optional<Industry> findById(int id) {
        return industryRepository.findById(id);
    }

    public List<Industry> findAll() {
        return industryRepository.findAll();
    }

    public Page<Industry> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return industryRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        industryRepository.deleteById(id);
    }

    @Transactional
    public Industry update(Industry industry) {
        return industryRepository.save(industry);
    }
}
