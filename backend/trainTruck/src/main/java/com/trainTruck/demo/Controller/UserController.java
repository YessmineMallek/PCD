package com.trainTruck.demo.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trainTruck.demo.Model.User;
import com.trainTruck.demo.Service.UserService;

@RestController
@RequestMapping("/api/v1/users")
public class UserController {

	
	@Autowired
	private UserService userService;
	
	@GetMapping("/{phoneNumber}")
	public ResponseEntity<User> findUserByPhone(@PathVariable(value="phoneNumber") String userPhone)
	{
		var rep=userService.getUserByPhone(userPhone);
		if(rep!=null)
			return ResponseEntity.ok(rep);
		return ResponseEntity.notFound().build();
	}
	
	
	@PostMapping("/update/{userPhone}")
	public ResponseEntity<User> userUpdate(@PathVariable(value="userPhone") String userPhone,@RequestBody User userToUpdate)
	{
		var rep=userService.updateUser(userToUpdate,userPhone);
		if(rep!=null)
			return ResponseEntity.ok(rep);
		return ResponseEntity.notFound().build();
	}
}