package com.POS.POS.rest;

import com.POS.POS.entity.OrderStatus;
import com.POS.POS.service.OrderStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/orderStatuses")
public class OrderStatusController {
    @Autowired
    private OrderStatusService orderStatusService;

    @PostMapping
    public ResponseEntity<OrderStatus> createOrderStatus(@RequestBody OrderStatus orderStatus) {
        OrderStatus createdOrderStatus = orderStatusService.save(orderStatus);
        return new ResponseEntity<>(createdOrderStatus, HttpStatus.CREATED);
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<OrderStatus>> createOrderStatuses(@RequestBody List<OrderStatus> orderStatuses) {
        List<OrderStatus> createdOrderStatuses = orderStatusService.saveAll(orderStatuses);
        return new ResponseEntity<>(createdOrderStatuses, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<OrderStatus>> getAllOrderStatuses() {
        List<OrderStatus> orderStatuses = orderStatusService.findAll();
        return new ResponseEntity<>(orderStatuses, HttpStatus.OK);
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<OrderStatus>> getAllOrderStatusesPaged(@RequestParam int page, @RequestParam int size) {
        Page<OrderStatus> orderStatuses = orderStatusService.findAll(PageRequest.of(page, size));
        return new ResponseEntity<>(orderStatuses, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderStatus> getOrderStatusById(@PathVariable Integer id) {
        OrderStatus orderStatus = orderStatusService.findById(id);
        return orderStatus != null ? new ResponseEntity<>(orderStatus, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/{id}")
    public ResponseEntity<OrderStatus> updateOrderStatus(@PathVariable Integer id, @RequestBody OrderStatus orderStatus) {
        try {
            OrderStatus updatedOrderStatus = orderStatusService.update(id, orderStatus);
            return new ResponseEntity<>(updatedOrderStatus, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrderStatus(@PathVariable Integer id) {
        try {
            orderStatusService.delete(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
