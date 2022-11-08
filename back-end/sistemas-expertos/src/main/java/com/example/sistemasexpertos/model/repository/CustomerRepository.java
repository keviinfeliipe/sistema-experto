package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    Customer findByUsername(String usermane);
    boolean existsUserByUsername(String usermane);
}
