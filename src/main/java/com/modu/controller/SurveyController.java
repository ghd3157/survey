package com.modu.controller;

import com.modu.service.MailSendService;
import com.modu.service.SurveyService;
import com.modu.entity.SurveyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping("/user")
@ComponentScan(basePackages={"com.modu"})
public class SurveyController {

    @Autowired
    private SurveyService surveyService;

    @Autowired
    private MailSendService mailSendService;

    @RequestMapping(value = "/surveyPage/dataSend")
    public String dataSend(SurveyInfo surveyInfo){

        surveyService.insertSurvey(surveyInfo);
        mailSendService.sendMail(surveyInfo);

        return "hello";
    }

    /**
     * 설문지 페이지
     * @method get
     * @return
     */
    @GetMapping(path = "/surveyPage")
    public ModelAndView surveyPage(SurveyInfo surveyInfo) {

        return new ModelAndView("survey");
    }

    /**
     * 설문지 페이지
     * @method get
     * @return
     */
    @GetMapping(path = "/surveyPage/new")
    public ModelAndView surveyNewPage(SurveyInfo surveyInfo) {

        return new ModelAndView("surveyFinish");
    }

    @GetMapping(path = "/surveyPage/finish")
    public ModelAndView surveyFinishPage(SurveyInfo surveyInfo) {

        return new ModelAndView("surveyFinish");
    }
}
