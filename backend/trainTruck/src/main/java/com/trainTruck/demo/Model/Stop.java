package com.trainTruck.demo.Model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="stops")
public class Stop {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int stop_id;
	
	@Column(name="stop_code")
	private String stop_code;
	
	private String stop_name;
	
	private String stop_desc;
	
	@Column(name="stop_lat")
	private double stop_lat=0.0;
	
	@Column(name="stop_lon")
	private double stop_lon=0.0;
	
	private String zone_id;
	private String stop_url;
	private String location_type;
	private String parent_station;
	


}