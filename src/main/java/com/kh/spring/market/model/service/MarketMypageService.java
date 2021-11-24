package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.market.model.dto.Coupon;

public interface MarketMypageService {
	
	List<Coupon> selectCouponByIdx(int userIdx);
	

}
