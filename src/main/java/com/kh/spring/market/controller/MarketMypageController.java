package com.kh.spring.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("market/mypage")
public class MarketMypageController {

	@GetMapping("")
	public String mypage() {
		return "/market/mypage/order-list";
	}
	
	@GetMapping("coupon-list")
	public void couponList() {}

	@GetMapping("cart")
	public void cart() {}

	@GetMapping("address-list")
	public void addressList() {}

	@GetMapping("acc-money")
	public void accMoney() {}
	
	@GetMapping("enquiry/enquiry-form")
	public void enquiryForm() {}
	
	@GetMapping("enquiry/enquiry-list")
	public void enquiryList() {}

	@GetMapping("enquiry/faq")
	public void faq() {}

	@GetMapping("review/normal-form")
	public void normalForm() {}

	@GetMapping("review/photo-form")
	public void photoForm() {}

	@GetMapping("review/review-list")
	public void reviewList() {}

	@GetMapping("review/review-list2")
	public void reviewList2() {}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
