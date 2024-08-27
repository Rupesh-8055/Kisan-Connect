package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.FarmerProduct;
import com.example.demo.entity.Product;
import com.example.demo.entity.Variety;
import com.example.demo.services.ProductService;
import com.example.demo.services.VarietyService;

@RestController
//@CrossOrigin(origins = "http://localhost:3000")
@CrossOrigin
public class ProductController {

	@Autowired
	ProductService pservice;
	
	
	@Autowired
	VarietyService vservice;
	
	@GetMapping("/getAllProduct")
	public List<Product> getAllProduct(){
		return pservice.getAllProduct();
	}
	
	@GetMapping("/getAllVariety/{id}")
	public List<Variety> getAllVariety(@PathVariable int id){
		return vservice.getAllVariety(id);
	}
	
	
	
	
}