package com.POS.POS.service;

import com.POS.POS.entity.ContactInfo;
import com.POS.POS.repository.ContactInfoRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ContactInfoService {
    @Autowired
    private ContactInfoRepository contactInfoRepository;

    @Transactional
    public ContactInfo save(ContactInfo contactInfo) {
        return contactInfoRepository.save(contactInfo);
    }

    @Transactional
    public List<ContactInfo> saveAll(List<ContactInfo> contactInfos) {
        return contactInfoRepository.saveAll(contactInfos);
    }

    public Optional<ContactInfo> findById(int id) {
        return contactInfoRepository.findById(id);
    }

    public List<ContactInfo> findAll() {
        return contactInfoRepository.findAll();
    }

    public Page<ContactInfo> findAllWithPaging(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return contactInfoRepository.findAll(pageable);
    }

    @Transactional
    public void deleteById(int id) {
        contactInfoRepository.deleteById(id);
    }

    @Transactional
    public ContactInfo update(ContactInfo contactInfo) {
        return contactInfoRepository.save(contactInfo);
    }
}
