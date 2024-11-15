package com.POS.POS.service;

import com.POS.POS.entity.Supplier;
import com.POS.POS.repository.SupplierRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class SupplierService {
    @Autowired
    private SupplierRepository supplierRepository;

    @Transactional
    public Supplier save(Supplier supplier) {
        return supplierRepository.save(supplier);
    }

    @Transactional
    public List<Supplier> saveAll(List<Supplier> suppliers) {
        return supplierRepository.saveAll(suppliers);
    }

    public Optional<Supplier> findById(int id) {
        return supplierRepository.findById(id);
    }

    public List<Supplier> findAll() {
        return supplierRepository.findAll();
    }

    public Page<Supplier> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return supplierRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        supplierRepository.deleteById(id);
    }

    @Transactional
    public Supplier update(Supplier supplier) {
        return supplierRepository.save(supplier);
    }
}
