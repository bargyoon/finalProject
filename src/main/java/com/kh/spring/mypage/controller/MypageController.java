package com.kh.spring.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.spring.common.validator.ValidatorResult;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.mypage.validator.UpdateMemberForm;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("mypage")
public class MypageController {
	
//	private final MypageServiceImpl mypageService;
//	private final UpdateMemberFormValidator updateMemberFormValidator;
//	
//	@InitBinder("updateMemberForm")
//	public void initBinder(WebDataBinder webDataBinder) {
//		webDataBinder.addValidators(updateMemberFormValidator);
//	}
//	
	@PostMapping("update-member")
	public String updateMember(@Validated UpdateMemberForm form, Errors errors,
			@SessionAttribute(name = "authentication")Member certifiedUser, Model model) {
		
		if(errors.hasErrors()) {
			ValidatorResult validatorResult = new ValidatorResult();
			model.addAttribute("error", validatorResult.getError());
			validatorResult.addErrors(errors);
			return "mypage/update-member";
		}
		
		
		return "mypage/my-info";
	}
	
	@GetMapping("update-member")
	public void updateMemberForm(@SessionAttribute(name = "authentication")Member certifiedUser, Model model) {
		model.addAttribute("member", certifiedUser)
		.addAttribute(new UpdateMemberForm())
		.addAttribute("error", new ValidatorResult().getError());
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
	
	@GetMapping("vaccination")
	public void vaccination() {}
	
}
