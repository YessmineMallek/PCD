package com.trainTruck.demo.Model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name="trips")
public class Trip {
	
	@Id
	private  String trip_id;
	@ManyToOne
	@JoinColumn(name = "route_id")
	 private Route route_id;
	private int service_id;
	private String trip_headsign;
	private String trip_short_name;
	@JsonIgnoreProperties({"stopsTime","route_id","trip_id"})
	@OneToMany(mappedBy = "trip_id")
	private List<StopTimes> stopsTime;
	

	

}
