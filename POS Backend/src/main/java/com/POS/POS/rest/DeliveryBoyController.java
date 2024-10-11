package com.POS.POS.rest;

import com.POS.POS.entity.DeliveryBoy;
import com.POS.POS.service.DeliveryBoyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/DAs")
public class DeliveryBoyController {
    @Autowired
    private DeliveryBoyService deliveryBoyService;

    @PostMapping
    public ResponseEntity<DeliveryBoy> createDeliveryBoy(@RequestBody DeliveryBoy deliveryBoy) {
        return ResponseEntity.ok(deliveryBoyService.save(deliveryBoy));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<DeliveryBoy>> createDeliveryBoys(@RequestBody List<DeliveryBoy> deliveryBoys) {
        return ResponseEntity.ok(deliveryBoyService.saveAll(deliveryBoys));
    }

    @GetMapping("/{id}")
    public ResponseEntity<DeliveryBoy> getDeliveryBoy(@PathVariable int id) {
        return deliveryBoyService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<DeliveryBoy>> getAllDeliveryBoys() {
        return ResponseEntity.ok(deliveryBoyService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<DeliveryBoy>> getAllDeliveryBoysPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(deliveryBoyService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<DeliveryBoy> updateDeliveryBoy(@PathVariable int id, @RequestBody DeliveryBoy deliveryBoy) {
        deliveryBoy.setId(id);
        return ResponseEntity.ok(deliveryBoyService.update(deliveryBoy));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDeliveryBoy(@PathVariable int id) {
        deliveryBoyService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
