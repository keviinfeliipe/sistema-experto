package com.example.sistemasexpertos.business.service;

import com.example.sistemasexpertos.model.entity.Customer;
import com.example.sistemasexpertos.model.repository.CustomerRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CustomerService {

    private final CustomerRepository customerRepository;
    private final AnswerService answerService;
    private final AttentionService attentionService;

    public Customer save(String username){
        return customerRepository.save(Customer
                .builder()
                .username(username)
                .build()
        );
    }

    public boolean existsUserByUsername(String username){
        if(customerRepository.existsUserByUsername(username)){
            return true;
        }
        var customer = save(username);
        attentionService.save(customer.getId());
        answerService.generateAsk(customer,1);
        return false;
    }

    public void addAttention(Customer customer){
        attentionService.save(customer.getId());
        answerService.generateAsk(customer,1);
    }

    public Customer getByUsername(String username){
        return customerRepository.findByUsername(username);
    }

}
