package com.kh.spring.mypage.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.dto.BoardComment;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.common.validator.ValidatorResult;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.mypage.model.dto.MypageSearchSet;
import com.kh.spring.mypage.model.dto.Pet;
import com.kh.spring.mypage.model.dto.Vaccination;
import com.kh.spring.mypage.model.dto.VaccineInfo;
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
	private final MemberService memberService;
	
	Logger logger =  LoggerFactory.getLogger(this.getClass());
	
	@InitBinder("updateMemberForm")
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(updateMemberFormValidator);
	}
	
	@GetMapping("nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestParam("nickName") String nickName) {
		
		logger.info("userIdCheck 진입");
        logger.info("전달받은 nickname:" + nickName);
		
        int cnt = memberService.nickNameCheck(nickName);
        return cnt;		
	}
	
	@GetMapping("update-member-info")
	public void updateMemberForm(
			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		model.addAttribute(new UpdateMemberForm())
		.addAttribute("error", new ValidatorResult().getError());
	}
	
	@PostMapping("update-member-info")
	public String updateMember(
			@SessionAttribute(name = "authentication")Member certifiedUser, Model model, 
			@Validated UpdateMemberForm form, Errors errors, RedirectAttributes redirectAttr
			) {
		if(errors.hasErrors()) {
			ValidatorResult validatorResult = new ValidatorResult();
			validatorResult.addErrors(errors);
			model.addAttribute("error", validatorResult.getError());
			return "mypage/update-member-info";
		}

		int userIdx = certifiedUser.getUserIdx();
		form.setUserIdx(userIdx);
		
		System.out.println(form.getAddress());
		System.out.println(form.getAddressDetail());
		
		mypageService.updateMemberDynamicQuery(form);
		redirectAttr.addFlashAttribute("message", "회원정보가 수정되었습니다.");
		
		return "mypage/my-info";
	}
	
	@GetMapping("managing-board")
	public void managingBoard(
			@SessionAttribute(name = "authentication")Member certifiedUser, Model model, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false) String keyword
			) {
		int userIdx = certifiedUser.getUserIdx();
		
		MypageSearchSet searchSet = new MypageSearchSet();
		searchSet.setUserIdx(userIdx);
		searchSet.setKeyword(keyword);
		
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(8)
				.blockCnt(10)
				.total(mypageService.selectBoardCnt(searchSet))
				.build();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageUtil", pageUtil);
		map.put("searchSet", searchSet);
		
		List<Board> boardList = mypageService.selectBoard(map);
		
		model.addAttribute("boardList", boardList)
		.addAttribute("pageUtil", pageUtil)
		.addAttribute("searchSet", searchSet);
	}
	
	@GetMapping("managing-board-comment")
	public void managingBoardComment(
		@SessionAttribute(name = "authentication")Member certifiedUser, Model model, 
		@RequestParam(required = false, defaultValue = "1") int page,
		@RequestParam(required = false) String keyword
			) {
		int userIdx = certifiedUser.getUserIdx();
		
		MypageSearchSet searchSet = new MypageSearchSet();
		searchSet.setUserIdx(userIdx);
		searchSet.setKeyword(keyword);
		
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(8)
				.blockCnt(10)
				.total(mypageService.selectBoardCommentCnt(searchSet))
				.build();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageUtil", pageUtil);
		map.put("searchSet", searchSet);
		
		List<BoardComment> commentList = mypageService.selectBoardComment(map);
		
		model.addAttribute("commentList", commentList)
		.addAttribute("pageUtil", pageUtil)
		.addAttribute("searchSet", searchSet);
	}
	
//	@GetMapping("managing-counseling")
//	public void managingCounseling(
//			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
//			) {
//		
//		int userIdx = certifiedUser.getUserIdx();
//		List<Counseling> counselingList = mypageService.selectCounselingByUserIdx(userIdx);
//		model.addAttribute("counselingList", counselingList);
//	}
	
	@GetMapping("pet-info")
	public void petInfo(@SessionAttribute(name = "authentication")Member certifiedUser, Model model) {
		int userIdx = certifiedUser.getUserIdx();
		List<Pet> petList = mypageService.selectPetByUserIdx(userIdx);
		model.addAttribute("petList", petList);
	}
	
	@GetMapping("my-info")
	public void myInfo(@SessionAttribute(name = "authentication")Member certifiedUser, Model model) {
		model.addAttribute("authentication", certifiedUser);
	}
	
	@GetMapping("registration-pet")
	public void registrationPetForm() {
		
	}
	
	@PostMapping("registration-pet")
	public String registrationPet(@SessionAttribute(name = "authentication")Member certifiedUser, Pet pet, MultipartFile file) {
		int userIdx = certifiedUser.getUserIdx();
		pet.setUserIdx(userIdx);
		
		mypageService.insertPet(pet, file);
		
		return "mypage/pet-info";
	}
	
	@GetMapping("vaccination")
	public void vaccination(@SessionAttribute(name = "authentication")Member certifiedUser, Model model) {
		int userIdx = certifiedUser.getUserIdx();
		List<Pet> petList = mypageService.selectPetByUserIdx(userIdx);
		List<VaccineInfo> vaccineList = mypageService.selectAllVaccine();
//		백신 cycle을 계산해서 뿌려줘야함 도움필요
//		List<Vaccination> vaccinationList = mypageService.selectVaccination(userIdx);
		
		model.addAttribute("petList", petList)
		.addAttribute("vaccineList", vaccineList);
	}
	
	@PostMapping("vaccination")
	public void vaccination(@SessionAttribute(name = "authentication")Member certifiedUser, Vaccination vaccination) {
		int userIdx = certifiedUser.getUserIdx();
		vaccination.setUserIdx(userIdx);
		
		mypageService.insertVaccination(vaccination);
	}
	
}
