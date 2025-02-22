package com.trainTruck.demo.Controller;

import java.util.List;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
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
	@GetMapping("/agence/{agencyId}")
	public List<Route> getRoutesByAgencyID(@PathVariable(value="agencyId") int id)
	{
		return routeService.findRoutesByAgencyId(id);
	}
	@GetMapping("/{routeId}")
	public Route getRoute(@PathVariable(value="routeId") int id)
	{
		return routeService.findRoute(id);
	}
	@GetMapping("/{destination}/{origine}")
	public ResponseEntity<Route> getRouteByDestinationOrigine(@PathVariable(value="destination") String destination,@PathVariable(value="origine") String origine)
	{
		Route  route= routeService.findRouteByLongName(destination,origine);
		if(route!= null)
			return ResponseEntity.ok(route);
		else 
			return ResponseEntity.notFound().build();
		
	}
}
