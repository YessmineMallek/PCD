package com.trainTruck.demo.Controller;

import com.trainTruck.demo.Model.Reclamation;
import com.trainTruck.demo.Repository.ReclamationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(path="/reclamation")
public class ReclamationController {
    @Autowired
    private ReclamationRepo reclamationRepo;

    @PostMapping("/add")
    public Reclamation addReclamation(@Validated @RequestBody Reclamation reclamation) {
        return reclamationRepo.save(reclamation);
    }



}
