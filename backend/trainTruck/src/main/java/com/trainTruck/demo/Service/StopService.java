package com.trainTruck.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trainTruck.demo.Model.Stop;
import com.trainTruck.demo.Repository.StopRepo;


@Service
public class StopService {
	
	@Autowired 
	StopRepo stopRep ;
	
	public List<Stop> getStops() {
		return stopRep.findAll();
	}
}
