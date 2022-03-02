package com.modu.repository;

import com.modu.entity.SurveyInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SurveyRepository extends JpaRepository<SurveyInfo, Long> {

    List<SurveyInfo> findAll();

    SurveyInfo findByUserNum(int id);

}
