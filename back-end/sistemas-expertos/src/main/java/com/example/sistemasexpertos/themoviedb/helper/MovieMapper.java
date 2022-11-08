package com.example.sistemasexpertos.themoviedb.helper;

import com.example.sistemasexpertos.model.entity.MovieModel;
import com.example.sistemasexpertos.model.repository.CharacteristicsRepository;
import com.example.sistemasexpertos.themoviedb.model.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Service
public class MovieMapper {
    public MovieModel toModel(Result result, int genre_id){
        return MovieModel.builder()
                .title(result.getTitle())
                .overview(result.getOverview())
                .posterPath("https://image.tmdb.org/t/p/w500/"+result.getPosterPath())
                .movieId(result.getId())
                .build();
    }
}
