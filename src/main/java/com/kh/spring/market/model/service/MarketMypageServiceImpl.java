package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileUtil;
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.SaveHistory;
import com.kh.spring.market.model.dto.UserCoupon;
import com.kh.spring.market.model.repository.MarketMypageRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MarketMypageServiceImpl implements MarketMypageService{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

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

	
	@Override
	public List<Map<String, Object>> selectReviewDetail(Order order) {
		List<Map<String, Object>> reviewDetail = mypageRepository.selectReviewDetail(order);
		return reviewDetail;
	}

	@Override
	public void insertReview(List<MultipartFile> mfs, Review review) {
		
		FileUtil fileUtil = new FileUtil();
		
		//review 업로드
		mypageRepository.insertReview(review);
		
		logger.debug("mfs크기 : " + mfs.size());
		logger.debug("mfs 0번 인덱스 : " + mfs.get(0));
		logger.debug("mfs 0번 인덱스가 비었니? : " + mfs.get(0).isEmpty());
		
		//예외처리
		for (MultipartFile multipartFile : mfs) {
			if(!multipartFile.isEmpty()) {
				//파일 업로드
				mypageRepository.insertFileInfo(fileUtil.fileUpload(multipartFile));
			}	
		}
	}

	@Override
	public List<Review> selectMyReviewList(int userIdx) {
		
		List<Review> myReviewList = mypageRepository.selectMyReviewList(userIdx);
		return myReviewList;
	}

	@Override
	public void updatePrdIdx(int orderIdx) {

		mypageRepository.updatePrdIdx(orderIdx);
		
	}

	
	
}
