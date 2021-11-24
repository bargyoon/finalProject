package com.kh.spring.market.controller;


import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.service.MarketMypageService;
import com.kh.spring.member.model.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("market/mypage")
public class MarketMypageController {
	
	private final MarketMypageService marketMypageService;

	@GetMapping("")
	public String mypage() {
		return "/market/mypage/order-list";
	}
	
	@GetMapping("coupon-list")
	public void couponList(@SessionAttribute(name="authentication")Member certifiedUser,
												Model model) {
		
		List<Coupon> couponList = marketMypageService.selectCouponByIdx(certifiedUser.getUserIdx());
		model.addAttribute("couponList", couponList);
		
		System.out.println("couponList : " + couponList);

	}

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
