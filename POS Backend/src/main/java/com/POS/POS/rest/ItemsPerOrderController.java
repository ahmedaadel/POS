package com.POS.POS.rest;

import com.POS.POS.entity.ItemsPerOrder;
import com.POS.POS.service.ItemsPerOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/itemsPerOrder")
public class ItemsPerOrderController {
    @Autowired
    private ItemsPerOrderService itemsPerOrderService;

    @PostMapping
    public ResponseEntity<ItemsPerOrder> createItemsPerOrder(@RequestBody ItemsPerOrder itemsPerOrder) {
        return ResponseEntity.ok(itemsPerOrderService.save(itemsPerOrder));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<ItemsPerOrder>> createItemsPerOrders(@RequestBody List<ItemsPerOrder> itemsPerOrders) {
        return ResponseEntity.ok(itemsPerOrderService.saveAll(itemsPerOrders));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ItemsPerOrder> getItemsPerOrder(@PathVariable int id) {
        return itemsPerOrderService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<ItemsPerOrder>> getAllItemsPerOrders() {
        return ResponseEntity.ok(itemsPerOrderService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<ItemsPerOrder>> getAllItemsPerOrdersPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(itemsPerOrderService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ItemsPerOrder> updateItemsPerOrder(@PathVariable int id, @RequestBody ItemsPerOrder itemsPerOrder) {
        itemsPerOrder.setId(id);
        return ResponseEntity.ok(itemsPerOrderService.update(itemsPerOrder));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteItemsPerOrder(@PathVariable int id) {
        itemsPerOrderService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
