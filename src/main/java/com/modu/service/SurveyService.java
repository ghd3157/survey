package com.modu.service;

import com.modu.repository.SurveyRepository;
import com.modu.entity.SurveyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        survey.setPhone(surveyInfo.getPhone());
        survey.setObjective(surveyInfo.getObjective());
        survey.setEducation(surveyInfo.getEducation());
        survey.setAdvice(surveyInfo.getAdvice());
        survey.setMemo(surveyInfo.getMemo());
        survey.setRegiDate(date.format(new Date()));


        return surveyRepository.save(survey);
    }


}
