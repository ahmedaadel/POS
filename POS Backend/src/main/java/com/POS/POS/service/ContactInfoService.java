package com.POS.POS.services;
import com.POS.POS.repository.ContactInfoRepository;
import com.POS.POS.entity.ContactInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ContactInfoService {

    @Autowired
    private ContactInfoRepository contactInfoRepository;

    // Create a new ContactInfo
    public ContactInfo createContactInfo(ContactInfo contactInfo) {
        return contactInfoRepository.save(contactInfo);
    }

    // Get all ContactInfos
    public List<ContactInfo> getAllContactInfos() {
        return contactInfoRepository.findAll();
    }

    // Get a ContactInfo by ID
    public Optional<ContactInfo> getContactInfoById(Integer id) {
        return contactInfoRepository.findById(id);
    }

    // Update a ContactInfo
    public ContactInfo updateContactInfo(Integer id, ContactInfo contactInfo) {
        if (contactInfoRepository.existsById(id)) {
            contactInfo.setId(id);
            return contactInfoRepository.save(contactInfo);
        }
        return null;
    }

    // Delete a ContactInfo
    public void deleteContactInfo(Integer id) {
        contactInfoRepository.deleteById(id);
    }
}
