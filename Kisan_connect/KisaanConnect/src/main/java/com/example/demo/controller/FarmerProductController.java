package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dummyentity.DemoAddProduct;
import com.example.demo.entity.FarmerProduct;
import com.example.demo.repository.FarmerProductRepository;
import com.example.demo.services.FarmerProductService;

import jakarta.transaction.Transactional;

@RestController
//@CrossOrigin(origins = "http://localhost:3000")
@CrossOrigin
public class FarmerProductController {

	@Autowired
	FarmerProductService fpservice;
	
	@Autowired
	FarmerProductRepository frepo;
	
	
	@PostMapping("/addProduct")
	public FarmerProduct addFarmerProduct(@RequestBody DemoAddProduct product) {
		return fpservice.addProduct(product);
	}
	
	@GetMapping("/getProductBySid/{sid}")
	public List<FarmerProduct> getAllProductBySid(@PathVariable int sid){
		return fpservice.getProductBysid(sid);
	}
	
	
	@GetMapping("/getAllFarmerProduct")
	public List<FarmerProduct> getAllFarProduct(){
		return frepo.findAll();
	}
	

	@Transactional
	@DeleteMapping("/deleteProduct/{id}")
	public int deleteProduct(@PathVariable int id) {
		FarmerProduct f= frepo.findById(id).get();
		try{
			frepo.delete(f);
		}catch(Exception e) {
			return 0;
		}
		return 1;
	}
	
	
}