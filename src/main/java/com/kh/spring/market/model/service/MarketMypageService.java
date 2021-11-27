package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.SaveHistory;
import com.kh.spring.member.model.dto.Member;

public interface MarketMypageService {
	
	List<Map<String, Object>> selectCouponByIdx(int userIdx);
	
	int selectCouponCount(int userIdx);
	
	//Reserve
	List<Map<String, Object>> selectReserveList(int userIdx, String state);
	
	//OrderList
	List<Map<String, Object>> selectOrderList(int userIdx);
	
	//reveiwList 구매확정 목록
	List<Map<String, Object>> selectReviewList(int userIdx);
	
	//updateDate, state
	void updateDateAndState();
	
	//reveiwListByState 구매확정 목록(상태별)
	List<Review> selectReviewListByState(String state);
	
	//reveiwDetail 구매확정 목록
	List<Map<String, Object>> selectReviewDetail(Order order);
	
	//review 등록
	void insertReview(List<MultipartFile> mfs, Review review);
	
	//prdIdx 업데이트
	void updatePrdIdx(int orderIdx);
	
	//reviewList 작성한 리뷰 목록
	List<Map<String, Object>> selectMyReviewList(int userIdx, String state);
	
	//fileList
	List<FileDTO> selectFileList(int userIdx);
	
	//memberInfo
	Member selectMemberInfo(int userIdx);
}
