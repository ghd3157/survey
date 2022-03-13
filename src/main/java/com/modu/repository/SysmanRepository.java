package com.modu.repository;

import com.modu.entity.Sysman;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SysmanRepository extends JpaRepository<Sysman, Long> {

    Sysman findBySysNum(int num);
}
