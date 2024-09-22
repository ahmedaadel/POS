package com.POS.POS.rest;

import com.POS.POS.entity.Supplier;
import com.POS.POS.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/supplier")
public class SupplierController {
    @Autowired
    private SupplierService supplierService;

    @PostMapping
    public ResponseEntity<Supplier> createSupplier(@RequestBody Supplier supplier) {
        return ResponseEntity.ok(supplierService.save(supplier));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<Supplier>> createSuppliers(@RequestBody List<Supplier> suppliers) {
        return ResponseEntity.ok(supplierService.saveAll(suppliers));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Supplier> getSupplier(@PathVariable int id) {
        return supplierService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<Supplier>> getAllSuppliers() {
        return ResponseEntity.ok(supplierService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<Supplier>> getAllSuppliersPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(supplierService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Supplier> updateSupplier(@PathVariable int id, @RequestBody Supplier supplier) {
        supplier.setId(id);
        return ResponseEntity.ok(supplierService.update(supplier));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSupplier(@PathVariable int id) {
        supplierService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
