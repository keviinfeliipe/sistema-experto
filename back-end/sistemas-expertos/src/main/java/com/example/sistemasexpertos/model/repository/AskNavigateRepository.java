package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.AskNavigate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AskNavigateRepository extends JpaRepository<AskNavigate, Integer> {
    @Query("SELECT u FROM AskNavigate u WHERE u.originAskId = ?1 and u.originResponse = ?2")
    AskNavigate findByAskIdAndResponse(Integer askId, String response);

    Boolean existsByOriginAskIdAndOriginResponse(Integer askId, String response);
}
