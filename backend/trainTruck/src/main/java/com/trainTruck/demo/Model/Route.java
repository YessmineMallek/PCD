package com.trainTruck.demo.Model;

import java.util.List;

import org.hibernate.annotations.ColumnTransformer;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="routes")
public class Route {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "route_id")
	private int route_id;
	@Column(name="agancy_id")
	private int agancy;
	@JsonIgnoreProperties("route_id")
	@OneToMany(mappedBy = "route_id")
	private List<Trip> trips;
	
	@Column(name="route_short_name")
	private String routeShortName;
	
	
	@Column(name ="route_long_name" )
	private String routeLongName;
	
	private String route_desc;
	private String route_url;
	public String getRouteLongName()
	{
		return routeLongName.toLowerCase();
	}
	
	
	
	
	
}
