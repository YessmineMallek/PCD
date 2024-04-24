package com.trainTruck.demo.Service;

import com.trainTruck.demo.Model.Reclamation;
import com.trainTruck.demo.Repository.ReclamationRepo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ReclamationService {
    @Autowired
    private ReclamationRepo reclamationRep;

    public List<Reclamation> getReclamation()
    {
        return reclamationRep.findAll();
    }
}
