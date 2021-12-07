package com.kh.spring.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.service.DiseaseService;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.service.ShopService;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("admin")
public class AdminController {

	private final AdminService adminService;
	private final DiseaseService diseaseService;
	private final ShopService shopService;
	private final BoardService boardService;
	private final MemberService memberService;
	
	@GetMapping("index")
	public void index() {
	};

	@GetMapping("/")
	public String redIndex() {
		return "redirect:/admin/index";
	}

	@GetMapping("shopping/add-item")
	public void addItem() {
	}

	@GetMapping("shopping/item-list")
	public void itemList(@RequestParam(value = "keyword", required = false) String keyword,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(value = "state", required = false, defaultValue = "all") String state, Model model) {
		Map<String, Object> commandMap = new LinkedHashMap<String, Object>();
		commandMap.put("keyword", keyword);
		commandMap.put("state", state);
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(15)
				.blockCnt(10)
				.total(shopService.selectPrdListCnt(commandMap))
				.build();

		Map<String, Object> dataMap = shopService.selectPrdList(commandMap,pageUtil);
		model.addAttribute("pageUtil", pageUtil);
		model.addAttribute("datas", dataMap);

	}

	@GetMapping("shopping/item-comment")
	public void itemComment(Model model 
							,@RequestParam(required = false, defaultValue = "1") int page
							,@RequestParam(required = false, defaultValue = "all") String rating
							,@RequestParam(required = false) String keyword
							,@RequestParam(required = false, defaultValue = "all") String type
							,@RequestParam(required = false, defaultValue = "all") String state) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		commandMap.put("rating", rating);
		commandMap.put("keyword", keyword);
		commandMap.put("type", type);
		commandMap.put("state", state);
		int totalCnt = shopService.selectItemCommentListCnt(commandMap);
		
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(15)
				.blockCnt(10)
				.total(totalCnt)
				.build();
		
