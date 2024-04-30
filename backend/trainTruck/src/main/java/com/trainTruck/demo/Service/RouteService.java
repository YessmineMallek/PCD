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
		String longName=destination.trim().toLowerCase().concat("-".concat(origine.trim().toLowerCase()));
		String longName2=origine.trim().toLowerCase().concat("-".concat(destination.trim().toLowerCase()));
			System.out.println(longName);
		List<Route> routes= routeRepo.findAll();
		
		for(Route ele :routes)
		{
			if(ele.getRouteLongName().equals(longName.toLowerCase()) || ele.getRouteLongName().equals(longName2.toLowerCase()))
			{
				return ele;
			}
		}
		
		return null;
		
	}
}
