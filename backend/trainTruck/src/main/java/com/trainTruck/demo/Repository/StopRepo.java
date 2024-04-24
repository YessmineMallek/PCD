package com.trainTruck.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trainTruck.demo.Model.Stop;
import com.trainTruck.demo.Model.User;

public interface StopRepo extends JpaRepository<Stop, Integer> {

}