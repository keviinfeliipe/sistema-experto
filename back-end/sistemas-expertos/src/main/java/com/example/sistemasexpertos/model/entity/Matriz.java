package com.example.sistemasexpertos.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.Hibernate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Matriz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private float id;
    private Integer movieId;
    private Integer action;
    private Integer Comedy;
    private Integer Fantasy;
    private Integer Family;
    private Integer Romance;
    private Integer Adventure;
    private Integer Animation;
    private Integer Horror;
    private Integer fiction;
    private Integer Mystery;
    private Integer History;
    private Integer Music;
    private Integer Crime;
    private Integer Documentary;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Matriz matriz = (Matriz) o;
        return false;
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
