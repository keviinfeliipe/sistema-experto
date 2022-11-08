package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.Attention;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AttentionRepository extends JpaRepository<Attention, Integer> {
    @Query(value = "SELECT max(a.id) FROM Attention a where a.customerId=:userId")
    Integer findCurrentAttentionByUserId(Integer userId);

}
