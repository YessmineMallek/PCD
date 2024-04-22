package com.trainTruck.demo.Repository;


import com.trainTruck.demo.Model.Reclamation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReclamationRepo extends JpaRepository<Reclamation,Integer> {

}
