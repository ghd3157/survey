package com.modu.user;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@DynamicUpdate
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@ToString
@Table(name = "survey")
public class UserInfo {

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


