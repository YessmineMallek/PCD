package com.trainTruck.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trainTruck.demo.Model.Route;
import com.trainTruck.demo.Model.StopTimes;
import com.trainTruck.demo.Repository.RouteRepo;
import com.trainTruck.demo.Repository.Stop_timesRepo;

@Service
public class Stop_timesService {

	@Autowired 
	Stop_timesRepo stopTimerep ;
	
	public List<StopTimes> findStopsTime() {
		return stopTimerep.findAll();
	}
}