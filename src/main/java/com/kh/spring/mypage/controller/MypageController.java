package com.kh.spring.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	@GetMapping("managing-board")
	public void managingBoard() {}
	
	@GetMapping("managing-reply")
	public void managingReply() {}
	
	@GetMapping("managing-counseling")
	public void managingCounseling() {}
	
	
}
