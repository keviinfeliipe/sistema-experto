package com.example.sistemasexpertos.business.controller;

import com.example.sistemasexpertos.business.service.MovieModelService;
import com.example.sistemasexpertos.model.dto.MovieDto;
import com.example.sistemasexpertos.model.dto.Score;
import com.example.sistemasexpertos.model.entity.RecommendedMovie;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/movie")
@CrossOrigin(origins = "http://localhost:4200")
@AllArgsConstructor
public class MovieController {
    private final MovieModelService movieModelService;

    @GetMapping("{page}")
    public ResponseEntity getPeliculas(@PathVariable Integer page){
        movieModelService.saveMovie(page);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/{genre}/page")
    public ResponseEntity<List<MovieDto>> getAllMovies(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "characteristicId") String order,
            @RequestParam(defaultValue = "true") boolean asc,
            @PathVariable String genre
    ){
        return ResponseEntity.ok(null);
    }
}
