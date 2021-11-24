package com.kh.spring.market.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.repository.ShopRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShopServiceImpl implements ShopService{

	private final ShopRepository shopRepository;

	public List<Product> selectPrdByCategory(String category) {
		
		List<Product> prdList = new ArrayList<Product>();
		
		if(category.equals("all")) {
			prdList = shopRepository.selectAllPrd();			
		} else {
			prdList = shopRepository.selectPrdByCategory(category);
		}
		return prdList;
	}

	public String categoryToKor(String category) {
		if(category.equals("feed")) {
			return "사료";
		} else if(category.equals("snack")) {
			return "간식";
		} else if(category.equals("health")) {
			return "건강관리";
		} else if(category.equals("potty")) {
			return "위생/배변";
		} else if(category.equals("beauty")) {
			return "미용/목욕";
		} else if(category.equals("feeder")) {
			return "급수기/급식기";
		} else if(category.equals("kennel")) {
			return "하우스/울타리";
		} else if(category.equals("vari-kennel")) {
			return "이동장";
		} else if(category.equals("clothes")) {
			return "의류/악세서리";
		} else if(category.equals("toy")) {
			return "장난감";
		}
		return "전체";
	}
}
