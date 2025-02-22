package com.trainTruck.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trainTruck.demo.Model.Trip;
import com.trainTruck.demo.Service.TripService;

@RestController
@RequestMapping("/api/v1/trips")
public class TripController {
	
	@Autowired
	private TripService tripService;
	
	@GetMapping
	public List<Trip> getTrips()
	{
		return tripService.findTrips();
	}

}