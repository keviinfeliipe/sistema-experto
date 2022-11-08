package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.Characteristic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CharacteristicsRepository extends JpaRepository<Characteristic, Integer> {
    Characteristic findByGenre(String genre);
}
