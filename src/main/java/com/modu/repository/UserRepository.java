package com.modu.repository;

import com.modu.user.UserInfo;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserInfo, Long> {

    List<UserInfo> findAll();

}
