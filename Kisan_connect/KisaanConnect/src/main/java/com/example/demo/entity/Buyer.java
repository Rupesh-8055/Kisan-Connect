package com.example.demo.entity;
import java.util.List;

import jakarta.persistence.Column;
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
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Buyer {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bid;
    
    private String fname;
    private String lname;
    private String email;
    private String address;
    private String contact;

    @ManyToOne
    @JoinColumn(name = "uid")
    private User user;

    @OneToMany(mappedBy = "buyer")
    private List<Cart> carts;

    @OneToMany(mappedBy = "buyer")
    private List<Order> orders;

    // Getters and Setters
}