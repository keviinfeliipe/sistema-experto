package com.example.sistemasexpertos.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class AnswerDtoWithPath{
    private String ask;
    private String response;
    private String path;
}
