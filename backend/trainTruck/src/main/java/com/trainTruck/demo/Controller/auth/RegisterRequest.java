package com.trainTruck.demo.Controller.auth;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RegisterRequest {

	private String firstName;
	private String lastName;
	private String phoneNumber;
	private String password_user;
	private int activated;
	

}