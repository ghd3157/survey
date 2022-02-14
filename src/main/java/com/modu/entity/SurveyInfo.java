package com.modu.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "survey")
public class SurveyInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userNum;

    @Column(length=20)
    private String name;

    @Column(length=20)
    private String phone;

    @Column(length=20)
    private String objective;

    @Column(length=20)
    private String education;

    @Column(length=20)
    private String advice;

    @Column(length=20)
    private String memo;

}

