package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.SaveHistory;
import com.kh.spring.market.model.dto.UserCoupon;
import com.kh.spring.market.model.repository.MarketMypageRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MarketMypageServiceImpl implements MarketMypageService{

	private final MarketMypageRepository mypageRepository;

	@Override
	public List<Map<String, Object>> selectCouponByIdx(int userIdx) {

		List<Map<String, Object>> userCoupon = mypageRepository.selectCouponByIdx(userIdx);
		
		return userCoupon;
	}

	@Override
	public int selectCouponCount(int userIdx) {

		int couponCnt = mypageRepository.selectCouponCount(userIdx);
		return couponCnt;
	}

	@Override
	public List<SaveHistory> selectReserveList(int userIdx) {
		
		List<SaveHistory> reserveList = mypageRepository.selectReserveList(userIdx);
		return reserveList;
	}

	@Override
	public List<Map<String, Object>> selectOrderList(int userIdx) {
		List<Map<String, Object>> orderList = mypageRepository.selectOrderList(userIdx);
		return orderList;
	}

	@Override
	public List<Map<String, Object>> selectReviewList(int userIdx) {
		List<Map<String, Object>> reviewList = mypageRepository.selectOrderList(userIdx);		
		return reviewList;
	}
	
}
