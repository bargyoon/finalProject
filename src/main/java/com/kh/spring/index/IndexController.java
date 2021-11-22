package com.kh.spring.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {


	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("market")
	public String marketIndex() {
		return "/market/market";
	}
	
}
