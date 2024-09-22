package com.POS.POS.service;

import com.POS.POS.entity.CreditDebit;
import com.POS.POS.repository.CreditDebitRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class CreditDebitService {
    @Autowired
    private CreditDebitRepository creditDebitRepository;

    @Transactional
    public CreditDebit save(CreditDebit creditDebit) {
        return creditDebitRepository.save(creditDebit);
    }

    @Transactional
    public List<CreditDebit> saveAll(List<CreditDebit> creditDebits) {
        return creditDebitRepository.saveAll(creditDebits);
    }

    public Optional<CreditDebit> findById(int id) {
        return creditDebitRepository.findById(id);
    }

    public List<CreditDebit> findAll() {
        return creditDebitRepository.findAll();
    }

    public Page<CreditDebit> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return creditDebitRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        creditDebitRepository.deleteById(id);
    }

    @Transactional
    public CreditDebit update(CreditDebit creditDebit) {
        return creditDebitRepository.save(creditDebit);
    }
}
