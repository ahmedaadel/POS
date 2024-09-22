package com.POS.POS.rest;

import com.POS.POS.entity.Industry;
import com.POS.POS.service.IndustryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/industry")
public class IndustryController {
    @Autowired
    private IndustryService industryService;

    @PostMapping
    public ResponseEntity<Industry> createIndustry(@RequestBody Industry industry) {
        return ResponseEntity.ok(industryService.save(industry));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<Industry>> createIndustries(@RequestBody List<Industry> industries) {
        return ResponseEntity.ok(industryService.saveAll(industries));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Industry> getIndustry(@PathVariable int id) {
        return industryService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<Industry>> getAllIndustries() {
        return ResponseEntity.ok(industryService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<Industry>> getAllIndustriesPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(industryService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Industry> updateIndustry(@PathVariable int id, @RequestBody Industry industry) {
        industry.setId(id);
        return ResponseEntity.ok(industryService.update(industry));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteIndustry(@PathVariable int id) {
        industryService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
