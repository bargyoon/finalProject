package com.kh.spring.index;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.service.ShopService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexController {

	private final BoardService boardService;
	private final ShopService shopService;
	
	@GetMapping("/")
	public String index(Model model) {
		Map<String,Object> dogMap = new LinkedHashMap<String,Object>();
		Map<String,Object> catMap = new LinkedHashMap<String,Object>();
		Map<String,Object> infoMap = new LinkedHashMap<String,Object>();
		
		dogMap.put("category", "dog");
		catMap.put("category", "cat");
		infoMap.put("category", "info");
		Paging pageUtil = Paging.builder()
				.curPage(1)
				.cntPerPage(10)
				.blockCnt(10)
				.total(boardService.selectBoardListCnt(dogMap))
				.build();
		
		List<Map<String,Object>> prdList = shopService.selectPrdListMain("RATING", 10);
		List<Map<String,Object>> dogList = boardService.selectBoard(dogMap,pageUtil);
		List<Map<String,Object>> catList = boardService.selectBoard(catMap,pageUtil);
		List<Map<String,Object>> infoList = boardService.selectBoard(infoMap,pageUtil);
		model.addAttribute("dogList",dogList);
		model.addAttribute("catList",catList);
		model.addAttribute("infoList",infoList);
		model.addAttribute("prdList",prdList);
		return "index";
	}
	
	@GetMapping("market")
	public String marketIndex(Model model) {

		List<Map<String,Object>> newPrdList = shopService.selectPrdListMain("REG_DATE", 10);
		List<Map<String,Object>> bestPrdList = shopService.selectPrdListMain("RATING", 3);
		model.addAttribute("newPrdList", newPrdList);
		model.addAttribute("bestPrdList", bestPrdList);
		return "/market/market";
	}
	
	@GetMapping("common/result")
	public void result() {}
	
}
