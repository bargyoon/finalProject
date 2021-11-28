package com.kh.spring.mypage.controller;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.validator.ValidatorResult;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.mypage.model.service.MypageService;
import com.kh.spring.mypage.model.service.MypageServiceImpl;
import com.kh.spring.mypage.validator.UpdateMemberForm;
import com.kh.spring.mypage.validator.UpdateMemberFormValidator;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("mypage")
public class MypageController {
	
	private final MypageService mypageService;
	private final UpdateMemberFormValidator updateMemberFormValidator;
	
	@InitBinder("updateMemberForm")
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(updateMemberFormValidator);
	}

	@GetMapping("update-member-info")
	public void updateMemberForm(Model model) {
		model
		.addAttribute(new UpdateMemberForm())
		.addAttribute("error", new ValidatorResult().getError());
	}
	
	@PostMapping("update-member-info")
	public String updateMember(@SessionAttribute(name = "authentication")Member certifiedUser, 
			@Validated UpdateMemberForm form, Errors errors, Model model, RedirectAttributes redirectAttr) {
		
		int userIdx = certifiedUser.getUserIdx();
		
		if(errors.hasErrors()) {
			ValidatorResult validatorResult = new ValidatorResult();
			validatorResult.addErrors(errors);
			model.addAttribute("error", validatorResult.getError());
			return "mypage/update-member-info";
		}
		
		mypageService.updateMember(userIdx, form);
		redirectAttr.addFlashAttribute("message", "회원정보가 수정되었습니다.");
		
		return "mypage/my-info";
	}
	
	@GetMapping("managing-board")
	public void managingBoard() {}
	
	@GetMapping("managing-reply")
	public void managingReply() {}
	
	@GetMapping("managing-counseling")
	public void managingCounseling() {}
	
	@GetMapping("pet-info")
	public void petInfo(@SessionAttribute(name = "authentication")Member certifiedUser, Model model) {
		int userIdx = certifiedUser.getUserIdx();
		
//		List<Pet> pets = MemberService.selectPets(userIdx);
//		model.addAttribute("Pets", pets);
	}
	
	@GetMapping("my-info")
	public void myInfo() {}
	
	@GetMapping("registration-pet")
	public void registrationPet() {}
	
	@GetMapping("vaccination")
	public void vaccination() {}
	
}
