package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnswerRepository extends JpaRepository<Answer, Integer> {
    List<Answer> findAllByAttentionId(Integer attentionId);
}
