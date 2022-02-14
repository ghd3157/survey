package com.modu.controller;

import com.modu.service.UserService;
import com.modu.user.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/user")
@ComponentScan(basePackages={"com.modu"})
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/dataSend", method = RequestMethod.POST)
    public String dataSend(UserInfo userInfo){

        System.out.println(userInfo.toString());

        userService.insertUser(userInfo);

        return "/hello";
    }
}
