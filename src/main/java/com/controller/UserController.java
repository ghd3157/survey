package com.controller;

import com.service.UserService;
import com.user.UserInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;


    @RequestMapping(value = "/dataSend", method = RequestMethod.POST)
    public String dataSend(UserInfo userInfo){

        System.out.println(userInfo.toString());

        userService.insertUser(userInfo);

        return "/hello";
    }
}
