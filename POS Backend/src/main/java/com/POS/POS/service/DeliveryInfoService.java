package com.POS.POS.service;

import com.POS.POS.entity.DeliveryInfo;
import com.POS.POS.repository.DeliveryInfoRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DeliveryInfoService {
    @Autowired
    private DeliveryInfoRepository deliveryInfoRepository;

    @Transactional
    public DeliveryInfo save(DeliveryInfo deliveryInfo) {
        return deliveryInfoRepository.save(deliveryInfo);
    }

    @Transactional
    public List<DeliveryInfo> saveAll(List<DeliveryInfo> deliveryInfos) {
        return deliveryInfoRepository.saveAll(deliveryInfos);
    }

    public Optional<DeliveryInfo> findById(int id) {
        return deliveryInfoRepository.findById(id);
    }

    public List<DeliveryInfo> findAll() {
        return deliveryInfoRepository.findAll();
    }

    public Page<DeliveryInfo> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return deliveryInfoRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        deliveryInfoRepository.deleteById(id);
    }

    @Transactional
    public DeliveryInfo update(DeliveryInfo deliveryInfo) {
        return deliveryInfoRepository.save(deliveryInfo);
    }
}
