package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.Ask;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AskRepository extends JpaRepository<Ask, Integer> {
}
