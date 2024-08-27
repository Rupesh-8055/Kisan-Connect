package com.example.demo.entity;

import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "farmer")
public class Farmer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sid;

    private String fname;
    private String lname;
    private String email;
    private String regNo;
    private String contact;
    private String name;

    @ManyToOne
    @JoinColumn(name = "uid")
    @JsonIgnoreProperties({"role", "password"}) // Ignore role and password for security
    private User user;

    @OneToMany(mappedBy = "farmer")
    @JsonIgnoreProperties("farmer") // Avoid recursion with farmerProducts
    private List<FarmerProduct> farmerProducts;
}