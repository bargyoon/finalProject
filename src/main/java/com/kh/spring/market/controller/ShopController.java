	package com.kh.spring.market.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.prdListSet;
import com.kh.spring.market.model.service.ShopService;
import com.kh.spring.member.model.dto.Member;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("market/shop")
public class ShopController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final ShopService shopService;
	
	@GetMapping("prd-list")
	public void prdList(prdListSet listSet, @RequestParam(required = false, defaultValue = "1") int page, Model model) {
		
		Paging pageUtil = Paging.builder()
								.curPage(page)
								.cntPerPage(8)
								.blockCnt(10)
								.total(shopService.prdListCnt(listSet))
								.build();
		
		List<Product> prdList = shopService.selectPrdListBySet(listSet, pageUtil);
		
		String categoryWord = shopService.categoryToKor(listSet.getCategory());
		
		model.addAttribute("listSet", listSet);
		model.addAttribute("pageUtil", pageUtil);
		model.addAttribute("categoryWord", categoryWord);
		model.addAttribute("prdList", prdList);
	}
	
	@GetMapping("event-list")
	public void eventList() {}

	@GetMapping("event-detail")
	public void eventDetail() {}

	@GetMapping("prd-detail")
	public String prdDetail(@RequestParam(defaultValue = "0")int pn, RedirectAttributes redirectAttr, Model model) {
		List<Product> prdOptionInfos = shopService.selectPrdListByIdx(pn);
		//prd_idx 유효성 검사
		if(pn == 0 || prdOptionInfos.size() == 0) {
			redirectAttr.addFlashAttribute("msg", "해당 상품은 존재하지 않습니다.");
			redirectAttr.addFlashAttribute("url", "/market/market");
			return "redirect:/common/result";
		}
		
		Product prdInfo = shopService.selectPrdByIdx(pn);
		List<Review> reviews = shopService.selectReviewByPrdIdx(pn);
		
		for (Review review : reviews) {
			logger.debug("review : {}", review);
		}
		
		
		Map<String, Object> prdInfoMap = Map.of("optionList", prdOptionInfos, "prdInfo", prdInfo);
		model.addAttribute("prdInfoMap", prdInfoMap);
		model.addAttribute("reviews", reviews);
		
		return "market/shop/prd-detail";
	}

	@GetMapping("prd-option")
	@ResponseBody
	public Product prdOption(int dtIdx) {
		Product prdOption = shopService.selectPrdByDtIdx(dtIdx);
		return prdOption;
	}
	
	@PostMapping("check-stock")
	@ResponseBody
	public Member checkStock(@RequestBody List<Order> orderInfos, @SessionAttribute(name="authentication")Member certifiedUser) {
		int[] cntArr = new int[orderInfos.size()];
		for (int i = 0; i < orderInfos.size(); i++) {
			cntArr[i] = shopService.selectPoStackByDtIdx(orderInfos.get(i).getDtIdx());
			if(orderInfos.get(i).getOrderCnt() > cntArr[i]) {
				Member emptyMember = new Member();
				emptyMember.setUserName("disavailable");
				return emptyMember;
			}
		}
		return certifiedUser;
	}
	
	@GetMapping("choice-coupon")
	public void choiceCoupon(@SessionAttribute(name="authentication")Member certifiedUser, Model model) {
		int userIdx = certifiedUser.getUserIdx();
		List<Coupon> couponList = shopService.selectCouponByUserIdx(userIdx);
		model.addAttribute("couponList", couponList);
	}
	
	@PostMapping("buy-test")
	@ResponseBody
	public IamportResponse<Payment> buyTest(@PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{
		IamportClient client = new IamportClient("8272885714375817", "f27d12b907ecd3d120d853acafa0791ae35c2d3a309e7ae0ffe2c05a90dea7edf322f437d1f62fa6");
		return client.paymentByImpUid(imp_uid);
	}
	
}
