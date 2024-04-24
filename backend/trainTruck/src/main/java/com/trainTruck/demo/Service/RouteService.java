package com.trainTruck.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trainTruck.demo.Model.Route;
import com.trainTruck.demo.Repository.RouteRepo;

@Service
public class RouteService {
	@Autowired 
	RouteRepo routeRepo ;
	
	public List<Route> findRoutes() {
		return routeRepo.findAll();
	}
	public List<Route> findRoutesByAgencyId(int id) {
		return routeRepo.findByAgancy(id);
	}
	public Route findRoute(int id) {
		return routeRepo.findById(id).orElseThrow();
	}
	
	public Route findRouteByLongName(String destination,String origine) {
		String longName=destination.toLowerCase().concat("-".concat(origine.toLowerCase()));
		Route route= routeRepo.findByRouteLongName(longName);
		
		if(route==null)
		{
			longName=origine.toLowerCase().concat("-".concat(destination.toLowerCase()));
			System.out.println(longName);

			route=routeRepo.findByRouteLongName(longName);		
		}
		return route;
		
	}
}
