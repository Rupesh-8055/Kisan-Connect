package com.example.demo.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "variety") // Replace with your actual table name
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Variety {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer vid;
    
    private String vname;

    @OneToMany(mappedBy = "variety")
    private List<FarmerProduct> farmerProducts;

    // Getters and Setters
}