package com.modu.service;

import com.modu.repository.SurveyRepository;
import com.modu.entity.SurveyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Service
public class SurveyService {

    @Autowired
    private SurveyRepository surveyRepository;

    @Transactional
    public List<SurveyInfo> findAll(){

        return surveyRepository.findAll();
    }

    @Transactional
    public SurveyInfo insertSurvey(SurveyInfo surveyInfo){

        SurveyInfo survey = new SurveyInfo();
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        survey.setName(surveyInfo.getName());
        survey.setPhone(surveyInfo.getPhone());
        survey.setObjective(surveyInfo.getObjective());
        survey.setEducation(surveyInfo.getEducation());
        survey.setAdvice("전화상담");
        survey.setMemo(surveyInfo.getMemo());
        survey.setRegiDate(date.format(new Date()));


        return surveyRepository.save(survey);
    }


}
