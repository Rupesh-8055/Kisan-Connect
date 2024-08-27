package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dummyentity.DemoOrder;
import com.example.demo.dummyentity.DemoOrderDetails;
import com.example.demo.entity.Order;
import com.example.demo.services.PlaceOrderService;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class OrdersController {

    @Autowired
    PlaceOrderService pservice;

    @PostMapping("/placeOrder")
    public Order placeOrder(@RequestBody DemoOrder o) {
        return pservice.placeOrder(o, o.getOrderDetails());
    }
}
