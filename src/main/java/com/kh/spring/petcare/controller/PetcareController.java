package com.kh.spring.petcare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("petcare")
public class PetcareController {

	@GetMapping("action")
	public void actionForm(){}
	
	@GetMapping("food")
	public void foodForm(){}
	
	@GetMapping("food/fruit")
	public void fruitForm(){}
	
	@GetMapping("food/beef")
	public void beefForm(){}
	
	@GetMapping("vaccine")
	public void vaccineForm(){}
}
