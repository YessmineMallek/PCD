package com.trainTruck.demo.Service;

import com.fasterxml.jackson.databind.deser.Deserializers.Base;
import com.trainTruck.demo.Model.Reclamation;
import com.trainTruck.demo.Model.Route;
import com.trainTruck.demo.Model.User;
import com.trainTruck.demo.Repository.ReclamationRepo;
import com.trainTruck.demo.Repository.RouteRepo;
import com.trainTruck.demo.Repository.UserRepository;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;
@Service
public class ReclamationService {
    @Autowired
    private ReclamationRepo reclamationRep;
    @Autowired
    private UserRepository userRepository;
   
    @Autowired
    private RouteRepo routeRepository;
    
    public static String UPLOAD_DIRECTORY = System.getProperty("user.dir") + "/uploads";

    public List<Reclamation> getReclamation()
    {
        return reclamationRep.findAll();
    }
    public boolean saveReclamation(MultipartFile file,String userPhone,String routeLongName,String emotion,String description)
    {
    	User user=userRepository.findByPhoneNumberAndActivated(userPhone, 1).orElseThrow();
    	Route route=routeRepository.findByRouteLongName(routeLongName);
    	
    	StringBuilder fileNames = new StringBuilder();
        
    	Path fileNameAndPath = Paths.get(UPLOAD_DIRECTORY, file.getOriginalFilename());
        fileNames.append(file.getOriginalFilename());
        try {
			Files.write(fileNameAndPath, file.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	        return false;

		}
        Reclamation rec=new Reclamation();
        rec.setRoute(route);
        rec.setDescription(description);
        rec.setEmotion(emotion);
        rec.setUser(user);
		rec.setImage(fileNames.toString());
		reclamationRep.save(rec);

        return true;
    	
    	
    
    
    }
}
