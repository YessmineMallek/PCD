package com.trainTruck.demo.Controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Set;

import org.opentripplanner.client.OtpApiClient;
import org.opentripplanner.client.model.Coordinate;
import org.opentripplanner.client.model.RequestMode;
import org.opentripplanner.client.model.Route;
import org.opentripplanner.client.model.TripPlan;
import org.opentripplanner.client.parameters.TripPlanParameters;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/demo-controller")
public class DemoController {
	
	

	@GetMapping
	public ResponseEntity<TripPlan> sayHello() throws IOException
	{
		Coordinate ORIGIN = new Coordinate(36.79476927,10.18038057);
		Coordinate DEST = new Coordinate(36.69827887,10.42151708);
		OtpApiClient client = new OtpApiClient(ZoneId.of("Africa/Tunis"), "http://localhost:8080");

		var result = client.plan(
		      TripPlanParameters.builder()
		        .withFrom(ORIGIN)
		        .withTo(DEST)
		        .withTime(LocalDateTime.now())
		        .withModes(Set.of(RequestMode.TRANSIT))
		        .build()
		    );
		return ResponseEntity.ok(result);
	}
	@GetMapping("/routes")
	public ResponseEntity<List<Route>> getRoutes() throws IOException
	{
		
		OtpApiClient client = new OtpApiClient(ZoneId.of("Africa/Tunis"), "http://localhost:8080");

		 var routes = client.routes();
		return ResponseEntity.ok(routes);
	}
}