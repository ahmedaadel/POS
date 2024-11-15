package com.POS.POS.rest;

import com.POS.POS.entity.ItemSize;
import com.POS.POS.service.ItemSizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/itemSize")
public class ItemSizeController {
    @Autowired
    private ItemSizeService itemSizeService;

    @PostMapping
    public ResponseEntity<ItemSize> createItemSize(@RequestBody ItemSize itemSize) {
        return ResponseEntity.ok(itemSizeService.save(itemSize));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<ItemSize>> createItemSizes(@RequestBody List<ItemSize> itemSizes) {
        return ResponseEntity.ok(itemSizeService.saveAll(itemSizes));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ItemSize> getItemSize(@PathVariable int id) {
        return itemSizeService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<ItemSize>> getAllItemSizes() {
        return ResponseEntity.ok(itemSizeService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<ItemSize>> getAllItemSizesPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(itemSizeService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ItemSize> updateItemSize(@PathVariable int id, @RequestBody ItemSize itemSize) {
        itemSize.setId(id);
        return ResponseEntity.ok(itemSizeService.update(itemSize));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteItemSize(@PathVariable int id) {
        itemSizeService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
