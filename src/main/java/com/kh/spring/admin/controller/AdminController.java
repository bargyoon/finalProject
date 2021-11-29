package com.kh.spring.admin.controller;

import java.util.ArrayList;
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

import com.google.api.services.analyticsreporting.v4.model.ReportRequest;
import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.service.DiseaseService;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.service.ShopService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("admin")
public class AdminController {
	
	private final AdminService adminService;
	private final DiseaseService diseaseService;
	private final ShopService shopService;
	
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
	public void diseaseList(Model model) {
		List<Map<String, Object>> commandList = diseaseService.selectDiseaseList();
		model.addAttribute("datas",commandList);
	}
	
	@GetMapping("disease/price-img-list")
	public void priceList(Model model,@RequestParam(value = "state" ,required = false, defaultValue = "all") String state) {
		
		Map<String, Object> commandMap = adminService.selectPriceImgList(state);
		model.addAttribute("datas",commandMap);		
		
	}
	
	@GetMapping("disease/add-disease-spec")
	public void addPriceSpec() {}
	
	@PostMapping("disease/add-disease-spec")
	public String addPriceImg(Disease disease, List<MultipartFile> diseaseIcon) {
		disease.setExplain("하하");
		
		adminService.insertDisease(disease, diseaseIcon);
		
		return "redirect:/admin/disease/disease-list";
	}
	
	@PostMapping("disease/insertPrice")
	@ResponseBody
	public String insertPrice(@RequestBody Map<String, Object> jsonMap) {
		adminService.updatePrice(jsonMap);
		
		
		
		return "good";
		
	}
	
	@GetMapping("disease/test")
	public void testParam(@RequestParam Map<String, Object> test) {
		System.out.println(test.get("test"));
		
	}
	
	@PostMapping("shopping/test")
	public String shoppingTest(@RequestParam(value="main_img") List<MultipartFile> mainImg
								,@RequestParam(value="spec_img") List<MultipartFile> specImg
								,@RequestParam(value="option", required = false, defaultValue = "none") List<String> option
								,@RequestParam(value="stock") List<String> stock
								,@RequestParam(value="price") List<String> price
								, Product product) {
		List<Map<String, Object>> commandList = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < option.size(); i++) {
			String optionTemp = option.get(i);
			int stockTemp = Integer.parseInt(stock.get(i));
			int priceTemp = Integer.parseInt(price.get(i));
			commandList.add(Map.of("option", optionTemp,"stock", stockTemp,"price", priceTemp));
			
		}
		
		shopService.insertProduct(mainImg, specImg, commandList, product);
		
		return "redirect:/admin/shopping/item-list";
				
		
	}
	
}
