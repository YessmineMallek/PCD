package com.trainTruck.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trainTruck.demo.Model.StopTimes;
import com.trainTruck.demo.Repository.Stop_timesRepo;
import com.trainTruck.demo.Service.Stop_timesService;

@RestController
@RequestMapping("/api/v1/stopsTimes")
public class StopTimesController {
	@Autowired
	private Stop_timesService stopTimesService;
	
	
	@GetMapping
	public List<StopTimes> getStopTimes()
	{
		return stopTimesService.findStopsTime();
	}
}