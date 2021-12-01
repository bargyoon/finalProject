package com.kh.spring.board.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.common.util.pagination.Paging;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("board")
public class BoardController {

	private final BoardService boardService;
	
	@GetMapping("info")
	public String boardInfo(Model model
							,@RequestParam(required = false, defaultValue = "1") int page
							,@RequestParam(required = false) String option
							,@RequestParam(required = false) String keyword) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		
		commandMap.put("category", "info");
		commandMap.put("option", option);
		commandMap.put("keyword", keyword);
		model.addAttribute("category","info");
		model.addAttribute("option",option);
		model.addAttribute("keyword", keyword);
		return makeBoard(model,commandMap, page);
		
	}
	
	@GetMapping("info/form")
	public String infoForm(Model model) {
		model.addAttribute("title", "정보");
		model.addAttribute("category", "info");
		return "board/board-form";

	}
	
	@GetMapping("info/detail")
	public String infoDetail(Model model, @RequestParam(value = "bdIdx") int bdIdx) {
		
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		return "board/board-detail";
	}
	
	@GetMapping("cat")
	public String boardCat(Model model
						,@RequestParam(required = false, defaultValue = "1") int page
						,@RequestParam(required = false) String option
						,@RequestParam(required = false) String keyword) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		model.addAttribute("category", "cat");
		commandMap.put("category", "cat");
		return makeBoard(model,commandMap,page);
		
	}
	
	@GetMapping("cat/form")
	public String catForm(Model model) {
		model.addAttribute("title", "고양이");
		model.addAttribute("category", "cat");
		return "board/board-form";

	}
	
	@GetMapping("dog/detail")
	public String dogDetail(Model model, @RequestParam(value = "bdIdx") int bdIdx) {
		
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		return "board/board-detail";
	}
	
	@GetMapping("dog")
	public String boardDog(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		commandMap.put("category", "dog");
		model.addAttribute("category", "dog");
		return makeBoard(model,commandMap,page);
		
	}
	
	@GetMapping("dog/form")
	public String dogForm(Model model) {
		model.addAttribute("title", "강아지");
		model.addAttribute("category", "dog");
		return "board/board-form";


	}

	@GetMapping("review")
	public String boardReview(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		model.addAttribute("category", "review");
		commandMap.put("category", "review");
		return makeBoard(model,commandMap,page);
		
	}
	
	@GetMapping("review/form")
	public String reviewForm(Model model) {
		model.addAttribute("title", "후기");
		model.addAttribute("category", "review");
		return "board/board-form";

	}

	@GetMapping("meet")
	public String boardMeet(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		commandMap.put("category", "meet");
		model.addAttribute("category", "meet");
		return makeBoard(model,commandMap,page);
		
	}
	
	@GetMapping("meet/form")
	public String meetForm(Model model) {
		model.addAttribute("title", "모임");
		model.addAttribute("category", "meet");
		return "board/board-form";

	}

	@GetMapping("consulting")
	public String boardConsulting(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		model.addAttribute("category", "consulting");
		commandMap.put("category", "consulting");
		return makeBoard(model,commandMap,page);
		
	}
	
	@GetMapping("consulting/form")
	public String consultingForm(Model model) {
		model.addAttribute("title", "상담");
		model.addAttribute("category", "consulting");
		return "board/board-form";
	}
	
	
	@GetMapping("board-form")
	public void boardForm() {}
	
	@PostMapping("board-form")
	public String insertBoard(List<MultipartFile> files, Board board ) {
		boardService.insertBoard(files,board);
		
		
		
		return "redirect:/board/"+board.getCategory();
	}
	
	
	public String makeBoard(Model model, Map<String,Object> commandMap, int page) {
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(15)
				.blockCnt(10)
				.total(boardService.selectBoardListCntByCate((String) commandMap.get("category")))
				.build();
		List<Map<String,Object>> bList = boardService.selectBoard(commandMap,pageUtil);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("bList",bList);
		model.addAttribute("length",bList.size());
		return "board/board-list";
	}
	
}
