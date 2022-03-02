package com.modu.service;

import com.modu.entity.SurveyInfo;
import com.modu.repository.SurveyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class ChartService {

    @Autowired
    private SurveyRepository surveyRepository;

    /**
     * 데이터 변환
     * @return
     */
    @Transactional
    public List<SurveyInfo> findAllUsers(){

        // DB에서 모든 유저 데이터 가져옴
        List<SurveyInfo> dataList = surveyRepository.findAll();

        return dataList;
    }

    @Transactional
    public void insertMemo(String memo , int id){

        // ID로 유저정보 가져와서 메모 insert
        SurveyInfo survey = surveyRepository.findByUserNum(id);

        survey.setMemo(memo);

    }

    @Transactional
    public void changePay(int id){

        // ID로 유저정보 가져와서 메모 insert
        SurveyInfo survey = surveyRepository.findByUserNum(id);

        if(survey.getPay() == 0){
            survey.setPay(1);
        } else if(survey.getPay() == 1){
            survey.setPay(0);
        }

    }

}
