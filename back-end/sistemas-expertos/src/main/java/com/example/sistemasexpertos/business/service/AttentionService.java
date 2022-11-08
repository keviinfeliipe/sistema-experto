package com.example.sistemasexpertos.business.service;

import com.example.sistemasexpertos.model.entity.Attention;
import com.example.sistemasexpertos.model.repository.AttentionRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@AllArgsConstructor
public class AttentionService {
    private final AttentionRepository attentionRepository;
    public Attention save(int customerId){
        var attention = Attention
                .builder()
                .customerId(customerId)
                .created(LocalDateTime.now())
                .build();
        return attentionRepository.save(attention);
    }

    public Integer findCurrentAttentionByUserId(Integer userId){
        return attentionRepository.findCurrentAttentionByUserId(userId);
    }

}
