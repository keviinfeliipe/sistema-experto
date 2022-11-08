package com.example.sistemasexpertos.business.service;

import com.example.sistemasexpertos.model.entity.Ask;
import com.example.sistemasexpertos.model.repository.AskRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class AskService {
    private final AskRepository askRepository;

    public Optional<Ask> findById(int askId){
        return askRepository.findById(askId);
    }
}
