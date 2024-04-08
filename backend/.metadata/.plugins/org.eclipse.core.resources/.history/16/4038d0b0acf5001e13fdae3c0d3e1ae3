package com.trainTruck.demo.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trainTruck.demo.Model.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	
	Optional<User> findByPhoneNumber(String phoneNumber);

	


}
