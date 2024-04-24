package com.trainTruck.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.trainTruck.demo.Model.StopTimes;
@Repository
public interface Stop_timesRepo extends JpaRepository<StopTimes, Integer> {

}