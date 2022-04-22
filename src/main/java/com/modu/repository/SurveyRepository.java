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

    @Query("select s.education as education, count(s.education) as cnt from SurveyInfo s group by s.education")
    List<Map<String, Object>> findEducationGroupBy();

    @Query("select s.objective as objective, count(s.objective) as cnt from SurveyInfo s group by s.objective")
    List<Map<String, Object>> findGoalGroupBy();

    @Query("select s.objective from survey s WHERE MONTH(s.regiDate) = MONTH(CURRENT_DATE()) AND YEAR(s.regiDate) = YEAR(CURRENT_DATE) ")
    List<Map<String, Object>> findMonthlyData();

}
