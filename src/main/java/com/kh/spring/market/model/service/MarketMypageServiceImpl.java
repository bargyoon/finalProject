package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.UserCoupon;
import com.kh.spring.market.model.repository.MarketMypageRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MarketMypageServiceImpl implements MarketMypageService{

	private final MarketMypageRepository mypageRepository;

	@Override
	public List<Coupon> selectCouponByIdx(int userIdx) {

		List<Coupon> userCoupon = mypageRepository.selectCouponByIdx(userIdx);
		
		return userCoupon;
	}
	
}
