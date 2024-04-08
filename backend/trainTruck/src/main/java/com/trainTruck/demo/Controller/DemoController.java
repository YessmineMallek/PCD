package com.trainTruck.demo.Controller;

import java.io.IOException;
import java.time.ZoneId;
import java.util.List;

import org.opentripplanner.client.OtpApiClient;
import org.opentripplanner.client.model.Coordinate;
import org.opentripplanner.client.model.Route;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/demo-controller")
public class DemoController {
	
	

	@GetMapping
	public ResponseEntity<String> sayHello()
	{
		return ResponseEntity.ok("hello from secured endpoint");
	}

}
