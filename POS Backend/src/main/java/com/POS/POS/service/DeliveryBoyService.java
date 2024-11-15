package com.POS.POS.service;

import com.POS.POS.entity.DeliveryBoy;
import com.POS.POS.repository.DeliveryBoyRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class DeliveryBoyService {
    @Autowired
    private DeliveryBoyRepository deliveryBoyRepository;

    @Transactional
    public DeliveryBoy save(DeliveryBoy deliveryBoy) {
        return deliveryBoyRepository.save(deliveryBoy);
    }

    @Transactional
    public List<DeliveryBoy> saveAll(List<DeliveryBoy> deliveryBoys) {
        return deliveryBoyRepository.saveAll(deliveryBoys);
    }

    public Optional<DeliveryBoy> findById(int id) {
        return deliveryBoyRepository.findById(id);
    }

    public List<DeliveryBoy> findAll() {
        return deliveryBoyRepository.findAll();
    }

    public Page<DeliveryBoy> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return deliveryBoyRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        deliveryBoyRepository.deleteById(id);
    }

    @Transactional
    public DeliveryBoy update(DeliveryBoy deliveryBoy) {
        return deliveryBoyRepository.save(deliveryBoy);
    }
}
