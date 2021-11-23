package com.kh.spring.admin.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.member.model.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("admin")
public class AdminController {
	
	private final AdminService adminService;
	
	@GetMapping("index")
	public void index() {};
	
	@GetMapping("/")
	public String redIndex() {
		return "redirect:/admin/index";
	}
	
	@GetMapping("shopping/add-item")
	public void addItem() {}
	
	@GetMapping("shopping/item-list")
	public void itemList() {}
	
	@GetMapping("shopping/item-comment")
	public void itemComment() {}
	
	@GetMapping("shopping/order-list")
	public void orderList() {}
	
	@GetMapping("shopping/QnA")
	public void qna() {}
	
	@GetMapping("member/member-list")
	public void memberList() {}
	
	@GetMapping("contents/board-list")
	public void boardList() {}
	
	@GetMapping("contents/comment-list")
	public void commentList() {}
	
	@GetMapping("disease/disease-list")
	public void priceList() {}
	
	@GetMapping("disease/add-disease-spec")
	public void addPriceSpec() {}
	
	@PostMapping("disease/add-disease-spec")
	public String addPriceImg(Disease disease, List<MultipartFile> diseaseIcon) {
		System.out.println(disease.toString());
		System.out.println(diseaseIcon.toString());
	
		disease.setExplain("하하");
		
		adminService.insertDisease(disease, diseaseIcon);
		
		
		return "redirect:/admin/disease/disease-list";
	}
	
	
}
