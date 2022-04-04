package com.modu.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.modu.entity.SurveyInfo;
import com.modu.entity.Sysman;
import com.modu.service.ChartService;
import com.modu.service.SysmanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/sysman")
@ComponentScan(basePackages={"com.modu"})
public class ChartController {

    @Autowired
    private ChartService chartService;

    @Autowired
    private SysmanService sysmanService;

    /**
     * 통계, 테이블 리스트(미완성)
     * @param model
     * @return
     */
    @GetMapping(path = "/chart")
    public ModelAndView ChartPage(Model model) {

        List<SurveyInfo> dataList = chartService.findAllUsers();

        Map<String,Integer> dataMap = chartService.totalSurveyCount();

        List<Map<String, Object>> cnt = chartService.getTotalCnt();

        List<Map<String, Object>> educationList = chartService.getEducationList();

        List<Map<String, Object>> goalList = chartService.getGoalList();

        int monthCount = dataMap.get("month"); // 이번달 설문 횟수
        int todayCount = dataMap.get("today"); // 오늘 설문 횟수
        int lastMonth = dataMap.get("lastMonth"); // 저번달 대비 증감율

        Sysman count = sysmanService.getSysCount(1);

        model.addAttribute("count",count.getSysmanCount());

        model.addAttribute("dataList",dataList);
        model.addAttribute("monthCount", monthCount);
        model.addAttribute("todayCount", todayCount);
        model.addAttribute("lastMonth", lastMonth);
        model.addAttribute("totalCount", dataList.size());
        model.addAttribute("educationList", educationList);
        model.addAttribute("goalList", goalList);

        return new ModelAndView("chart");
    }

    /**
     * 테이블 리스트
     * @param model
     * @return
     */
    @GetMapping(path = "/table")
    public ModelAndView TablePage(Model model) {

        List<SurveyInfo> dataList = chartService.findAllUsers();

        Sysman count = sysmanService.getSysCount(1);

        model.addAttribute("count",count.getSysmanCount());
        model.addAttribute("dataList",dataList);

        return new ModelAndView("tables");
    }

    /**
     * 메모 저장
     * @param memo
     * @param id
     * @return
     */
    @RequestMapping(value = "/insertMemo")
    public String insertMemo(String memo, int id){

        // chart.js insertMemo()에서 메모내용, ID 넘겨 받음
        chartService.insertMemo(memo,id);

        return "hello";
    }

    /**
     * 설문 삭제
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteSurvey")
    public String deleteSurvey(int id){

        // 설문조사 삭제
        chartService.deleteSurvey(id);

        return "deleteOk";
    }

    /**
     * 차트 데이터
     * @method post
     * @return
     */
    @JsonProperty
    @RequestMapping(value = "/getChartData")
    public @ResponseBody Object getChartData() throws Exception{
        JSONArray jArray = new JSONArray();
        try {
            // 월별 그래프 결과 가져오셈

            for (int i = 29; i>=0; i--){
                    JSONObject sObject = new JSONObject();
                    sObject.put("date", i);
                    sObject.put("val", i);
                    jArray.add(sObject);
            }

        } catch (Exception e) {
            throw e;
        }
        return jArray;
    }

    /**
     * 그래프용 데이터 가져오기
     * @method
     * @return
     */
//    @PostMapping(value = "/main/amount/json")
//    public @ResponseBody Object amount30days(@RequestParam Map<String, Object> param, HttpSession session) throws Exception {
//
//        JSONArray jArray = new JSONArray();
//        String userEmail;
//
//        if(session.getAttribute("email") == null){
//            return new ModelAndView("/account/login");
//        }
//        userEmail = session.getAttribute("email").toString();
//
//        List<String> days_30 = new ArrayList<String>();
//
//        int count=1;
//        try{
//            int member_seq = (memberService.findByMemberidAndPasswdbyId(userEmail).getStore_seq()) ;
//
//            //매출 최근 30일 가져오기
//            List<Map<String, Object>> amountMonth = orderService.getAmountRecentMonth(userEmail, member_seq);
//            days_30 = Util.get30days();
//
//            // 매출이 하나도 잡히지 않았을 때
//            if(amountMonth.isEmpty()){
//                for (int i = 29; i>=0; i--){
//                    JSONObject sObject = new JSONObject();
//                    sObject.put("date", days_30.get(i));
//                    sObject.put("val", 0);
//                    jArray.add(sObject);
//                }
//            }else {
//                //문의 현황 퍼센테이지
//                for (int i = 29; i >= 0; i--) {
//                    JSONObject sObject = new JSONObject();
//
//                    if (days_30.get(i).equals(amountMonth.get(count - 1).get("create_dt"))) {
//                        sObject.put("date", days_30.get(i));
//                        sObject.put("val", amountMonth.get(count - 1).get("amount"));
//                        if (count < amountMonth.size()) {
//                            count++;
//                        }
//                    } else {
//                        sObject.put("date", days_30.get(i));
//                        sObject.put("val", 0);
//                    }
//                    jArray.add(sObject);
//                }
//            }
//        }catch(Exception e){
//            throw e;
//        }
//
//        return jArray;
//    }

    /**
     * 결제여부 변경
     * @param id
     * @return
     */
    @RequestMapping(value = "/changePay")
    public String changePay(int id){

        // chart.js changePay() ID 넘겨 받음
        chartService.changePay(id);

        return "hello";
    }

    /**
     * 담당자 변경
     * @param name
     * @param id
     * @return
     */
    @RequestMapping(value = "/changeCounselor")
    public String changeCounselor(String name, int id){

        System.out.println(name + id);
        chartService.changeCounselor(name,id);


        return "";
    }

    /**
     * 담당자 별 배부수 계산(미완)
     * @return
     */
    @RequestMapping(value = "/changeCounselor/data")
    public List<Map<String, Object>> changeCounselorCount(){

        List<Map<String, Object>> cnt = chartService.getTotalCnt();
        Map<String,String> result = new HashMap<>();

        /*for(Map<String, Object> o : cnt){
            result.put(o.get("counselor").toString(),o.get("cnt").toString());
        }*/

        return cnt;
    }

    /**
     * 관리자 기본 설문숫자 변경
     * @param count
     * @return
     */
    @RequestMapping(value = "/changeCount")
    public String changeCount(int count){


        sysmanService.chageCount(count);

        return "hello";
    }



}
