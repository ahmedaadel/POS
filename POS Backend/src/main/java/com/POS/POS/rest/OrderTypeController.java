package com.POS.POS.rest;

import com.POS.POS.entity.OrderType;
import com.POS.POS.service.OrderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/order-types")
public class OrderTypeController {
    @Autowired
    private OrderTypeService orderTypeService;

    @PostMapping
    public ResponseEntity<OrderType> createOrderType(@RequestBody OrderType orderType) {
        OrderType createdOrderType = orderTypeService.save(orderType);
        return new ResponseEntity<>(createdOrderType, HttpStatus.CREATED);
    }

    @PostMapping("/bulk")
    public ResponseEntity<List<OrderType>> createOrderTypes(@RequestBody List<OrderType> orderTypes) {
        List<OrderType> createdOrderTypes = orderTypeService.saveAll(orderTypes);
        return new ResponseEntity<>(createdOrderTypes, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<OrderType>> getAllOrderTypes() {
        List<OrderType> orderTypes = orderTypeService.findAll();
        return new ResponseEntity<>(orderTypes, HttpStatus.OK);
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<OrderType>> getAllOrderTypesPaged(@RequestParam int page, @RequestParam int size) {
        Page<OrderType> orderTypes = orderTypeService.findAll(PageRequest.of(page, size));
        return new ResponseEntity<>(orderTypes, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderType> getOrderTypeById(@PathVariable Integer id) {
        OrderType orderType = orderTypeService.findById(id);
        return orderType != null ? new ResponseEntity<>(orderType, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/{id}")
    public ResponseEntity<OrderType> updateOrderType(@PathVariable Integer id, @RequestBody OrderType orderType) {
        try {
            OrderType updatedOrderType = orderTypeService.update(id, orderType);
            return new ResponseEntity<>(updatedOrderType, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrderType(@PathVariable Integer id) {
        try {
            orderTypeService.delete(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
