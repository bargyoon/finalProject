package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.market.model.dto.Address;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.QNA;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.SaveHistory;
import com.kh.spring.market.model.repository.MarketMypageRepository;
import com.kh.spring.member.model.dto.Member;

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
	public List<Map<String, Object>> selectReserveList(int userIdx, String state) {
		
		List<Map<String, Object>> reserveList = mypageRepository.selectReserveList(userIdx, state);
		return reserveList;
	}

	@Override
	public List<Map<String, Object>> selectOrderList(int userIdx, int state, String fromDate, String endDate) {
		List<Map<String, Object>> orderList = mypageRepository.selectOrderList(userIdx,state,fromDate, endDate);
		return orderList;
	}

	@Override
	public List<Map<String, Object>> selectReviewList(int userIdx, String fromDate, String endDate) {
		List<Map<String, Object>> reviewList = mypageRepository.selectReviewList(userIdx, fromDate, endDate);
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
		
		if(mfs != null) {
			//예외처리
			for (MultipartFile multipartFile : mfs) {
				if(!multipartFile.isEmpty()) {
					//파일 업로드
					mypageRepository.insertFileInfo(fileUtil.fileUpload(multipartFile));
				}
			}
		}		
	}
	
	@Override
	public void updateIsReview(int orderIdx) {
		mypageRepository.updateIsReview(orderIdx);		
	}

	@Override
	public List<Map<String, Object>> selectMyReviewList(int userIdx, String state) {
		
		List<Map<String, Object>> myReviewList = mypageRepository.selectMyReviewList(userIdx, state);
		return myReviewList;
	}
	
	@Override
	public List<FileDTO> selectFileList(int userIdx) {
		List<FileDTO> files = mypageRepository.selectFileList(userIdx);
		return files;
	}

	@Override
	public void updatePrdIdx(int orderIdx) {

		mypageRepository.updatePrdIdx(orderIdx);
		
	}

	@Override
	public Member selectMemberInfo(int userIdx) {
		
		Member selectMemberInfo = mypageRepository.selectMemberInfo(userIdx);
		return selectMemberInfo;
	}

	@Override
	public List<Review> selectReviewListByState(int state) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateDateAndState() {
		mypageRepository.updateDateAndState();
		
	}

	@Override
	public List<Map<String, Object>> memberInfoForEnquiry(int userIdx) {
		List<Map<String, Object>> memberEnquiry = mypageRepository.memberInfoForEnquiry(userIdx);
		return memberEnquiry;
	}

	@Override
	public List<Map<String, Object>> selectEnquiryList(int userIdx, String fromDate, String endDate) {
		List<Map<String, Object>> selectEnquiryList = mypageRepository.selectEnquiryList(userIdx, fromDate, endDate);
		return selectEnquiryList;
	}

	@Override
	public void insertEnquiry(QNA qna) {
		mypageRepository.insertEnquiry(qna);
		
	}
	
	@Override
	public List<QNA> selectFAQList(String type) {
		List<QNA> faqList = mypageRepository.selectFAQList(type);
		 return faqList;
	}


	@Override
	public void insertSaveMoney(SaveHistory saveHistory) {
		mypageRepository.insertSaveMoney(saveHistory);
		
	}

	@Override
	public void insertAddress(Address address) {
		mypageRepository.insertAddress(address);
	}

	@Override
	public void updateAddress(Address address) {
		mypageRepository.updateAddress(address);
	}

	@Override
	public void deleteAddress(int addressIdx) {
		mypageRepository.deleteAddress(addressIdx);
	}

	@Override
	public List<Address> selectAddressList(int userIdx) {
		return mypageRepository.selectAddressList(userIdx);
	}

	@Override
	public void updateAddressIsDefault(Address address) {
		mypageRepository.updateAddressIsDefault(address);
	}

	@Override
	public Address selectAddressDetail(int addressIdx) {
		return mypageRepository.selectAddressDetail(addressIdx);
	}

	
	
	
}
