package com.trainTruck.demo.Controller.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trainTruck.demo.Service.AuthenticationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {
	
	@Autowired
	private  AuthenticationService service;
	@PostMapping("/register")
	public ResponseEntity<AuthenticationResponse> register (@RequestBody RegisterRequest request)
	{
		System.out.println(request);
		AuthenticationResponse res=service.register(request);
		if(res.getToken()==null)
		{
			return ResponseEntity.status(409).body(res);

		}else
		{
			return ResponseEntity.ok(res);

		}
	}
	
	
	@PostMapping("/authenticate")
	public ResponseEntity<AuthenticationResponse> authenticate (@RequestBody AuthenticationRequest request)
	{
		System.out.println(request);
		return  ResponseEntity.ok(service.authenticate(request));
	}

}
