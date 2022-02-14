package com.modu.service;

import com.modu.repository.UserRepository;
import com.modu.user.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;


@Service
public class UserService {

    UserRepository userRepository;

    @Transactional
    public List<UserInfo> findAll(){
        List<UserInfo> userInfoList = new ArrayList<>();
        userRepository.findAll();
        return userInfoList;
    }

    @Transactional
    public UserInfo insertUser(UserInfo userInfo){

        UserInfo user = new UserInfo();

        user.setName(userInfo.getName());
        user.setPhone(userInfo.getPhone());
        user.setObjective(userInfo.getObjective());
        user.setEducation(userInfo.getObjective());
        user.setAdvice(userInfo.getAdvice());
        user.setMemo(userInfo.getMemo());

        return userRepository.save(user);
    }


}
