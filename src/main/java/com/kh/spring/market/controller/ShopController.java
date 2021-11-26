	package com.kh.spring.market.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.prdListSet;
import com.kh.spring.market.model.service.ShopService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("market/shop")
public class ShopController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final ShopService shopService;
	
	@GetMapping("prd-list")
	public void prdList(prdListSet listSet, @RequestParam(required = false, defaultValue = "1") int page, Model model) {
		
		Paging pageUtil = Paging.builder()
								.curPage(page)
								.cntPerPage(16)
								.blockCnt(10)
								.total(shopService.prdListCnt(listSet))
								.build();

		
		List<Product> prdList = shopService.selectPrdList(listSet, pageUtil);
		
		String categoryWord = shopService.categoryToKor(listSet.getCategory());
		
		for (Product product : prdList) {
			logger.debug("product : {}", product);
		}
		
		model.addAttribute("listSet", listSet);
		model.addAttribute("pageUtil", pageUtil);
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
