package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.market.model.dto.Order;

public interface AdminService {


	void insertDisease(Disease disease, List<MultipartFile> mfs);

	Map<String, Object> selectPriceImgList(String state);

	void updatePrice(Map<String, Object> jsonMap);

	void updateOrderState(Map<String, Object> jsonMap);

	void updateShipping(Order order);


	

	
}
