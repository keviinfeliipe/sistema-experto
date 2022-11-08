package com.example.sistemasexpertos.business.controller;

import com.example.sistemasexpertos.business.service.AnswerService;
import com.example.sistemasexpertos.business.service.CustomerService;
import com.example.sistemasexpertos.model.dto.AnswerDtoWithPath;
import com.example.sistemasexpertos.model.dto.AnswerResponseDto;
import com.example.sistemasexpertos.model.dto.AnswerDto;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/v1/answer")
@CrossOrigin(origins = "http://localhost:4200")
@AllArgsConstructor
public class AnswerController {

    private final AnswerService answerService;
    private final CustomerService customerService;

    @PostMapping("/save-answer")
    public ResponseEntity<Boolean> guardarRespuesta(@RequestBody AnswerResponseDto answerResponseDto){
        var customer = customerService.getByUsername(answerResponseDto.getUsername());
        return ResponseEntity.ok(answerService.updateAndGenerateAnswer(answerResponseDto, customer));
    }

    @GetMapping("/{username}")
    public ResponseEntity<List<AnswerDto>> obtenerRespuestasPorUsuario(@PathVariable String username){
        var customer = customerService.getByUsername(username);
        return ResponseEntity.ok(answerService.findAllAsksByUsername(customer));
    }
    @GetMapping("/{username}/current")
    public ResponseEntity<AnswerDtoWithPath> obtenerRespuestaActualPorUsuario(@PathVariable String username){
        var customer = customerService.getByUsername(username);
        var answer = answerService.findCurrentAnswerByUsername(customer);
        return answer.map(value -> ResponseEntity.ok(answerService.findCurrentAnswer(value))).orElseGet(() -> ResponseEntity.noContent().build());
    }
    @GetMapping("/{username}/validate-next-ask")
    public ResponseEntity<Boolean> validarSiguientePregunta(@PathVariable String username){
        var customer = customerService.getByUsername(username);
        var answer = answerService.findCurrentAnswerByUsername(customer);
        if (answer.isEmpty()){
            return ResponseEntity.ok(false);
        }
        return ResponseEntity.ok(true);
    }

    @GetMapping("{username}/genres")
    public ResponseEntity<List<String>> getGenres(@PathVariable String username){
        var customer = customerService.getByUsername(username);
        var genres = answerService.findGenresByConsumer(customer);
        if (genres.isEmpty()){
            return ResponseEntity.noContent().build();
        }
        return  ResponseEntity.ok(genres);
    }
}
