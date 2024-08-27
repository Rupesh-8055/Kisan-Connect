package com.example.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "orders")
public class Order {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer oid;
    
    private Date date;
    private BigDecimal totAmt;

    @ManyToOne
    @JoinColumn(name = "fpid")
    @JsonIgnore
    private FarmerProduct farmerProduct;

    @ManyToOne
    @JoinColumn(name = "bid")
    @JsonIgnore
    private Buyer buyer;

    @OneToMany(mappedBy = "order")
    @JsonIgnore
    private List<OrderDetails> orderDetails;

    // Getters and Setters
}
