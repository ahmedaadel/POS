package com.POS.POS.service;

import com.POS.POS.entity.Size;
import com.POS.POS.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SizeService {
    @Autowired
    private SizeRepository sizeRepository;

    @Transactional
    public Size save(Size size) {
        return sizeRepository.save(size);
    }

    @Transactional
    public List<Size> saveAll(List<Size> sizes) {
        return sizeRepository.saveAll(sizes);
    }

    public List<Size> findAll() {
        return sizeRepository.findAll();
    }

    public Page<Size> findAll(Pageable pageable) {
        return sizeRepository.findAll(pageable);
    }

    public Size findById(Integer id) {
        return sizeRepository.findById(id).orElse(null);
    }

    @Transactional
    public Size update(Integer id, Size size) {
        if (!sizeRepository.existsById(id)) {
            throw new RuntimeException("Size not found");
        }
        size.setId(id);
        return sizeRepository.save(size);
    }

    @Transactional
    public void delete(Integer id) {
        if (!sizeRepository.existsById(id)) {
            throw new RuntimeException("Size not found");
        }
        sizeRepository.deleteById(id);
    }
}
