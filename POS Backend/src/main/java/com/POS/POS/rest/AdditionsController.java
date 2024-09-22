package com.POS.POS.rest;

import com.POS.POS.entity.Additions;
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
    public ResponseEntity<Additions> createAddition(@RequestBody Additions addition) {
        return ResponseEntity.ok(additionsService.save(addition));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<Additions>> createAdditions(@RequestBody List<Additions> additions) {
        return ResponseEntity.ok(additionsService.saveAll(additions));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Additions> getAddition(@PathVariable int id) {
        return additionsService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<Additions>> getAllAdditions() {
        return ResponseEntity.ok(additionsService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<Additions>> getAllAdditionsPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(additionsService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Additions> updateAddition(@PathVariable int id, @RequestBody Additions addition) {
        addition.setId(id);
        return ResponseEntity.ok(additionsService.update(addition));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAddition(@PathVariable int id) {
        additionsService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
