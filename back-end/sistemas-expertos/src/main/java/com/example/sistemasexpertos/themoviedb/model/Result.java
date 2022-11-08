package com.example.sistemasexpertos.themoviedb.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class Result {
    @JsonProperty("adult")
    private Boolean adult;
    @JsonProperty("backdrop_path")
    private String backdropPath;
    @JsonProperty("id")
    private Integer id;
    @JsonProperty("title")
    private String title;
    @JsonProperty("original_language")
    private String originalLanguage;
    @JsonProperty("original_title")
    private String originalTitle;
    @JsonProperty("overview")
    private String overview;
    @JsonProperty("poster_path")
    private String posterPath;
    @JsonProperty("media_type")
    private String mediaType;
    @JsonProperty("genre_ids")
    private List<Integer> genreIds = null;
    @JsonProperty("popularity")
    private Double popularity;
    @JsonProperty("release_date")
    private String releaseDate;
    @JsonProperty("video")
    private Boolean video;
    @JsonProperty("vote_average")
    private Double voteAverage;
    @JsonProperty("vote_count")
    private Integer voteCount;
}