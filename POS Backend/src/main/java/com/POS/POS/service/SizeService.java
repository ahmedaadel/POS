package com.POS.POS.services;

import com.POS.POS.repository.SizeRepository;
import com.POS.POS.entity.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SizeService {

    @Autowired
    private SizeRepository sizeRepository;

    // Create a new Size
    public Size createSize(Size size) {
        return sizeRepository.save(size);
    }

    // Get all Sizes
    public List<Size> getAllSizes() {
        return sizeRepository.findAll();
    }

    // Get a Size by ID
    public Optional<Size> getSizeById(Integer id) {
        return sizeRepository.findById(id);
    }

    // Update a Size
    public Size updateSize(Integer id, Size size) {
        if (sizeRepository.existsById(id)) {
            size.setId(id);
            return sizeRepository.save(size);
        }
        return null;
    }

    // Delete a Size
    public void deleteSize(Integer id) {
        sizeRepository.deleteById(id);
    }
}

