package com.POS.POS.services;

import com.POS.POS.repository.CreditTypeRepository;
import com.POS.POS.entity.CreditType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CreditTypeService {

    @Autowired
    private CreditTypeRepository creditTypeRepository;

    // Create a new CreditType
    public CreditType createCreditType(CreditType creditType) {
        return creditTypeRepository.save(creditType);
    }

    // Get all CreditTypes
    public List<CreditType> getAllCreditTypes() {
        return creditTypeRepository.findAll();
    }

    // Get a CreditType by ID
    public Optional<CreditType> getCreditTypeById(Integer id) {
        return creditTypeRepository.findById(id);
    }

    // Update a CreditType
    public CreditType updateCreditType(Integer id, CreditType creditType) {
        if (creditTypeRepository.existsById(id)) {
            creditType.setId(id);
            return creditTypeRepository.save(creditType);
        }
        return null;
    }

    // Delete a CreditType
    public void deleteCreditType(Integer id) {
        creditTypeRepository.deleteById(id);
    }
}
