package com.example.sistemasexpertos.business.service;

import com.example.sistemasexpertos.model.dto.MovieDto;
import com.example.sistemasexpertos.model.entity.MovieCharacteristic;
import com.example.sistemasexpertos.model.entity.MovieModel;
import com.example.sistemasexpertos.model.repository.CharacteristicsRepository;
import com.example.sistemasexpertos.model.repository.MovieModelRepository;
import com.example.sistemasexpertos.themoviedb.service.MovieService;
import java.util.*;

import org.springframework.stereotype.Service;


@Service
public class MovieModelService {
    private final MovieModelRepository movieModelRepository;
    private final MovieService movieService;
    private final CharacteristicsRepository characteristicsRepository;
    private final MovieCharacteristicService movieCharacteristicService;

    private final Map<Integer, String> genre;

    public MovieModelService(MovieModelRepository movieModelRepository, MovieService movieService, CharacteristicsRepository characteristicsRepository, MovieCharacteristicService movieCharacteristicService) {
        this.movieModelRepository = movieModelRepository;
        this.movieService = movieService;

        this.characteristicsRepository = characteristicsRepository;
        this.movieCharacteristicService = movieCharacteristicService;
        this.genre = new HashMap<>();
        genre.put(28,"action");
        genre.put(12,"adventure");
        genre.put(16,"animation");
        genre.put(35,"comedy");
        genre.put(80,"crime");
        genre.put(99,"documentary");
        genre.put(18,"drama");
        genre.put(10751,"family");
        genre.put(14,"fantasy");
        genre.put(36,"history");
        genre.put(27,"horror");
        genre.put(10402,"music");
        genre.put(9648,"mystery");
        genre.put(10749,"romance");
        genre.put(878,"fiction");
        genre.put(10770, "tv");
        genre.put(53, "thriller");
        genre.put(10752, "war");
        genre.put(37, "western");
    }

    public MovieModel findById(Integer movieId){
        return movieModelRepository.findById(movieId).orElseThrow();
    }

    public void saveMovie(int page){
        movieService.getMovies(page)
                .getResults()
                .forEach(result -> {
                    var movie = movieModelRepository.save(MovieModel
                            .builder()
                            .title(result.getTitle())
                            .posterPath("https://image.tmdb.org/t/p/w500/"+result.getPosterPath())
                            .overview(result.getOverview())
                            .movieId(result.getId())
                            .build());
                    result.getGenreIds().forEach(integer -> {
                        var genreId = characteristicsRepository.findByGenre(genre.get(integer));
                        movieCharacteristicService.save(
                            MovieCharacteristic
                                    .builder()
                                    .characteristicId(genreId.getId())
                                    .movieId(movie.getId())
                                    .build());
                    });
                })
        ;

    }



}