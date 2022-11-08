package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.MovieModel;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MovieModelRepository extends PagingAndSortingRepository<MovieModel, Integer> {
    @Query("SELECT m.posterPath FROM MovieModel m WHERE m.id = ?1")
    String findPathByMovieId(Integer genreId);
}
