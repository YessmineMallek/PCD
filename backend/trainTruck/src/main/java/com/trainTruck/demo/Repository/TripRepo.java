package com.trainTruck.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.trainTruck.demo.Model.Trip;

@Repository
public interface TripRepo extends JpaRepository<Trip, String> {

}