package com.kh.spring.mypage.controller;

import java.util.HashMap;
import java.util.Map;

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
import com.kh.spring.mypage.model.dto.Pet;
import com.kh.spring.mypage.model.service.MypageService;
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
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("userIdx", userIdx);
		commandMap.put("form", form);
		
		mypageService.updateMemberDynamicQuery(commandMap);
		redirectAttr.addFlashAttribute("message", "회원정보가 수정되었습니다.");
		
		return "mypage/my-info";
	}
	
	@GetMapping("managing-board")
	public void managingBoard(
//			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		
//		int userIdx = certifiedUser.getUserIdx();
//		List<Board> boardList = mypageService.selectBoardByUserIdx(userIdx);
//		model.addAttribute("boardList", boardList);
	}
	
	@GetMapping("managing-reply")
	public void managingReply(
//			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		
//		int userIdx = certifiedUser.getUserIdx();
//		List<Reply> replyList = mypageService.selectReplyByUserIdx(userIdx);
//		model.addAttribute("replyList", replyList);
	}
	
	@GetMapping("managing-counseling")
	public void managingCounseling(
//			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		
//		int userIdx = certifiedUser.getUserIdx();
//		List<Counseling> counselingList = mypageService.selectCounselingByUserIdx(userIdx);
//		model.addAttribute("counselingList", counselingList);
	}
	
	@GetMapping("pet-info")
	public void petInfo(
//			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		
//		int userIdx = certifiedUser.getUserIdx();
//		List<Pet> petList = mypageService.selectPetByUserIdx(userIdx);
//		model.addAttribute("petList", petList);
	}
	
	@GetMapping("my-info")
	public void myInfo() {}
	
	@GetMapping("registration-pet")
	public void registrationPetForm() {}
	
	@PostMapping("registration-pet")
	public String registrationPet(
		@SessionAttribute(name = "authentication")Member certifiedUser, Model model, Pet pet
			) {
		
		int userIdx = certifiedUser.getUserIdx();
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("userIdx", userIdx);
		commandMap.put("pet", pet);
		
		mypageService.insertPetByUserIdx(commandMap);
		
		return "mypage/pet-info";
	}
	
	@GetMapping("vaccination")
	public void vaccination() {}
	
}
