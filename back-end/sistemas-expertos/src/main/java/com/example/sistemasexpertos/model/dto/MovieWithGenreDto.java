package com.example.sistemasexpertos.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder(toBuilder = true)
public class MovieWithGenreDto {
    private String title;
    private String path;
    private float probability;
    private String genre;
}
