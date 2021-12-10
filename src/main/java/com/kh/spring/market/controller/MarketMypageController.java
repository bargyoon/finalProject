package com.kh.spring.market.controller;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.market.model.dto.Address;
import com.kh.spring.market.model.dto.Cart;
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
						Model model,
						Order order,
						@RequestParam(value = "fromDate", required = false)String fromDate,
						@RequestParam(value = "endDate", required = false)String endDate) {
		
		int member = certifiedUser.getUserIdx();
		String state = order.getState();		
		List<Map<String, Object>> orderList = marketMypageService.selectOrderList(member,state,fromDate, endDate);
		Member memberInfo = marketMypageService.selectMemberInfo(member);
		int couponCnt = marketMypageService.selectCouponCount(member);
		marketMypageService.updateDateAndState(); //구매 후 일주일 지나면 구매확정 state 변경
		
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
	public void cart(@SessionAttribute(name="authentication")Member certifiedUser,
					Model model) {
		
		int member = certifiedUser.getUserIdx();
		Member memberInfo = marketMypageService.selectMemberInfo(member);
		List<Map<String, Object>> cartList = marketMypageService.selectCartList(certifiedUser);
		List<FileDTO> files = marketMypageService.selectFile(cartList);
		int couponCnt = marketMypageService.selectCouponCount(member);
		model.addAttribute("cartList", cartList);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
		model.addAttribute("files", files);
	}
	
	@PostMapping("cart/check-stock")
	@ResponseBody
	public String checkStock(@RequestBody Map<String, Object> checkInfo) {
		
		if(marketMypageService.checkStock(checkInfo)) {
			return "available";
		}
		
		return "disavailable";
	}
	
	@GetMapping("cart/delete/{cartIdx}")
	@ResponseBody
	public void deleteCart(@PathVariable(value = "cartIdx") int cartIdx) {		
		marketMypageService.deleteCart(cartIdx);
	}
	
	@PostMapping("cart/selectDelete")
	public String selectDeleteCart(@RequestParam("selectedArr")int[] selectedArr) {		
		
		for(int i = 0; i<selectedArr.length; i++) {
			System.out.println("selectedArr : " + selectedArr[i]);
			marketMypageService.deleteCart(selectedArr[i]);
		}
		
		return "redirect:/market/mypage/cart"; 
	}
	
	@GetMapping("cart/deleteAll")
	public String deleteAllCart(@SessionAttribute(name="authentication")Member certifiedUser) {		
		marketMypageService.deleteAllCart(certifiedUser.getUserIdx());
		return "redirect:/market/mypage/cart"; 
	}
	
	@GetMapping("cart/update")
	public String updateCart(@RequestParam("count")int count,@RequestParam("cartIdx")int cartIdx) {		
		marketMypageService.updateCart(count, cartIdx);
		return "redirect:/market/mypage/cart"; 
	}


	@GetMapping("address-list")
	public void addressList(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model,
							Address address) {
		
		int member = certifiedUser.getUserIdx();
		Member memberInfo = marketMypageService.selectMemberInfo(member);
		List<Address> addressList = marketMypageService.selectAddressList(member);
		int couponCnt = marketMypageService.selectCouponCount(member);
	      
	    model.addAttribute("couponCnt", couponCnt);
		model.addAttribute("addressList", addressList);
		model.addAttribute("memberInfo", memberInfo);
		
	}
	
	@GetMapping("address-pop")
	public void addressPop(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model,
							Address address) {
		
		List<Address> addressList = marketMypageService.selectAddressList(certifiedUser.getUserIdx());
		model.addAttribute("addressList", addressList);
		
		Address addressPop = marketMypageService.selectAddressDetail(address.getAddressIdx());
		model.addAttribute("addressPop", addressPop);
		
	}
	
	@PostMapping("address-pop/upload/{addressIdx}")
	public String updateAddress(@SessionAttribute("authentication")Member certifiedUser,
							@PathVariable int addressIdx,
							Address address
							) {	
			
		marketMypageService.updateAddress(address);
		if(address.getIsDefault() != null) {
			marketMypageService.updateAddressIsDefault(address);
		}
		return "redirect:/market/mypage/address-list"; 
	}
	
	@GetMapping("address-pop2")
	public void addressPop2(Address address) {}
	
	@PostMapping("address-list/insert")
	public String insertAddress(@SessionAttribute("authentication")Member certifiedUser,
								Address address) {
		
		address.setUserIdx(certifiedUser.getUserIdx());
		if(address.getIsDefault() != null) {
			marketMypageService.updateAddressIsDefault(address);
		}
		marketMypageService.insertAddress(address);
		return "redirect:/market/mypage/address-list"; 
	}
		
	
	@GetMapping("address-list/delete")
	public String deleteAddress(@RequestParam("addressIdx")int addressIdx) {
		
		marketMypageService.deleteAddress(addressIdx);
		return "redirect:/market/mypage/address-list"; 
	}

	@GetMapping("acc-money")
	public void accMoney(@SessionAttribute(name="authentication")Member certifiedUser,
								Model model,
								SaveHistory shistory) {
		
		int member = certifiedUser.getUserIdx();
		String state = shistory.getState();
		System.out.println("state : " +  shistory.getState());
		
		List<Map<String, Object>> reserveList = marketMypageService.selectReserveList(member,state);
		Member memberInfo = marketMypageService.selectMemberInfo(member);
		int couponCnt = marketMypageService.selectCouponCount(member);
				
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
		model.addAttribute("reserveList", reserveList);
	}
	
	@GetMapping("enquiry/enquiry-form")
	public void enquiryForm(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model) {
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		model.addAttribute("memberInfo", memberInfo);
	}
	
	@GetMapping("enquiry/enquiry-pop")
	public void enquiryPop(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model,
							Order order,
							@RequestParam(value = "fromDate", required = false)String fromDate,
							@RequestParam(value = "endDate", required = false)String endDate) {
		System.out.println("order : " + order);
		List<Map<String, Object>> orderList = marketMypageService.selectOrderList(certifiedUser.getUserIdx(), order.getState(),fromDate, endDate);
		model.addAttribute("orderList", orderList);
	}
	
	@PostMapping("enquiry/upload")
	public String uploadEnquiry(QNA qna
							,@SessionAttribute("authentication")Member certifiedUser) {
		
		qna.setUserIdx(certifiedUser.getUserIdx());		
		marketMypageService.insertEnquiry(qna);
		return "redirect:/market/mypage/enquiry/enquiry-list"; 
	}
	
	
	
	@GetMapping("enquiry/enquiry-list")
	public void enquiryList(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model,
							@RequestParam(value = "fromDate", required = false)String fromDate,
							@RequestParam(value = "endDate", required = false)String endDate) {
		
		int member = certifiedUser.getUserIdx();
		List<Map<String, Object>> enquiryList = marketMypageService.selectEnquiryList(member,fromDate, endDate);
		Member memberInfo = marketMypageService.selectMemberInfo(member);
		int couponCnt = marketMypageService.selectCouponCount(member);
		
		model.addAttribute("enquiryList", enquiryList);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
	}

	@GetMapping("enquiry/faq")
	public void faq(@SessionAttribute(name="authentication")Member certifiedUser,
					Model model,
					QNA qna,
					@RequestParam(defaultValue="") String keyword,
					@RequestParam(required = false) String type) {
		
		int member = certifiedUser.getUserIdx();
		Member memberInfo = marketMypageService.selectMemberInfo(member);
		int couponCnt = marketMypageService.selectCouponCount(member);
		List<QNA> faqList = marketMypageService.selectFAQList(type,keyword);
		model.addAttribute("keyword", keyword);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);	
		model.addAttribute("faqList", faqList);

	}

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
			
		System.out.println("reviewDetail : " + reviewDetail);
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
		
	}
	
	

	@GetMapping("review/review-list")
	public void reviewList(@SessionAttribute(name="authentication")Member certifiedUser,
						   Model model,
						Review review,
						@RequestParam(value = "fromDate", required = false)String fromDate,
						@RequestParam(value = "endDate", required = false)String endDate) {
		
		List<Map<String, Object>> reviewList = marketMypageService.selectReviewList(certifiedUser.getUserIdx(),fromDate, endDate);
		Member memberInfo = marketMypageService.selectMemberInfo(certifiedUser.getUserIdx());
		int couponCnt = marketMypageService.selectCouponCount(certifiedUser.getUserIdx());
		
		System.out.println("reviewList : " + reviewList);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
	}
	
	@GetMapping("review/review-list2")
	public void myReviewList(@SessionAttribute(name="authentication")Member certifiedUser,
							Model model,
							Review review) {
		
		int userIdx = certifiedUser.getUserIdx();
		String state = review.getState();
		System.out.println("state : " +  review.getState());
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("userIdx", userIdx);
		commandMap.put("state", state);
		
		List<Map<String, Object>> myReviewList = marketMypageService.selectMyReviewList(commandMap);
	
		Member memberInfo = marketMypageService.selectMemberInfo(userIdx);
		int couponCnt = marketMypageService.selectCouponCount(userIdx);
		
		System.out.println("myReviewList : " + myReviewList);
		
		model.addAttribute("myReviewList", myReviewList);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("couponCnt", couponCnt);
	}
	
	@PostMapping("review/upload/{orderIdx}")
	public String uploadBoard(Review review
							,Member member
							,SaveHistory saveHistory
							, List<MultipartFile> files 
							,@SessionAttribute("authentication")Member certifiedUser
							,@PathVariable int orderIdx) {
		
		int user= certifiedUser.getUserIdx();
		System.out.println("files : " + files);
		System.out.println("orderIdx : " + orderIdx);
		System.out.println("userIdx : " + user);
		
		review.setUserIdx(user);
		saveHistory.setUserIdx(user);
		member.setUserIdx(user);		
		
		if(files == null) { //일반후기
			review.setType("0"); 
			saveHistory.setType("1"); 
			member.setSaveMoney(300);
			saveHistory.setAmount(300);
		}else {				 //사진후기
			review.setType("1"); 
			saveHistory.setType("2");
			member.setSaveMoney(600);
			saveHistory.setAmount(600);
		}
		System.out.println("saveHistory : " + saveHistory);
		marketMypageService.insertReview(files, review);
		marketMypageService.updateIsReview(orderIdx);
		//marketMypageService.insertSaveMoney(saveHistory);
		//marketMypageService.updateOrderNum(orderIdx);
		System.out.println(" member : " + member);
		//marketMypageService.updateReserveByReview(member);
				
		return "redirect:/market/mypage/review/review-list2"; 
	}

	
}
