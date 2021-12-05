package com.kh.spring.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.hospital.model.dto.Hospital;
import com.kh.spring.hospital.model.service.HospitalServiceImpl;

@Controller
@RequestMapping("hospital")
public class HospitalController {
	
	@Autowired
	
	private HospitalServiceImpl hospitalService;
	@GetMapping("info")
	public String hospitalInfo() {
		return "hospital/hospital-info";
	}
	
	@GetMapping("search")
	public String searchPage() {
		return "hospital/hospital-search";
	}
	
	@GetMapping("nameSearch")
	@ResponseBody
	public List<Hospital> nameSearch(String nameinput) {
		List<Hospital> searchHospitalN = hospitalService.selectHospitalByLoName(nameinput);
		return searchHospitalN;
	}
	
	@GetMapping("localSearch")
	@ResponseBody
	public List<Hospital> localSearch(String stringAdd) {
		List<Hospital> searchHospital = hospitalService.selectHospitalByAdd(stringAdd);
		return searchHospital;
	}
	
	
	@GetMapping("detail")
	public String detail(Model model, int locationIdx) {
		Hospital hospital = hospitalService.selectHospitalByloNumber(locationIdx);
		model.addAttribute("hospital",hospital);
		return "hospital/hospital-detail";
	}
	
	
	
}
