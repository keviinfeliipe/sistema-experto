package com.example.sistemasexpertos.business.controller;

import com.example.sistemasexpertos.business.service.CustomerService;
import com.example.sistemasexpertos.business.service.RecommendedMovieService;
import com.example.sistemasexpertos.model.dto.MovieDto;
import com.example.sistemasexpertos.model.dto.MovieWithGenreDto;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/v1/profiling")
@CrossOrigin(origins = "http://localhost:4200")
@AllArgsConstructor
public class ProfilingController {

    private final RecommendedMovieService movieService;
    private final CustomerService customerService;

    @GetMapping("{username}/page")
    public ResponseEntity<List<MovieDto>> getAllMovies(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "probability") String order,
            @RequestParam(defaultValue = "true") boolean asc,
            @PathVariable String username
    ){
        var customer = customerService.getByUsername(username);
        var movies = movieService.recommendedMovie(customer, PageRequest.of(page,size, Sort.by(order).descending()));
        if (movies.isEmpty()){
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(movies);
    }

    @GetMapping("{username}/{genre}")
    public ResponseEntity<List<MovieWithGenreDto>> getAllMoviesByGenre(
            @PathVariable String username,
            @PathVariable String genre
    ){
        var customer = customerService.getByUsername(username);
        var movies = movieService.recommendedMovieByGenre(customer, genre);
        if (movies.isEmpty()){
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(movies);
    }


}
