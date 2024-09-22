package com.POS.POS.rest;

import com.POS.POS.entity.CreditType;
import com.POS.POS.service.CreditTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/credit-types")
public class CreditTypeController {
    @Autowired
    private CreditTypeService creditTypeService;

    @PostMapping
    public ResponseEntity<CreditType> createCreditType(@RequestBody CreditType creditType) {
        CreditType createdCreditType = creditTypeService.save(creditType);
        return new ResponseEntity<>(createdCreditType, HttpStatus.CREATED);
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<CreditType>> createCreditTypes(@RequestBody List<CreditType> creditTypes) {
        List<CreditType> createdCreditTypes = creditTypeService.saveAll(creditTypes);
        return new ResponseEntity<>(createdCreditTypes, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<CreditType>> getAllCreditTypes() {
        List<CreditType> creditTypes = creditTypeService.findAll();
        return new ResponseEntity<>(creditTypes, HttpStatus.OK);
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<CreditType>> getAllCreditTypesPaged(@RequestParam int page, @RequestParam int size) {
        Page<CreditType> creditTypes = creditTypeService.findAll(PageRequest.of(page, size));
        return new ResponseEntity<>(creditTypes, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CreditType> getCreditTypeById(@PathVariable Integer id) {
        CreditType creditType = creditTypeService.findById(id);
        return creditType != null ? new ResponseEntity<>(creditType, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/{id}")
    public ResponseEntity<CreditType> updateCreditType(@PathVariable Integer id, @RequestBody CreditType creditType) {
        try {
            CreditType updatedCreditType = creditTypeService.update(id, creditType);
            return new ResponseEntity<>(updatedCreditType, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCreditType(@PathVariable Integer id) {
        try {
            creditTypeService.delete(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
