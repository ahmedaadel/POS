package com.POS.POS.services;


import com.POS.POS.repository.IndustryRepository;
import com.POS.POS.entity.Industry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class IndustryService {

    @Autowired
    private IndustryRepository industryRepository;

    // Create a new Industry
    public Industry createIndustry(Industry industry) {
        return industryRepository.save(industry);
    }

    // Get all Industries
    public List<Industry> getAllIndustries() {
        return industryRepository.findAll();
    }

    // Get an Industry by ID
    public Optional<Industry> getIndustryById(int id) {
        return industryRepository.findById(id);
    }

    // Update an Industry
    public Industry updateIndustry(int id, Industry industry) {
        if (industryRepository.existsById(id)) {
            industry.setId(id);
            return industryRepository.save(industry);
        }
        return null;
    }

    // Delete an Industry
    public void deleteIndustry(int id) {
        industryRepository.deleteById(id);
    }
}
