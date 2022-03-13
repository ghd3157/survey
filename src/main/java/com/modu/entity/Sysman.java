package com.modu.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "sysman")
public class Sysman {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int sysNum;

    @Column(length=20)
    private int sysmanCount;
}
