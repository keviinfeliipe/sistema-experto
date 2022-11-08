package com.example.sistemasexpertos.model.repository;

import com.example.sistemasexpertos.model.entity.RecommendedMovie;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecommendedMovieRepository extends PagingAndSortingRepository<RecommendedMovie, Integer> {
    List<RecommendedMovie> findAllByAttentionId(Integer attentionId, Pageable pageable);
    List<RecommendedMovie> findAllByAttentionId(Integer attentionId);
    boolean existsByAttentionIdAndMovieId(Integer attentionId, Integer movieId);
}
