package com.example.sistemasexpertos.business.controller;

import com.example.sistemasexpertos.business.service.CustomerService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/user")
@CrossOrigin(origins = "http://localhost:4200")
@AllArgsConstructor
public class CustomerController {

    private final CustomerService customerService;


    @GetMapping("/validate-user/{username}")
    public ResponseEntity<Boolean> validateUser(@PathVariable String username){
        return ResponseEntity.ok(customerService.existsUserByUsername(username));
    }

    @GetMapping("/new-attention/{username}")
    public ResponseEntity<Void> addAttention(@PathVariable String username){
        var customer = customerService.getByUsername(username);
        customerService.addAttention(customer);
        return ResponseEntity.ok().build();
    }

}
