package com.modu.service;

import com.modu.repository.SurveyRepository;
import com.modu.entity.SurveyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;


@Service
public class SurveyService {

    @Autowired
    private SurveyRepository surveyRepository;

    @Transactional
    public List<SurveyInfo> findAll(){
        List<SurveyInfo> userInfoList = new ArrayList<>();
        surveyRepository.findAll();
        return userInfoList;
    }

    @Transactional
    public SurveyInfo insertSurvey(SurveyInfo surveyInfo){

        SurveyInfo survey = new SurveyInfo();

        survey.setName(surveyInfo.getName());
        survey.setPhone(surveyInfo.getPhone());
        survey.setObjective(surveyInfo.getObjective());
        survey.setEducation(surveyInfo.getEducation());
        survey.setAdvice(surveyInfo.getAdvice());
        survey.setMemo(surveyInfo.getMemo());

        return surveyRepository.save(survey);
    }


}
