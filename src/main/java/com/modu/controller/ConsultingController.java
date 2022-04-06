package com.modu.controller;

import com.modu.entity.SurveyInfo;
import com.modu.entity.Sysman;
import com.modu.service.ChartService;
import com.modu.service.SurveyService;
import com.modu.service.SysmanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/consulting")
@ComponentScan(basePackages={"com.modu"})
public class ConsultingController {

    @Autowired
    private SurveyService surveyService;

    @Autowired
    private SysmanService sysmanService;

    @Autowired
    private ChartService chartService;

    /**
     * 상담 메인 페이지
     * @method get
     * @return
     */
    @GetMapping(path = "/mainPage")
    public ModelAndView consultingPage(Model model) {

        Sysman count = sysmanService.getSysCount(1);

        Map<String,Integer> dataMap = chartService.totalSurveyCount();

        List<SurveyInfo> dataList = chartService.findAllUsers();

        int todayCount = dataMap.get("today"); // 오늘 설문 횟수

        int totalCount = count.getSysmanCount() + todayCount; // 관리자 지정 신청수 + 오늘 신청수

        int restCount = 50-totalCount; // 잔여 신청수

        model.addAttribute("totalCount",totalCount);
        model.addAttribute("restCount",restCount);
        model.addAttribute("totalRealCount",dataList.size() + 1068);

        return new ModelAndView("consulting");
    }

}
