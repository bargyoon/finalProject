package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.prdListSet;

public interface ShopService {

	List<Product> selectPrdList(prdListSet listSet, Paging pageUtil);

	String categoryToKor(String category);

	int prdListCnt(prdListSet listSet);

}
