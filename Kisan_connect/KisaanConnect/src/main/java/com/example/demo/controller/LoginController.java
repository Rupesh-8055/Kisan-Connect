package com.example.demo.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dummyentity.DemoRegBuyer;
import com.example.demo.entity.Buyer;
import com.example.demo.entity.User;
import com.example.demo.repository.BuyerRepository;
import com.example.demo.repository.UserRepository;

@RestController
@CrossOrigin
public class LoginController {

	
}
