package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.prdListSet;

public interface ShopService {

	List<Product> selectPrdListBySet(prdListSet listSet, Paging pageUtil);

	String categoryToKor(String category);

	int prdListCnt(prdListSet listSet);

	List<Product> selectPrdListByIdx(int prdIdx);

	Product selectPrdByIdx(int prdIdx);

	List<Review> selectReviewByPrdIdx(int pn);

	Product selectPrdByDtIdx(int dtIdx);

	void insertProduct(List<MultipartFile> mainImg, List<MultipartFile> specImg, List<Map<String, Object>> commandList,
			Product product);

	Map<String, Object> selectPrdList(Map<String, Object> commandmap, Paging pageUtil);

	Map<String, Object> selectOrderList(Map<String, Object> commandMap, Paging pageUtil);

	int selectPrdListCnt(Map<String, Object> commandMap);

	List<Coupon> selectCouponByUserIdx(int userIdx);

	int selectPoStackByDtIdx(int dtIdx);
	int selectOrderListCnt(Map<String, Object> commandMap);

	int selectItemCommentListCnt(Map<String, Object> commandMap);

	List<Map<String,Object>> selectItemCommentList(Map<String, Object> commandMap, Paging pageUtil);

	boolean insertOrder(List<Order> orderInfos);

	Map<String, Object> getCntByType(List<Review> reviews);
	int selectQnAListCnt(Map<String, Object> commandMap);

	List<Map<String, Object>> selectQnAList(Map<String, Object> commandMap, Paging pageUtil);

}
