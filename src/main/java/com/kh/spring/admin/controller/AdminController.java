package com.kh.spring.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@GetMapping("index")
	public void index() {};
	
	@GetMapping("/")
	public String redIndex() {
		return "redirect:/admin/index";
	}
	
	@GetMapping("shopping/add-item")
	public void addItem() {};
	
	@GetMapping("shopping/item-list")
	public void itemList() {};
	
	@GetMapping("shopping/item-comment")
	public void itemComment() {};
	
	@GetMapping("shopping/order-list")
	public void orderList() {};
	
	@GetMapping("shopping/QnA")
	public void qna() {};
	
	@GetMapping("member/member-list")
	public void memberList() {};
	
	@GetMapping("contents/board-list")
	public void boardList() {};
	
	@GetMapping("contents/comment-list")
	public void commentList() {};
}
