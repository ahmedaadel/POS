package com.POS.POS.rest;

import com.POS.POS.entity.Shift;
import com.POS.POS.service.ShiftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/shifts")
public class ShiftController {
    @Autowired
    private ShiftService shiftService;

    @PostMapping
    public ResponseEntity<Shift> createShift(@RequestBody Shift shift) {
        return ResponseEntity.ok(shiftService.save(shift));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<Shift>> createShifts(@RequestBody List<Shift> shifts) {
        return ResponseEntity.ok(shiftService.saveAll(shifts));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Shift> getShift(@PathVariable int id) {
        return shiftService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<Shift>> getAllShifts() {
        return ResponseEntity.ok(shiftService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<Shift>> getAllShiftsPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(shiftService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Shift> updateShift(@PathVariable int id, @RequestBody Shift shift) {
        shift.setId(id);
        return ResponseEntity.ok(shiftService.update(shift));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteShift(@PathVariable int id) {
        shiftService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
