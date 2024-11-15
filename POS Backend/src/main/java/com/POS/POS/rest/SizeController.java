package com.POS.POS.rest;

import com.POS.POS.entity.Size;
import com.POS.POS.service.SizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/sizes")
public class SizeController {
    @Autowired
    private SizeService sizeService;

    @PostMapping
    public ResponseEntity<Size> createSize(@RequestBody Size size) {
        Size createdSize = sizeService.save(size);
        return new ResponseEntity<>(createdSize, HttpStatus.CREATED);
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<Size>> createSizes(@RequestBody List<Size> sizes) {
        List<Size> createdSizes = sizeService.saveAll(sizes);
        return new ResponseEntity<>(createdSizes, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Size>> getAllSizes() {
        List<Size> sizes = sizeService.findAll();
        return new ResponseEntity<>(sizes, HttpStatus.OK);
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<Size>> getAllSizesPaged(@RequestParam int page, @RequestParam int size) {
        Page<Size> sizes = sizeService.findAll(PageRequest.of(page, size));
        return new ResponseEntity<>(sizes, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Size> getSizeById(@PathVariable Integer id) {
        Size size = sizeService.findById(id);
        return size != null ? new ResponseEntity<>(size, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Size> updateSize(@PathVariable Integer id, @RequestBody Size size) {
        try {
            Size updatedSize = sizeService.update(id, size);
            return new ResponseEntity<>(updatedSize, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSize(@PathVariable Integer id) {
        try {
            sizeService.delete(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
