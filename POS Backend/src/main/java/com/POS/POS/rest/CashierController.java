package com.POS.POS.rest;

import com.POS.POS.entity.Cashier;
import com.POS.POS.service.CashierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cashier")
public class CashierController {
    @Autowired
    private CashierService cashierService;

    @PostMapping
    public ResponseEntity<Cashier> createCashier(@RequestBody Cashier cashier) {
        return ResponseEntity.ok(cashierService.save(cashier));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<Cashier>> createCashiers(@RequestBody List<Cashier> cashiers) {
        return ResponseEntity.ok(cashierService.saveAll(cashiers));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cashier> getCashier(@PathVariable int id) {
        return cashierService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<Cashier>> getAllCashiers() {
        return ResponseEntity.ok(cashierService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<Cashier>> getAllCashiersPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(cashierService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cashier> updateCashier(@PathVariable int id, @RequestBody Cashier cashier) {
        cashier.setId(id);
        return ResponseEntity.ok(cashierService.update(cashier));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCashier(@PathVariable int id) {
        cashierService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
