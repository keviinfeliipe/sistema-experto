package com.example.sistemasexpertos.themoviedb.service;

import com.example.sistemasexpertos.themoviedb.model.Movie;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class MovieService {
    private final RestTemplate restTemplate;
    public MovieService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }
    public Movie getMovies(int page){
        return restTemplate.getForObject("https://api.themoviedb.org/3/trending/movie/week?api_key=63ade1c55c1e53a6e1c94ef9fe186009&page="+ page, Movie.class);
    }
}
