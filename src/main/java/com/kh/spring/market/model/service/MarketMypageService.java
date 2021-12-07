package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.market.model.dto.Address;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.QNA;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.SaveHistory;
import com.kh.spring.member.model.dto.Member;

public interface MarketMypageService {
	
	List<Map<String, Object>> selectCouponByIdx(int userIdx);
	
	int selectCouponCount(int userIdx);
	
	//Reserve SaveHistory
	List<Map<String, Object>> selectReserveList(int userIdx, String state);
	void insertSaveMoney(SaveHistory saveHistory);
	
	//OrderList
	List<Map<String, Object>> selectOrderList(int userIdx, String state,String fromDate, String endDate);
	
	//reveiwList 구매확정 목록
	List<Map<String, Object>> selectReviewList(int userIdx, String fromDate, String endDate);
	
	//updateDate, state
	void updateDateAndState();
	
	//reveiwListByState 구매확정 목록(상태별)
	List<Review> selectReviewListByState(int state);
	
	//reveiwDetail 구매확정 목록
	List<Map<String, Object>> selectReviewDetail(Order order);
	
	//review 등록
	void insertReview(List<MultipartFile> mfs, Review review);
	void updateIsReview(int orderIdx);
	
	//prdIdx 업데이트
	void updatePrdIdx(int orderIdx);
	
	//reviewList 작성한 리뷰 목록
	List<Map<String, Object>> selectMyReviewList(Map<String, Object> commandMap);
	
	//fileList
	List<FileDTO> selectFileList(int userIdx);
	
	//memberInfo
	Member selectMemberInfo(int userIdx);
	
	//문의폼 회원정보 ***********필요없을듯
	List<Map<String, Object>> memberInfoForEnquiry(int userIdx);
	
	//문의 리스트
	List<Map<String, Object>> selectEnquiryList(int userIdx, String fromDate, String endDate);
	List<QNA> selectFAQList(String type,String keyword);
	
	//문의 등록
	void insertEnquiry(QNA qna);
	
	//address
	void insertAddress(Address address);
	void updateAddress(Address address);
	void updateAddressIsDefault(Address address);
	void deleteAddress(int addressIdx);
	List<Address> selectAddressList(int userIdx);
	Address selectAddressDetail(int addressIdx);
	
	//좋아요 like
	int selectisLike(int rvIdx);
	
	//장바구니
	List<Map<String, Object>> selectCartList(Member member);
	void deleteCart(int cartIdx);
	void deleteAllCart(int userIdx);
	void updateCart(int count, int cartIdx);

	boolean checkStock(Map<String, Object> checkInfo);

}
