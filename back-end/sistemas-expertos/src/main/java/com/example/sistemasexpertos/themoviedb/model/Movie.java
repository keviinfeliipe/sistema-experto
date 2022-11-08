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
public class Movie {
    @JsonProperty("page")
    private Integer page;
    @JsonProperty("results")
    private List<Result> results = null;
    @JsonProperty("total_pages")
    private Integer totalPages;
    @JsonProperty("total_results")
    private Integer totalResults;
}
