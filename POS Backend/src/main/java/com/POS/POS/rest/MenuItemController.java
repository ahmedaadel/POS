package com.POS.POS.rest;

import com.POS.POS.entity.MenuItem;
import com.POS.POS.service.MenuItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/menu-item")
public class MenuItemController {
    @Autowired
    private MenuItemService menuItemService;

    @PostMapping
    public ResponseEntity<MenuItem> createMenuItem(@RequestBody MenuItem menuItem) {
        return ResponseEntity.ok(menuItemService.save(menuItem));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<MenuItem>> createMenuItems(@RequestBody List<MenuItem> menuItems) {
        return ResponseEntity.ok(menuItemService.saveAll(menuItems));
    }

    @GetMapping("/{id}")
    public ResponseEntity<MenuItem> getMenuItem(@PathVariable int id) {
        return menuItemService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<MenuItem>> getAllMenuItems() {
        return ResponseEntity.ok(menuItemService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<MenuItem>> getAllMenuItemsPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(menuItemService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<MenuItem> updateMenuItem(@PathVariable int id, @RequestBody MenuItem menuItem) {
        menuItem.setId(id);
        return ResponseEntity.ok(menuItemService.update(menuItem));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteMenuItem(@PathVariable int id) {
        menuItemService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
