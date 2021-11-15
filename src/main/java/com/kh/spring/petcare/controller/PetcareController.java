package com.kh.spring.petcare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("petcare")
public class PetcareController {

	//행동의미
	@GetMapping("action/dog/eyes")
	public void actionDogEyes(){}
	
	@GetMapping("action/dog/mouse")
	public void actionDogMouse(){}
	
	@GetMapping("action/dog/ears")
	public void actionDogEars(){}
	
	@GetMapping("action/dog/tail")
	public void actionDogTail(){}
	
	@GetMapping("action/dog/body")
	public void actionDogBody(){}
	
	@GetMapping("action/cat/eyes")
	public void actionCatEyes(){}
	
	@GetMapping("action/cat/mouse")
	public void actionCatMouse(){}
	
	@GetMapping("action/cat/ears")
	public void actionCatEars(){}
	
	@GetMapping("action/cat/tail")
	public void actionCatTail(){}
	
	@GetMapping("action/cat/body")
	public void actionCatBody(){}
	
	@GetMapping("food")
	public void foodForm(){}
	
	@GetMapping("food/fruit")
	public void fruitForm(){}
	
	@GetMapping("food/beef")
	public void beefForm(){}
	
	@GetMapping("vaccine/cat")
	public void vaccineCatForm(){}
	
	@GetMapping("vaccine/dog")
	public void vaccineDogForm(){}
}
