package com.user;

import lombok.*;
import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@ToString
public class UserInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int usernum;

    private String name;

    private String phone;

    private String objective;

    private String education;

    private String advice;

    private String memo;

}


