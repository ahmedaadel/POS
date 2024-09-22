package com.POS.POS.service;

import com.POS.POS.entity.Shift;
import com.POS.POS.repository.ShiftRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ShiftService {
    @Autowired
    private ShiftRepository shiftRepository;

    @Transactional
    public Shift save(Shift shift) {
        return shiftRepository.save(shift);
    }

    @Transactional
    public List<Shift> saveAll(List<Shift> shifts) {
        return shiftRepository.saveAll(shifts);
    }

    public Optional<Shift> findById(int id) {
        return shiftRepository.findById(id);
    }

    public List<Shift> findAll() {
        return shiftRepository.findAll();
    }

    public Page<Shift> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return shiftRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        shiftRepository.deleteById(id);
    }

    @Transactional
    public Shift update(Shift shift) {
        return shiftRepository.save(shift);
    }
}
