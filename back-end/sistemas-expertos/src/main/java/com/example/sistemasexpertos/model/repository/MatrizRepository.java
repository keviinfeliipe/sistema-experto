package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.Matriz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MatrizRepository extends JpaRepository<Matriz, Integer> {
}
