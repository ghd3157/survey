package com.modu.service;

import com.modu.entity.SurveyInfo;
import com.modu.entity.Sysman;
import com.modu.repository.SysmanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class SysmanService {

    @Autowired
    private SysmanRepository sysmanRepository;

    /**
     * 기본설문 횟수
     * @param num
     * @return
     */
    @Transactional
    public Sysman getSysCount(int num){

        Sysman sysCount = sysmanRepository.findBySysNum(num);

        return sysCount;
    }

    /**
     * 기본설문 횟수 변경
     * @param count
     */
    @Transactional
    public void chageCount(int count){

        // 디폴트 카운트 insert
        Sysman sysman = sysmanRepository.findBySysNum(1);

        sysman.setSysmanCount(count);

    }
}
