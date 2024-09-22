package com.POS.POS.rest;

import com.POS.POS.entity.ContactInfo;
import com.POS.POS.service.ContactInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/contactInfo")
public class ContactInfoController {
    @Autowired
    private ContactInfoService contactInfoService;

    @PostMapping
    public ResponseEntity<ContactInfo> createContactInfo(@RequestBody ContactInfo contactInfo) {
        return ResponseEntity.ok(contactInfoService.save(contactInfo));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<ContactInfo>> createContactInfos(@RequestBody List<ContactInfo> contactInfos) {
        return ResponseEntity.ok(contactInfoService.saveAll(contactInfos));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ContactInfo> getContactInfo(@PathVariable int id) {
        return contactInfoService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<ContactInfo>> getAllContactInfos() {
        return ResponseEntity.ok(contactInfoService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<ContactInfo>> getAllContactInfosPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(contactInfoService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ContactInfo> updateContactInfo(@PathVariable int id, @RequestBody ContactInfo contactInfo) {
        contactInfo.setId(id);
        return ResponseEntity.ok(contactInfoService.update(contactInfo));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteContactInfo(@PathVariable int id) {
        contactInfoService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
