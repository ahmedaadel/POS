package com.POS.POS.rest;

import com.POS.POS.entity.Addition;
import com.POS.POS.service.AdditionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/additions")
public class AdditionsController {
    @Autowired
    private AdditionsService additionsService;

    @PostMapping
    public ResponseEntity<Addition> createAddition(@RequestBody Addition addition) {
        return ResponseEntity.ok(additionsService.save(addition));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<Addition>> createAdditions(@RequestBody List<Addition> additions) {
        return ResponseEntity.ok(additionsService.saveAll(additions));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Addition> getAddition(@PathVariable int id) {
        return additionsService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<Addition>> getAllAdditions() {
        return ResponseEntity.ok(additionsService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<Addition>> getAllAdditionsPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(additionsService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Addition> updateAddition(@PathVariable int id, @RequestBody Addition addition) {
        addition.setId(id);
        return ResponseEntity.ok(additionsService.update(addition));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAddition(@PathVariable int id) {
        additionsService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
