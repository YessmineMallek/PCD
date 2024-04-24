package com.trainTruck.demo.Repository;


import com.trainTruck.demo.Model.Reclamation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReclamationRepo extends JpaRepository<Reclamation,Integer> {

}
