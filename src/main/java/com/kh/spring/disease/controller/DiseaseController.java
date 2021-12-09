package com.kh.spring.disease.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.dto.PriceImg;
import com.kh.spring.disease.model.service.DiseaseService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("disease")
public class DiseaseController {

	private final DiseaseService diseaseService;

	@GetMapping("index")
	public void index(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		Paging pageUtil = Paging.builder().curPage(page).cntPerPage(40).blockCnt(10)
				.total(diseaseService.selectDiseaseListCnt()).build();

		List<Map<String, Object>> commandList = diseaseService.selectDiseaseList(pageUtil);
		model.addAttribute("datas", commandList);
	}

	@GetMapping("disease-spec")
	public String diseaseSpec(@RequestParam(required = false, defaultValue = "none") String dsIdx,
			RedirectAttributes redirectAttr, Model model) {
		if (dsIdx.equals("none")) {
			return failDsIdx(dsIdx, redirectAttr);
		}
		Disease disease = diseaseService.selectDiseaseByIdx((long) Integer.parseInt(dsIdx));
		model.addAttribute("disease", disease);
		return "disease/disease-spec";
	}

	@GetMapping("price-popup")
	public String pricePopup(@RequestParam(required = false, defaultValue = "none") String dsIdx,
			RedirectAttributes redirectAttr, Model model) {
		if (dsIdx.equals("none")) {
			return failDsIdx(dsIdx, redirectAttr);
		}
		model.addAttribute("dsIdx", dsIdx);

		return "disease/price-popup";
	}

	@PostMapping("add-price")
	public String addPrice(@RequestParam(required = false, defaultValue = "none") String dsIdx,
			List<MultipartFile> files, RedirectAttributes redirectAttr) {

		if (dsIdx.equals("none")) {
			return failDsIdx(dsIdx, redirectAttr);
		}
		PriceImg priceImg = new PriceImg();
		priceImg.setDsIdx((long) Integer.parseInt(dsIdx));
		priceImg.setUserIdx(10001);
		diseaseService.insertPriceImg(files, priceImg);

		redirectAttr.addFlashAttribute("msg", "등록해주셔서 감사합니다.");
		redirectAttr.addFlashAttribute("close", "close");
		return "redirect:/common/result";

	}

	private String failDsIdx(String dsIdx, RedirectAttributes redirectAttr) {

		redirectAttr.addFlashAttribute("msg", "잘못된 접근입니다.");
		redirectAttr.addFlashAttribute("url", "/disease/index");

		return "redirect:/common/result";

	}

}
