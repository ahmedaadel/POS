package com.POS.POS.rest;

import com.POS.POS.entity.ItemAddOn;
import com.POS.POS.service.ItemAddOnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/item-add-ons")
public class ItemAddOnController {
    @Autowired
    private ItemAddOnService itemAddOnService;

    @PostMapping
    public ResponseEntity<ItemAddOn> createItemAddOn(@RequestBody ItemAddOn itemAddOn) {
        return ResponseEntity.ok(itemAddOnService.save(itemAddOn));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<ItemAddOn>> createItemAddOns(@RequestBody List<ItemAddOn> itemAddOns) {
        return ResponseEntity.ok(itemAddOnService.saveAll(itemAddOns));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ItemAddOn> getItemAddOn(@PathVariable int id) {
        return itemAddOnService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<ItemAddOn>> getAllItemAddOns() {
        return ResponseEntity.ok(itemAddOnService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<ItemAddOn>> getAllItemAddOnsPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(itemAddOnService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ItemAddOn> updateItemAddOn(@PathVariable int id, @RequestBody ItemAddOn itemAddOn) {
        itemAddOn.setId(id);
        return ResponseEntity.ok(itemAddOnService.update(itemAddOn));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteItemAddOn(@PathVariable int id) {
        itemAddOnService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
