package com.trainTruck.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trainTruck.demo.Model.User;
import com.trainTruck.demo.Repository.UserRepository;

@Service
public class UserService {

	
	@Autowired
	private UserRepository userRepo;
	
	public User updateUser(User userToUdate,String phoneNumber)
	{
		try {
			var user=userRepo.findByPhoneNumberAndActivated(phoneNumber, 1).orElseThrow();
			user.setFirstName(userToUdate.getFirstName());
			user.setLastName(userToUdate.getLastName());
			user.setActivated(userToUdate.getActivated());
			var saved=userRepo.save(user);
			return saved;
	
		}catch(Exception ex)
		{
			if(ex.getClass()==java.util.NoSuchElementException.class)
				System.out.println("Compte déactiver");
			System.out.println(ex);
			return null;
		}
		
	}
	
	public User getUserByPhone(String phoneNumber)
	{
		try {
			return userRepo.findByPhoneNumberAndActivated(phoneNumber, 1).orElseThrow();
	
		}catch(Exception ex)
		{
			if(ex.getClass()==java.util.NoSuchElementException.class)
				System.out.println("Compte déactiver");
			System.out.println(ex);
			return null;
		}
	}
}