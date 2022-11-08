package com.example.sistemasexpertos.business.service;

import com.example.sistemasexpertos.model.entity.Characteristic;
import com.example.sistemasexpertos.model.entity.MovieCharacteristic;
import com.example.sistemasexpertos.model.repository.CharacteristicsRepository;
import com.example.sistemasexpertos.model.repository.MovieCharacteristicRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class MovieCharacteristicService {
    private final MovieCharacteristicRepository movieCharacteristicRepository;
    private final CharacteristicsRepository characteristicsRepository;

    public List<String> findGenresByMovieId(Integer movieId){
        return movieCharacteristicRepository
                .findAllByMovieId(movieId)
                .stream()
                .map(MovieCharacteristic::getCharacteristicId)
                .map(integer ->  characteristicsRepository.findById(integer).orElseThrow())
                .map(Characteristic::getGenre)
                .collect(Collectors.toList());
    }

    public MovieCharacteristic save(MovieCharacteristic record){
        return movieCharacteristicRepository.save(record);
    }

    public List<MovieCharacteristic> findAllByCharacteristicId(Integer characteristicId){
        return movieCharacteristicRepository.findAllByCharacteristicId(characteristicId);
    }
    public MovieCharacteristic findFirstByCharacteristicId(Integer characteristicId){
        return movieCharacteristicRepository.findFirstByCharacteristicId(characteristicId);
    }
}
