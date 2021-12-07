package com.kh.spring.index;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.common.util.pagination.Paging;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexController {

	private final BoardService boardService;

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
		
		
		List<Map<String,Object>> dogList = boardService.selectBoard(dogMap,pageUtil);
		List<Map<String,Object>> catList = boardService.selectBoard(catMap,pageUtil);
		List<Map<String,Object>> infoList = boardService.selectBoard(infoMap,pageUtil);
		model.addAttribute("dogList",dogList);
		model.addAttribute("catList",catList);
		model.addAttribute("infoList",infoList);
		return "index";
	}
	
	@GetMapping("market")
	public String marketIndex() {
		return "/market/market";
	}
	
	@GetMapping("common/result")
	public void result() {}
	
}
