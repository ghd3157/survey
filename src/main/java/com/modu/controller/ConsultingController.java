package com.modu.controller;

import com.modu.entity.SurveyInfo;
import com.modu.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping("/consulting")
@ComponentScan(basePackages={"com.modu"})
public class ConsultingController {

    @Autowired
    private SurveyService surveyService;

    /**
     * 상담 메인 페이지
     * @method get
     * @return
     */
    @GetMapping(path = "/mainPage")
    public ModelAndView consultingPage(SurveyInfo surveyInfo) {

        return new ModelAndView("consulting");
    }

}
