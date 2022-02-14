package com.modu.controller;

import com.modu.service.SurveyService;
import com.modu.entity.SurveyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/user")
@ComponentScan(basePackages={"com.modu"})
public class SurveyController {

    @Autowired
    private SurveyService surveyService;

    @RequestMapping(value = "/dataSend")
    public String dataSend(SurveyInfo surveyInfo){

        surveyService.insertSurvey(surveyInfo);

        return "/hello";
    }
}
