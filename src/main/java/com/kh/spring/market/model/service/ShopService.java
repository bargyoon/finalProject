package com.kh.spring.market.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.market.model.dto.Product;

public interface ShopService {

	List<Product> selectPrdByCategory(String category, String option);

	String categoryToKor(String category);

}
