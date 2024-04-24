package com.trainTruck.demo.Controller;

import com.trainTruck.demo.Model.Reclamation;
import com.trainTruck.demo.Repository.ReclamationRepo;
import com.trainTruck.demo.Service.ReclamationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
@RequestMapping(path="/api/v1/reclamation")
public class ReclamationController {
    
	@Autowired
    private ReclamationService reclamationService;

    @PostMapping("/add")
    public ResponseEntity<String> addReclamation(
    		@RequestParam("file") MultipartFile file,
    		@RequestParam("user") String phoneNumber,
    		@RequestParam("route") String routeLongName,
    		@RequestParam("emotion") String emotion,
    		@RequestParam("description") String desc)
    {
    	Boolean rep=reclamationService.saveReclamation(file, phoneNumber, routeLongName, emotion, desc);
    	
    	
    	if(rep==true)
    	{
    		return ResponseEntity.ok().body("saved");
    		
    		
    	}else
    	{
    		return ResponseEntity.notFound().build();
    	}
    }



}
