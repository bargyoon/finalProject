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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.Review;
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
								.cntPerPage(8)
								.blockCnt(10)
								.total(shopService.prdListCnt(listSet))
								.build();
		
		List<Product> prdList = shopService.selectPrdListBySet(listSet, pageUtil);
		
		String categoryWord = shopService.categoryToKor(listSet.getCategory());
		
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
	public String prdDetail(@RequestParam(defaultValue = "0")int pn, RedirectAttributes redirectAttr, Model model) {
		List<Product> prdOptionInfos = shopService.selectPrdListByIdx(pn);
		//prd_idx 유효성 검사
		if(pn == 0 || prdOptionInfos.size() == 0) {
			redirectAttr.addFlashAttribute("msg", "해당 상품은 존재하지 않습니다.");
			redirectAttr.addFlashAttribute("url", "/market/market");
			return "redirect:/common/result";
		}
		
		Product prdInfo = shopService.selectPrdByIdx(pn);
		List<Review> reviews = shopService.selectReviewByPrdIdx(pn);
		
		for (Review review : reviews) {
			logger.debug("review : {}", review);
		}
		
		
		Map<String, Object> prdInfoMap = Map.of("optionList", prdOptionInfos, "prdInfo", prdInfo);
		model.addAttribute("prdInfoMap", prdInfoMap);
		model.addAttribute("reviews", reviews);
		
		return "market/shop/prd-detail";
	}

	@GetMapping("prd-option")
	@ResponseBody
	public Product prdOption(int dtIdx) {
		Product prdOption = shopService.selectPrdByDtIdx(dtIdx);
		return prdOption;
	}
	
	@PostMapping("buy-test")
	public void buyTest(@RequestBody Order order){
		logger.debug("order : {}", order);
	}
	
}
