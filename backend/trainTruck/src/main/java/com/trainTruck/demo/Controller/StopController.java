package com.trainTruck.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trainTruck.demo.Model.Stop;
import com.trainTruck.demo.Service.StopService;

@RestController
@RequestMapping("/api/v1/stops")
public class StopController {
	
	@Autowired 
	StopService stopService;
	
	@GetMapping()
	public List<Stop> getAll()
	{
		return stopService.getStops();
	}
	
	

}