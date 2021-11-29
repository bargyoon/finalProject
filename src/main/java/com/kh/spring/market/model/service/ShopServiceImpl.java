package com.kh.spring.market.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.prdListSet;
import com.kh.spring.market.model.repository.ShopRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShopServiceImpl implements ShopService{

	private final ShopRepository shopRepository;

	public List<Product> selectPrdListBySet(prdListSet listSet, Paging pageUtil) {
		
		List<Product> prdList = shopRepository.selectPrdListBySet(listSet, pageUtil);
		
		return prdList;
	}
	

	private String makeOrderSql(String option) {
		String optionSql = "order by ";
		if(option == null) {
			return "";
		} else if(option.equals("pop")) {
			optionSql += "rating desc";
		} else if(option.equals("new")) {
			optionSql += "reg_date desc";
		} else if(option.equals("high")) {
			optionSql += "price desc";
		} else if(option.equals("low")) {
			optionSql += "price asc";
		}
		
		return optionSql;
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


	public int prdListCnt(prdListSet listSet) {
		int res = 0;
		res = shopRepository.prdListCnt(listSet);
		System.out.println("res : " + res);
		
		return res;
	}


	public List<Product> selectPrdListByIdx(int prdIdx) {
		
		List<Product> prdList = shopRepository.selectPrdListByIdx(prdIdx);
		return prdList;
	}
}
