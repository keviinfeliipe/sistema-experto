package com.example.sistemasexpertos.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder(toBuilder = true)
public class Profiling {
    private Integer idMovie;
    private Boolean adult;
    private String backdropPath;
    private String title;
    private String originalLanguage;
    private String originalTitle;
    private String overview;
    private String posterPath;
    private String mediaType;
    private List<GenreDto> genres;
    private Double popularity;
    private String releaseDate;
    private Boolean video;
    private Double voteAverage;
    private Integer voteCount;
    private float probability;
}
