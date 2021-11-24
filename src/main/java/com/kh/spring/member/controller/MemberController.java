package com.kh.spring.member.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	 
	Logger logger =  LoggerFactory.getLogger(this.getClass());
	
	private MemberService memberService;
	
	public MemberController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}
	
	@GetMapping("join")
	public void Join() {}
	
	@PostMapping("join")
	public String joinImpl(Member member) {
		
		//System.out.println(member);
		
		//member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
		// -> db에 비밀번호 안뜨게되서 불편하니 시연시에만 키는게 나을듯..?
		
		memberService.insertMember(member);
		return "redirect:/";
	}

	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public String loginImpl(Member member, HttpSession session, RedirectAttributes redirectAttr) {
		Member certifiedUser = memberService.authenticateUser(member);
		
		if(certifiedUser == null) {
			redirectAttr.addFlashAttribute("message", "아이디나 비밀번호가 틀렸습니다.");
			return "redirect:/member/login";
		}
		
		session.setAttribute("authentication", certifiedUser);
		return "redirect:/";
	}
	
	/*
	 * @PostMapping("logout") public
	 * ModelAndView logout(HttpSession session, ModelAndView mav) {
	 * memberService.logout(session); mav.setViewName("/");
	 * mav.addObject("message","logout"); return mav; }
	 */
	
	@PostMapping("idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) {		
		//logger.info("userIdCheck 진입");
        //logger.info("전달받은 id:"+userId);
        int cnt = memberService.idCheck(userId);
        //logger.info("확인 결과:"+cnt);
        return cnt;		
	}
	
	@PostMapping("nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestParam("nickName") String nickName) {	
		//logger.info("userIdCheck 진입");
        //logger.info("전달받은 id:"+nickName);
        int cnt = memberService.nickNameCheck(nickName);
        //logger.info("확인 결과:"+cnt);
        return cnt;		
	}
	

	@GetMapping("check-id")
	public void checkId() {}
	
	@GetMapping("check-password")
	public void checkPassword() {}
	
	
	

}
