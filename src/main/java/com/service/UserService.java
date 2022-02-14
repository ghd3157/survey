package com.service;

import com.repository.UserRepository;
import com.user.UserInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;

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
