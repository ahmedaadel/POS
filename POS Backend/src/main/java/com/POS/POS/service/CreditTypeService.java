package com.POS.POS.service;

import com.POS.POS.entity.CreditType;
import com.POS.POS.repository.CreditTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CreditTypeService {
    @Autowired
    private CreditTypeRepository creditTypeRepository;

    @Transactional
    public CreditType save(CreditType creditType) {
        return creditTypeRepository.save(creditType);
    }

    @Transactional
    public List<CreditType> saveAll(List<CreditType> creditTypes) {
        return creditTypeRepository.saveAll(creditTypes);
    }

    public List<CreditType> findAll() {
        return creditTypeRepository.findAll();
    }

    public Page<CreditType> findAll(Pageable pageable) {
        return creditTypeRepository.findAll(pageable);
    }

    public CreditType findById(Integer id) {
        return creditTypeRepository.findById(id).orElse(null);
    }

    @Transactional
    public CreditType update(Integer id, CreditType creditType) {
        if (!creditTypeRepository.existsById(id)) {
            throw new RuntimeException("CreditType not found");
        }
        creditType.setId(id);
        return creditTypeRepository.save(creditType);
    }

    @Transactional
    public void delete(Integer id) {
        if (!creditTypeRepository.existsById(id)) {
            throw new RuntimeException("CreditType not found");
        }
        creditTypeRepository.deleteById(id);
    }
}
