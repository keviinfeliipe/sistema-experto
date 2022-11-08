package com.example.sistemasexpertos.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder(toBuilder = true)
public class GenreDto {
    private int genreId;
    private String name;
}
