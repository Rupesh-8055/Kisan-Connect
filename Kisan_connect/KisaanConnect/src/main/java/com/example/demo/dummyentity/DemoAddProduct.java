package com.example.demo.dummyentity;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DemoAddProduct {

	int sid,pid,stock,vid;
	BigDecimal price;
}
