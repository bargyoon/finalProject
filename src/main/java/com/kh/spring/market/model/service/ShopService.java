package com.kh.spring.market.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Cart;
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.QNA;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.prdListSet;
import com.kh.spring.member.model.dto.Member;

public interface ShopService {

	List<Product> selectPrdListBySet(prdListSet listSet, Paging pageUtil);

	String categoryToKor(String category);

	int prdListCnt(prdListSet listSet);

	List<Product> selectPrdDetailListByIdx(int prdIdx);

	Product selectPrdByIdx(int prdIdx);

	List<Review> selectReviewByPrdIdxWithPaging(int pn, prdListSet listSet, Paging pageUtil);

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

	Map<String, Object> getCntByType(int pn);

	int selectReviewCnt(prdListSet listSet, int pn);

	boolean updateLike(int userIdx, int rvIdx);

	List<Integer> checkLike(List<Review> reviews, int userIdx);

	List<QNA> selectQnaListByPrdIdxWithPaging(int pn, Paging pageUtilQna);

	int selectQnaCnt(int pn);

	boolean insertCart(List<Cart> cartInfos, Member certifiedUser);
	
	int selectQnAListCnt(Map<String, Object> commandMap);

	Map<String, Object> selectQnAList(Map<String, Object> commandMap, Paging pageUtil);

	List<FileDTO> selectFileList(List<Product> prdList);

	Map<String, FileDTO> selectFileInfoByPrdIdx(Product prdInfo);

	List<List<FileDTO>> selectReviewFiles(List<Review> reviews);

	Map<String, Object> selectAllByPrd(Product product);

	List<Map<String, Object>> selectPrdListMain(String string, int maxNum);

	void updateOrderState(Date afterWeek);


}
