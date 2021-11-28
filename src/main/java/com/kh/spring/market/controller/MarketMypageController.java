package com.kh.spring.market.controller;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.QNA;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.SaveHistory;
import com.kh.spring.market.model.service.MarketMypageService;
import com.kh.spring.member.model.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("market/mypage")
public class MarketMypageController {
	
	private final MarketMypageService marketMypageService;

	@GetMapping("")
	public String mypage(@SessionAttribute(name="authentication")Member certifiedUser,
						Model model) {
		
		List<Map<String, Object>> orderList = marketMypageService.selectOrderList(certifiedUser.getUserIdx());
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		int couponCnt = marketMypageService.selectCouponCount(certifiedUser.getUserIdx());
				
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
		model.addAttribute("orderList", orderList);
		System.out.println("orderList : " + orderList);
		
		return "/market/mypage/order-list";
	}
	
	@GetMapping("coupon-list")
	public void couponList(@SessionAttribute(name="authentication")Member certifiedUser,
												Model model) {
		
		
		List<Map<String, Object>> couponList = marketMypageService.selectCouponByIdx(certifiedUser.getUserIdx());
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		int couponCnt = marketMypageService.selectCouponCount(certifiedUser.getUserIdx());
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
		
		System.out.println("couponCnt : " + couponCnt);
		System.out.println("couponList : " + couponList);

	}

	@GetMapping("cart")
	public void cart() {}

	@GetMapping("address-list")
	public void addressList() {}

	@GetMapping("acc-money")
	public void accMoney(@SessionAttribute(name="authentication")Member certifiedUser,
								Model model,
								@RequestParam(value = "state", defaultValue="1")String state) {
		
		List<Map<String, Object>> reserveList = marketMypageService.selectReserveList(certifiedUser.getUserIdx(),state);
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		int couponCnt = marketMypageService.selectCouponCount(certifiedUser.getUserIdx());
				
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
		model.addAttribute("reserveList", reserveList);
		
		System.out.println("state : " + state);
		System.out.println("reserveList : " + reserveList);
	}
	
	@GetMapping("enquiry/enquiry-form")
	public void enquiryForm(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model) {
		//List<Map<String, Object>> memberEnquiry = marketMypageService.memberInfoForEnquiry(certifiedUser.getUserIdx());
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		
		model.addAttribute("memberInfo", memberInfo);
	}
	
	@GetMapping("enquiry/enquiry-pop")
	public void enquiryPop(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model) {
		
		List<Map<String, Object>> orderList = marketMypageService.selectOrderList(certifiedUser.getUserIdx());
		model.addAttribute("orderList", orderList);
		
		System.out.println("orderList : " + orderList);
	}
	
	@PostMapping("enquiry/upload")
	public String uploadEnquiry(QNA qna
							,@SessionAttribute("authentication")Member certifiedUser) {
		
		qna.setUserIdx(certifiedUser.getUserIdx());		
		System.out.println("qna : " + qna);
		
		marketMypageService.insertEnquiry(qna);

		return "redirect:/market/mypage/enquiry/enquiry-list"; 
	}
	
	@GetMapping("enquiry/enquiry-list")
	public void enquiryList(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model) {
		
		List<Map<String, Object>> enquiryList = marketMypageService.selectEnquiryList(certifiedUser.getUserIdx());
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		int couponCnt = marketMypageService.selectCouponCount(certifiedUser.getUserIdx());
		
		model.addAttribute("enquiryList", enquiryList);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
		
		System.out.println("enquiryList : " + enquiryList);
	}

	@GetMapping("enquiry/faq")
	public void faq() {}

	@GetMapping("review/normal-form")
	public void normalForm(@SessionAttribute(name="authentication")Member certifiedUser,
							@RequestParam("orderIdx")int orderIdx,
							Model model,
							Order order) {
		
		order.setUserIdx(certifiedUser.getUserIdx());
		order.setOrderIdx(orderIdx);
		List<Map<String, Object>> reviewDetail = marketMypageService.selectReviewDetail(order);
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		int couponCnt = marketMypageService.selectCouponCount(certifiedUser.getUserIdx());
				
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);		
		model.addAttribute("reviewDetail", reviewDetail);
	}

	@GetMapping("review/photo-form")
	public void photoForm(@SessionAttribute(name="authentication")Member certifiedUser,
							@RequestParam("orderIdx")int orderIdx,
							Model model,
							Order order) {
		
		order.setUserIdx(certifiedUser.getUserIdx());
		order.setOrderIdx(orderIdx);
		List<Map<String, Object>> reviewDetail = marketMypageService.selectReviewDetail(order);
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		int couponCnt = marketMypageService.selectCouponCount(certifiedUser.getUserIdx());
				
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);	
		model.addAttribute("reviewDetail", reviewDetail);
		
		System.out.println("reviewDetail : " + reviewDetail);
		System.out.println("orderIdx : " + orderIdx);
		
	}
	
	

	@GetMapping("review/review-list")
	public void reviewList(@SessionAttribute(name="authentication")Member certifiedUser,
						   Model model) {
		List<Map<String, Object>> reviewList = marketMypageService.selectReviewList(certifiedUser.getUserIdx());
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		int couponCnt = marketMypageService.selectCouponCount(certifiedUser.getUserIdx());
		marketMypageService.updateDateAndState();
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
		
		System.out.println("reviewList : " + reviewList);		
	}
	
	@GetMapping("review/review-list2")
	public void myReviewList(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model,
							@RequestParam(value = "state", defaultValue="1")String state) {
		
		
		List<Map<String, Object>> myReviewList = marketMypageService.selectMyReviewList(certifiedUser.getUserIdx(), state);
		List<FileDTO> files = marketMypageService.selectFileList(certifiedUser.getUserIdx());
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		int couponCnt = marketMypageService.selectCouponCount(certifiedUser.getUserIdx());
		
		
		model.addAttribute("myReviewList", myReviewList);
		model.addAttribute("files", files);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
		
		System.out.println("state : " + state);
		System.out.println("myReviewList : " + myReviewList);
		System.out.println("files : " + files);
		System.out.println("memberInfo : " + memberInfo);
	}
	
	@PostMapping("review/upload/{orderIdx}")
	public String uploadBoard(Review review
							, List<MultipartFile> files 
							,@SessionAttribute("authentication")Member certifiedUser
							,@PathVariable int orderIdx) {
		
		System.out.println("files : " + files);
		System.out.println("orderIdx : " + orderIdx);
		
		//review.setOrderIdx(orderIdx);
		review.setUserIdx(certifiedUser.getUserIdx());
		
		System.out.println("review : " + review);
		
		if(files == null) {
			review.setType("0"); //일반
		}else {
			review.setType("1");
		}
		
		marketMypageService.insertReview(files, review);
		marketMypageService.updatePrdIdx(orderIdx);
		
		
		//파일첨부 안했을 때 예외처리 (RedirectAttributes)
		System.out.println("review : " + review);
		return "redirect:/market/mypage/review/review-list2"; 
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
