package com.example.sistemasexpertos.business.service;

import com.example.sistemasexpertos.model.dto.MovieDto;
import com.example.sistemasexpertos.model.dto.MovieWithGenreDto;
import com.example.sistemasexpertos.model.entity.Customer;
import com.example.sistemasexpertos.model.entity.MovieCharacteristic;
import com.example.sistemasexpertos.model.entity.RecommendedMovie;
import com.example.sistemasexpertos.model.repository.CharacteristicsRepository;
import com.example.sistemasexpertos.model.repository.RecommendedMovieRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class RecommendedMovieService {
    private final RecommendedMovieRepository recommendedMovieRepository;
    private final AttentionService attentionService;
    private final MovieModelService movieModelService;
    private final CharacteristicsRepository characteristicsRepository;
    private final MovieCharacteristicService movieCharacteristicService;
    public List<MovieDto> recommendedMovie(Customer customer, Pageable pageable){
        var attentionId = attentionService.findCurrentAttentionByUserId(customer.getId());
        return recommendedMovieRepository.findAllByAttentionId(attentionId, pageable)
                .stream()
                .map(recommendedMovie -> {
                    var movie = movieModelService.findById(recommendedMovie.getMovieId());
                    return MovieDto
                            .builder()
                            .title(movie.getTitle())
                            .path(movie.getPosterPath())
                            .probability(recommendedMovie.getProbability())
                            .build();})
                .sorted(Comparator.comparing(MovieDto::getProbability).reversed())
                .limit(5)
                .collect(Collectors.toList());
    }

    public List<MovieWithGenreDto> recommendedMovieByGenre(Customer customer, String genre){
        var attentionId = attentionService.findCurrentAttentionByUserId(customer.getId());
        List<MovieWithGenreDto> movieWithGenreDtos = new ArrayList<>();
        recommendedMovieRepository.findAllByAttentionId(attentionId)
                .forEach(recommendedMovie -> {
                    var movie = movieModelService.findById(recommendedMovie.getMovieId());
                    var genres = movieCharacteristicService.findGenresByMovieId(movie.getId());
                    genres.forEach(s -> {
                        movieWithGenreDtos.add(MovieWithGenreDto
                                .builder()
                                .title(movie.getTitle())
                                .path(movie.getPosterPath())
                                .probability(recommendedMovie.getProbability())
                                .genre(s)
                                .build());
                    });
                });
        return movieWithGenreDtos
                .stream()
                .filter(movieWithGenreDto -> movieWithGenreDto.getGenre().equals(genre))
                .sorted(Comparator.comparing(MovieWithGenreDto::getProbability).reversed())
                .limit(5)
                .collect(Collectors.toList());
    }
    public void calculateRecommendation(Customer customer, List<String> genres){
        genres.forEach(genre -> {
            var characteristic = characteristicsRepository.findByGenre(genre);
            movieCharacteristicService.findAllByCharacteristicId(characteristic.getId())
                    .forEach(movie -> saveRecommendedMovie(movie, customer, genres));
        });
    }
    public void saveRecommendedMovie(MovieCharacteristic movie, Customer customer, List<String> genres){
        var attentionId = attentionService.findCurrentAttentionByUserId(customer.getId());
        if(!recommendedMovieRepository.existsByAttentionIdAndMovieId(attentionId, movie.getMovieId())){
            var movieGenres = movieCharacteristicService.findGenresByMovieId(movie.getMovieId());
            var contain = (float) movieGenres.stream().filter(genres::contains).count();
            var total = (float) genres.size();
            var probability = contain/total;
            recommendedMovieRepository.save(RecommendedMovie
                    .builder()
                    .movieId(movie.getMovieId())
                    .probability(probability)
                    .attentionId(attentionId)
                    .build()
            );
        }

    }
}