		List<Map<String,Object>> orderList = shopService.selectItemCommentList(commandMap, pageUtil);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("dataMap", commandMap);
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageUtil", pageUtil);
		
	}

	@GetMapping("shopping/order-list")
	public void orderList(Model model ,@RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(value = "state", required = false, defaultValue = "all") String state) {
		Map<String, Object> commandMap = new LinkedHashMap<String, Object>();
		commandMap.put("state", state);
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(5)
				.blockCnt(10)
				.total(shopService.selectOrderListCnt(commandMap))
				.build();

		
		
		Map<String,Object> orderMap = shopService.selectOrderList(commandMap, pageUtil);
		model.addAttribute("pageUtil", pageUtil);
		model.addAttribute("orderMap", orderMap);
	}
	
	@PostMapping("shopping/update-order-state")
	@ResponseBody
	public String updateOrderState(@RequestBody Map<String, Object> jsonMap) {
		adminService.updateOrderState(jsonMap);
		
		return "good";

	}
	
	@PostMapping("shopping/update-product-state")
	@ResponseBody
	public String updateProductState(@RequestBody Map<String, Object> jsonMap) {
		adminService.updateProductState(jsonMap);
		
		return "good";

	}
	
	
	@PostMapping("shopping/update-review-state")
	@ResponseBody
	public String updateReviewState(@RequestBody Map<String, Object> jsonMap) {
		adminService.updateReviewState(jsonMap);
		
		return "good";

	}
	
	@PostMapping("shopping/update-shipping")
	public String updateShipping(Order order) {
		adminService.updateShipping(order);
		return "redirect:/admin/shopping/order-list";
	}
	

	@PostMapping("shopping/add-product")
	public String shoppingTest(@RequestParam(value = "main_img") List<MultipartFile> mainImg,
			@RequestParam(value = "spec_img") List<MultipartFile> specImg,
			@RequestParam(value = "option", required = false, defaultValue = "기본") List<String> option,
			@RequestParam(value = "stock") List<String> stock, @RequestParam(value = "price") List<String> price,
			Product product) {
		List<Map<String, Object>> commandList = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < option.size(); i++) {
			String optionTemp = option.get(i);
			int stockTemp = Integer.parseInt(stock.get(i));
			int priceTemp = Integer.parseInt(price.get(i));
			commandList.add(Map.of("option", optionTemp, "stock", stockTemp, "price", priceTemp));

		}

		shopService.insertProduct(mainImg, specImg, commandList, product);

		return "redirect:/admin/shopping/item-list";

	}
	
	@GetMapping("shopping/QnA")
	public void qna(Model model ,@RequestParam(required = false, defaultValue = "1") int page) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		int totalCnt = shopService.selectQnAListCnt(commandMap);
		
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(15)
				.blockCnt(10)
				.total(totalCnt)
				.build();
		
		List<Map<String,Object>> qnaList = shopService.selectQnAList(commandMap, pageUtil);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("dataMap", commandMap);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageUtil", pageUtil);
		
	}

	
	@GetMapping("member/member-list")
	public void memberList(Model model,@RequestParam(required = false, defaultValue = "1") int page) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(15)
				.blockCnt(10)
				.total(memberService.selectMemberListCnt(commandMap))
				.build();
		List<Member> memberList = memberService.selectMemberList(commandMap,pageUtil);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageUtil", pageUtil);
		
	}

	@GetMapping("contents/board-list")
	public void boardList(Model model
						,@RequestParam(required = false, defaultValue = "1") int page
						,@RequestParam(required = false) String option
						,@RequestParam(required = false) String keyword
						,@RequestParam(required = false) String category
						,@RequestParam(required = false, defaultValue = "reg_date") String sort) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		
		commandMap.put("category", category);
		commandMap.put("option", option);
		commandMap.put("keyword", keyword);
		commandMap.put("sort", sort);
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(15)
				.blockCnt(10)
				.total(boardService.selectBoardListCnt(commandMap))
				.build();
		List<Map<String,Object>> bList = boardService.selectBoard(commandMap,pageUtil);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("bList",bList);
		model.addAttribute("dataMap",commandMap);
	}
	
	@PostMapping("contents/delete-board")
	@ResponseBody
	public String deleteBoard(@RequestBody Map<String, Object> jsonMap) {
		adminService.deleteBaord((int)jsonMap.get("bdIdx"));
		
		return "good";

	}

	@GetMapping("contents/comment-list")
	public void commentList(Model model
			,@RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false) String option
			,@RequestParam(required = false) String keyword
			,@RequestParam(required = false) String category
			,@RequestParam(required = false, defaultValue = "reg_date") String sort) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		
		commandMap.put("category", category);
		commandMap.put("option", option);
		commandMap.put("keyword", keyword);
		commandMap.put("sort", sort);
		int totalCnt = boardService.selectCommentListCnt(commandMap);
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(10)
				.blockCnt(10)
				.total(totalCnt)
				.build();
		
		List<Map<String,Object>> cmList = boardService.selectCommentList(commandMap,pageUtil);
		
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("cmList",cmList);
		model.addAttribute("dataMap",commandMap);
	}

	@GetMapping("disease/disease-list")
	public void diseaseList(Model model,@RequestParam(required = false, defaultValue = "1") int page) {
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(16)
				.blockCnt(10)
				.total(diseaseService.selectDiseaseListCnt())
				.build();
		List<Map<String, Object>> commandList = diseaseService.selectDiseaseList(pageUtil);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("datas", commandList);
	}

	@GetMapping("disease/price-img-list")
	public void priceList(Model model,
			@RequestParam(value = "state", required = false, defaultValue = "all") String state
			,@RequestParam(required = false, defaultValue = "1") int page) {
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(16)
				.blockCnt(10)
				.total(adminService.selectPriceImgListCnt(state))
				.build();
		Map<String, Object> commandMap = adminService.selectPriceImgList(state,pageUtil);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("datas", commandMap);

	}

	@GetMapping("disease/add-disease-spec")
	public void addPriceSpec() {
	}

	@PostMapping("disease/add-disease-spec")
	public String addPriceImg(Disease disease, List<MultipartFile> diseaseIcon) {
		

		adminService.insertDisease(disease, diseaseIcon);

		return "redirect:/admin/disease/disease-list";
	}

	@PostMapping("disease/insertPrice")
	@ResponseBody
	public String insertPrice(@RequestBody Map<String, Object> jsonMap) {
		adminService.updatePrice(jsonMap);

		return "good";

	}

	@PostMapping("shopping/test")
	@ResponseBody
	public String testParam(@RequestBody List<Integer> bdIdx) {
		
		
		System.out.println(bdIdx.toString());
		return "good";

	}


}
