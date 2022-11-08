package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.MovieCharacteristic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MovieCharacteristicRepository extends JpaRepository<MovieCharacteristic, Integer> {
    List<MovieCharacteristic> findAllByMovieId(Integer movieId);
    List<MovieCharacteristic> findAllByCharacteristicId(Integer movieId);
    MovieCharacteristic findFirstByCharacteristicId(Integer movieId);

}
