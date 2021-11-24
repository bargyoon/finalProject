package com.kh.spring.market.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.market.model.dto.Order;

@Controller
@RequestMapping("market/shop")
public class ShopController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("")
	public String shop() {
		return "/market/shop/prd-list";
	}
	
	@GetMapping("event-list")
	public void eventList() {}

	@GetMapping("event-detail")
	public void eventDetail() {}

	@GetMapping("prd-detail")
	public void prdDetail() {}

	@PostMapping("buy-test")
	public void buyTest(@RequestBody Order order){
		logger.debug("order : {}", order);
	}
	
}
