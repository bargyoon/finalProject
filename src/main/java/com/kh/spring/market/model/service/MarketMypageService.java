package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.SaveHistory;

public interface MarketMypageService {
	
	List<Map<String, Object>> selectCouponByIdx(int userIdx);
	
	int selectCouponCount(int userIdx);
	
	//Reserve
	List<SaveHistory> selectReserveList(int userIdx);
	
	//OrderList
	List<Map<String, Object>> selectOrderList(int userIdx);
	
	//reveiwList 구매확정 목록
	List<Map<String, Object>> selectReviewList(int userIdx);
	
}
