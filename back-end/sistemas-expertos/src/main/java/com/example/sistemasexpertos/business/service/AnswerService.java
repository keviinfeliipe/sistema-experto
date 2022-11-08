package com.example.sistemasexpertos.business.service;

import com.example.sistemasexpertos.model.dto.AnswerDtoWithPath;
import com.example.sistemasexpertos.model.dto.AnswerResponseDto;
import com.example.sistemasexpertos.model.dto.AnswerDto;
import com.example.sistemasexpertos.model.entity.Answer;
import com.example.sistemasexpertos.model.entity.Customer;
import com.example.sistemasexpertos.model.repository.AnswerRepository;
import com.example.sistemasexpertos.model.repository.AskNavigateRepository;
import com.example.sistemasexpertos.model.repository.CharacteristicsRepository;
import com.example.sistemasexpertos.model.repository.MovieModelRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class AnswerService {
    private final AnswerRepository answerRepository;
    private final AskNavigateRepository askNavigateRepository;
    private final AttentionService attentionService;
    private final AskService askService;
    private final RecommendedMovieService movieService;
    private final CharacteristicsRepository characteristicsRepository;
    private final MovieModelRepository movieModelRepository;
    private final MovieCharacteristicService movieCharacteristicService;

    public Boolean updateAndGenerateAnswer(AnswerResponseDto answerResponseDto, Customer customer){
        var answer = update(answerResponseDto, customer);
        if(!validateNextAnswer(answer.getAskId(), answerResponseDto.getResponse())){
            var genres =
                    this.findAllAsksByUsername(customer)
                            .stream()
                            .filter(answerDto -> answerDto.getResponse().equals("SI"))
                            .map(AnswerDto::getAsk)
                            .collect(Collectors.toList());
            movieService.calculateRecommendation(customer, genres);
            return false;
        }
        var nextAsk = askNavigateRepository.findByAskIdAndResponse(answer.getAskId(), answerResponseDto.getResponse()).getNextAsk();
        this.generateAsk(customer, nextAsk);
        return true;
    }

    public void generateAsk(Customer customer, int askId){
        var attentionId = attentionService.findCurrentAttentionByUserId(customer.getId());
        save(askId, attentionId);
    }
    public Answer update(AnswerResponseDto answerResponseDto, Customer customer){
        var answer = this.findCurrentAnswerByUsername(customer).orElseThrow(() -> new IllegalArgumentException("Error al buscar la respuesta.."));
        answer.setResponse(answerResponseDto.getResponse());
        return answerRepository.save(answer);
    }

    public Answer save(int askId, int attentionId) {
        return answerRepository.save(Answer
                .builder()
                .askId(askId)
                .attentionId(attentionId)
                .build());
    }
    public List<AnswerDto> findAllAsksByUsername(Customer customer){
        var attentionId = attentionService.findCurrentAttentionByUserId(customer.getId());
        return answerRepository.findAllByAttentionId(attentionId)
                .stream()
                .map(answer -> {
                    var ask =  askService.findById(answer.getAskId()).orElseThrow();
                    return AnswerDto
                            .builder()
                            .ask(ask.getAsk())
                            .response(answer.getResponse())
                            .build();
                })
                .collect(Collectors.toList());
    }
    public Optional<Answer> findCurrentAnswerByUsername(Customer customer){
        var attentionId = attentionService.findCurrentAttentionByUserId(customer.getId());
        return answerRepository.findAllByAttentionId(attentionId)
                .stream()
                .filter(answer -> Objects.isNull(answer.getResponse()))
                .findFirst();
    }

    public AnswerDtoWithPath findCurrentAnswer(Answer answer){
        var ask= askService.findById(answer.getAskId()).orElseThrow();
        var genre= characteristicsRepository.findByGenre(ask.getAsk());
        var movieId= movieCharacteristicService.findFirstByCharacteristicId(genre.getId()).getMovieId();
        var path=movieModelRepository.findPathByMovieId(movieId);
        return AnswerDtoWithPath
                .builder()
                .path(path)
                .ask(ask.getAsk())
                .response(answer.getResponse())
                .build();
    }

    public List<String> findGenresByConsumer(Customer customer){
        var list =this.findAllAsksByUsername(customer)
                .stream()
                .filter(answerDto -> answerDto.getResponse().equals("SI"))
                .map(AnswerDto::getAsk)
                .collect(Collectors.toList());

        return list.isEmpty() ? new ArrayList<String>() : list;
    }

    public Boolean validateNextAnswer(Integer originAskId, String orginResponse){
        return askNavigateRepository.existsByOriginAskIdAndOriginResponse(originAskId, orginResponse);
    }



}
