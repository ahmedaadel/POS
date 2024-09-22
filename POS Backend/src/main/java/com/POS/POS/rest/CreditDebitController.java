package com.POS.POS.rest;

import com.POS.POS.entity.CreditDebit;
import com.POS.POS.service.CreditDebitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/credit-debit")
public class CreditDebitController {
    @Autowired
    private CreditDebitService creditDebitService;

    @PostMapping
    public ResponseEntity<CreditDebit> createCreditDebit(@RequestBody CreditDebit creditDebit) {
        return ResponseEntity.ok(creditDebitService.save(creditDebit));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<CreditDebit>> createCreditDebits(@RequestBody List<CreditDebit> creditDebits) {
        return ResponseEntity.ok(creditDebitService.saveAll(creditDebits));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CreditDebit> getCreditDebit(@PathVariable int id) {
        return creditDebitService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<CreditDebit>> getAllCreditDebits() {
        return ResponseEntity.ok(creditDebitService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<CreditDebit>> getAllCreditDebitsPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(creditDebitService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CreditDebit> updateCreditDebit(@PathVariable int id, @RequestBody CreditDebit creditDebit) {
        creditDebit.setId(id);
        return ResponseEntity.ok(creditDebitService.update(creditDebit));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCreditDebit(@PathVariable int id) {
        creditDebitService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
