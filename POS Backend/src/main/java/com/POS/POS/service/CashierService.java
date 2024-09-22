package com.POS.POS.service;

import com.POS.POS.entity.Cashier;
import com.POS.POS.repository.CashierRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class CashierService {
    @Autowired
    private CashierRepository cashierRepository;

    @Transactional
    public Cashier save(Cashier cashier) {
        return cashierRepository.save(cashier);
    }

    @Transactional
    public List<Cashier> saveAll(List<Cashier> cashiers) {
        return cashierRepository.saveAll(cashiers);
    }

    public Optional<Cashier> findById(int id) {
        return cashierRepository.findById(id);
    }

    public List<Cashier> findAll() {
        return cashierRepository.findAll();
    }

    public Page<Cashier> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return cashierRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        cashierRepository.deleteById(id);
    }

    @Transactional
    public Cashier update(Cashier cashier) {
        return cashierRepository.save(cashier);
    }
}
