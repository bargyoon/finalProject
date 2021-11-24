package com.kh.spring.market.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.service.ShopService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("market/shop")
public class ShopController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final ShopService shopService;
	
	@GetMapping("prd-list")
	public void prdList(String category, Model model) {
		List<Product> prdList = shopService.selectPrdByCategory(category);
		String categoryWord = shopService.categoryToKor(category);
		
		for (Product product : prdList) {
			logger.debug("product : {}", product);
		}
		
		model.addAttribute("categoryWord", categoryWord);
		model.addAttribute("prdList", prdList);
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
