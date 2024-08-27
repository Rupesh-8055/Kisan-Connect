package com.example.demo.entity;

import java.math.BigDecimal;
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
@Table(name = "farmer_product")
public class FarmerProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer fpid;

    private Integer stock;
    private BigDecimal price;

    @ManyToOne
    @JoinColumn(name = "sid")
    @JsonIgnoreProperties({"farmerProducts", "user"}) // Avoid recursion with farmer and user details
    private Farmer farmer;

    @ManyToOne
    @JoinColumn(name = "pid")
    @JsonIgnoreProperties("farmerProducts") // Avoid recursion with product details
    private Product product;

    @ManyToOne
    @JoinColumn(name = "vid")
    @JsonIgnoreProperties("farmerProducts") // Avoid recursion with variety details
    private Variety variety;

    @OneToMany(mappedBy = "farmerProduct")
    @JsonIgnoreProperties("farmerProduct") // Avoid recursion with cart and order details
    private List<Cart> carts;

    @OneToMany(mappedBy = "farmerProduct")
    @JsonIgnoreProperties("farmerProduct") // Avoid recursion with cart and order details
    private List<Order> orders;
}