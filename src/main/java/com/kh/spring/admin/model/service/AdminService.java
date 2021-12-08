package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.QNA;

public interface AdminService {


	void insertDisease(Disease disease, List<MultipartFile> mfs);

	Map<String, Object> selectPriceImgList(String state, Paging pageUtil);

	void updatePrice(Map<String, Object> jsonMap);

	void updateOrderState(Map<String, Object> jsonMap);

	void updateShipping(Order order);

	int selectPriceImgListCnt(String state);

	void updateReviewState(Map<String, Object> jsonMap);

	void updateProductState(Map<String, Object> jsonMap);

	void deleteBaord(int bdIdx);

	void deletePrd(List<Integer> dtIdxs);

	void deletePriceImg(List<Integer> piIdxs);

	void updateQnaAnswer(QNA qna);

	void deleteQna(List<Integer> qnaIdxs);

	void deleteComments(List<Integer> rvIdxs);


	

	
}
