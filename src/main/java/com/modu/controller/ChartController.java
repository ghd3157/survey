package com.modu.controller;

import com.modu.entity.SurveyInfo;
import com.modu.service.ChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/sysman")
@ComponentScan(basePackages={"com.modu"})
public class ChartController {

    @Autowired
    private ChartService chartService;

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

        int monthCount = dataMap.get("month"); // 이번달 설문 횟수
        int todayCount = dataMap.get("today"); // 오늘 설문 횟수
        int lastMonth = dataMap.get("lastMonth"); // 저번달 대비 증감율


        model.addAttribute("dataList",dataList);
        model.addAttribute("monthCount", monthCount);
        model.addAttribute("todayCount", todayCount);
        model.addAttribute("lastMonth", lastMonth);
        model.addAttribute("totalCount", dataList.size());

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






}
