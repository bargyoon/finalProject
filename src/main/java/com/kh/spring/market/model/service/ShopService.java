package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.prdListSet;

public interface ShopService {

	List<Product> selectPrdListBySet(prdListSet listSet, Paging pageUtil);

	String categoryToKor(String category);

	int prdListCnt(prdListSet listSet);

	List<Product> selectPrdListByIdx(int prdIdx);
	void insertProduct(List<MultipartFile> mainImg, List<MultipartFile> specImg, List<Map<String, Object>> commandList,
			Product product);

}
