package com.trainTruck.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trainTruck.demo.Model.Trip;
import com.trainTruck.demo.Repository.TripRepo;

@Service
public class TripService {
	
	@Autowired 
	TripRepo tripRep ;
	
	public List<Trip> findTrips() {
		return tripRep.findAll();
	}

}
