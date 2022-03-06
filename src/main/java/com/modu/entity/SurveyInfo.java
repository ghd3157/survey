package com.modu.entity;

import lombok.*;
import org.hibernate.annotations.Formula;

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

    @Column(length=200)
    private String objective;

    @Column(length=20)
    private String education;

    @Column(length=20)
    private String advice;

    @Column(length=20)
    private String memo;

    @Column(length=50)
    private String regiDate;

    @Column(length=20)
    private int pay;

    @Column(length=20)
    private String counselor;

    @Formula("(select count(*) from survey where counselor = '홍길동')")
    private int Cnt1;

}


