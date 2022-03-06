package com.modu.repository;

import com.modu.entity.SurveyInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface SurveyRepository extends JpaRepository<SurveyInfo, Long> {

    List<SurveyInfo> findAll();

    SurveyInfo findByUserNum(int id);

    @Query("select count(s.counselor) from SurveyInfo s where s.counselor = :counselor")
    Integer findCnt(@Param("counselor") String counselor);

    @Query("select s.counselor as counselor, count(s.counselor) as cnt from SurveyInfo s group by s.counselor")
    List<Map<String, Object>> findCntGroupBy();
}
