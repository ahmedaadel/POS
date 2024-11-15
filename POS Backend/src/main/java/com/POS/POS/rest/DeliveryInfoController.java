package com.POS.POS.rest;

import com.POS.POS.entity.DeliveryInfo;
import com.POS.POS.service.DeliveryInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/deliveryInfo")
public class DeliveryInfoController {
    @Autowired
    private DeliveryInfoService deliveryInfoService;

    @PostMapping
    public ResponseEntity<DeliveryInfo> createDeliveryInfo(@RequestBody DeliveryInfo deliveryInfo) {
        return ResponseEntity.ok(deliveryInfoService.save(deliveryInfo));
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<DeliveryInfo>> createDeliveryInfos(@RequestBody List<DeliveryInfo> deliveryInfos) {
        return ResponseEntity.ok(deliveryInfoService.saveAll(deliveryInfos));
    }

    @GetMapping("/{id}")
    public ResponseEntity<DeliveryInfo> getDeliveryInfo(@PathVariable int id) {
        return deliveryInfoService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<List<DeliveryInfo>> getAllDeliveryInfos() {
        return ResponseEntity.ok(deliveryInfoService.findAll());
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<DeliveryInfo>> getAllDeliveryInfosPaged(@RequestParam int page, @RequestParam int size) {
        return ResponseEntity.ok(deliveryInfoService.findAllWithPaging(page, size));
    }

    @PutMapping("/{id}")
    public ResponseEntity<DeliveryInfo> updateDeliveryInfo(@PathVariable int id, @RequestBody DeliveryInfo deliveryInfo) {
        deliveryInfo.setId(id);
        return ResponseEntity.ok(deliveryInfoService.update(deliveryInfo));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDeliveryInfo(@PathVariable int id) {
        deliveryInfoService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
