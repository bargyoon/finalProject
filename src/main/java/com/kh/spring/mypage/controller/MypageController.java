package com.kh.spring.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.mypage.model.service.MypageServiceImpl;
import com.kh.spring.mypage.validator.UpdateFormValidator;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("mypage")
public class MypageController {
	
	private final MypageServiceImpl mypageService;
	private final UpdateFormValidator updateFormValidator;
	
	@PostMapping("update-form")
	public String updateForm() {
		
		return "/mypage/my-info";
	}
	
	@GetMapping("managing-board")
	public void managingBoard() {}
	
	@GetMapping("managing-reply")
	public void managingReply() {}
	
	@GetMapping("managing-counseling")
	public void managingCounseling() {}
	
	@GetMapping("pet-info")
	public void petInfo() {}
	
	@GetMapping("my-info")
	public void myInfo() {}
	
	@GetMapping("registration-pet")
	public void registrationPet() {}
	
	@GetMapping("update-member")
	public void updateMember() {}
	
	@GetMapping("vaccination")
	public void vaccination() {}
	
}
