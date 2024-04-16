package com.trainTruck.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trainTruck.demo.Model.Route;
import com.trainTruck.demo.Service.RouteService;

@RestController
@RequestMapping("/api/v1/routes")
public class RouteController {

	@Autowired
	private RouteService routeService;
	
	@GetMapping
	public List<Route> getRoutes()
	{
		return routeService.findRoutes();
	}
	@GetMapping("/{agencyId}")
	public List<Route> getRoutesByAgencyID(@PathVariable(value="agencyId") int id)
	{
		return routeService.findRoutesByAgencyId(id);
	}
}
