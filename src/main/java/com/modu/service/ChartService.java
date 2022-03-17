package com.modu.service;

import com.modu.entity.SurveyInfo;
import com.modu.repository.SurveyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ChartService {

    @Autowired
    private SurveyRepository surveyRepository;

    /**
     * 모든 설문 정보
     * @return
     */
    @Transactional
    public List<SurveyInfo> findAllUsers(){

        // DB에서 모든 유저 데이터 가져옴
        List<SurveyInfo> dataList = surveyRepository.findAll();

        return dataList;
    }

    /**
     * 메모 저장
     * @param memo
     * @param id
     */
    @Transactional
    public void insertMemo(String memo , int id){

        // ID로 유저정보 가져와서 메모 insert
        SurveyInfo survey = surveyRepository.findByUserNum(id);

        survey.setMemo(memo);

    }

    /**
     * 결제여부 변경
     * @param id
     */
    @Transactional
    public void changePay(int id){

        // ID로 유저정보 가져와서 결제여부 insert
        SurveyInfo survey = surveyRepository.findByUserNum(id);

        if(survey.getPay() == 0){
            survey.setPay(1);
        } else if(survey.getPay() == 1){
            survey.setPay(0);
        }

    }

    /**
     * 총 설문 정보(이번달, 오늘, 지난달 대비, 총 누적)
     * @return
     */
    @Transactional
    public HashMap<String, Integer> totalSurveyCount(){

        List<SurveyInfo> dataList = surveyRepository.findAll();
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        String thisMonth = date.format(new Date()).substring(5,7); // 이번달 ex) 03
        String today = date.format(new Date()).substring(0,10); // 오늘 ex) 2022-03-06

        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.MONTH, -1); // 현재 월의 -1

        String resultDate = date.format(cal.getTime());
        String lastMonth = resultDate.substring(5,7); // 이전달


        HashMap<String, Integer> dataMap = new HashMap<>();

        int monthCount = 0;
        int todayCount = 0;
        int lastMonthCount = 0;

        // 설문 날짜가 이번달과 일치하면 monthCount 1증가
        for (SurveyInfo s : dataList){
            if(s.getRegiDate().substring(5,7).equals(thisMonth)){
                monthCount ++;
            }

            // 설문 날짜가 오늘이면 todayCount 1증가
            if(s.getRegiDate().substring(0,10).equals(today)){
                todayCount ++;
            }
            // 저번달 설문 횟수
            if(s.getRegiDate().substring(5,7).equals(lastMonth)){
                lastMonthCount ++;
            }
        }

        // 증감율 구해오는 함수 getPercentage()
        double result = getPercentage(lastMonthCount,monthCount);

        dataMap.put("month",monthCount);
        dataMap.put("today",todayCount);
        dataMap.put("lastMonth", (int)result);

        return dataMap;
    }


    public double getPercentage(int pre, int now){
        double dPre = 0d;
        double dNow = 0d;

        if(pre==0){
            dPre = 1d;
        } else {
            dPre = (double)pre;
        }

        if(now==0){
            dNow = 1d;
        } else {
            dNow = (double)now;
        }

        double result = 0d;

        if(pre != 0 && now != 0){
            result = ((dNow-dPre)/dPre)*100d;
        }

        return result;

    }

    /**
     * 담당자 변경
     * @param name
     * @param id
     */
    @Transactional
    public void changeCounselor(String name,int id){

        // ID로 유저정보 가져와서 담당자 insert
        SurveyInfo survey = surveyRepository.findByUserNum(id);

        survey.setCounselor(name);

    }

    /**
     * 담당자별 데이터 호출
     * @return
     */
    @Transactional
    public List<Map<String, Object>> getTotalCnt(){

        //Integer cnt = surveyRepository.findCnt("홍길동");

        List<Map<String, Object>> cntGroupby = surveyRepository.findCntGroupBy();



        return cntGroupby;
    }

    /**
     * 학력통계
     * @return
     */
    @Transactional
    public List<Map<String, Object>> getEducationList(){ return surveyRepository.findEducationGroupBy(); }

    /**
     * 학습목표통계
     * @return
     */
    @Transactional
    public List<Map<String, Object>> getGoalList(){ return surveyRepository.findGoalGroupBy(); }

}
