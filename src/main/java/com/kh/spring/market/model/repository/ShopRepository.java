package com.kh.spring.market.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.prdListSet;

@Mapper
public interface ShopRepository {
	
	List<Product> selectPrdList(@Param("listSet") prdListSet listSet, @Param("pageUtil") Paging pageUtil);

	int prdListCnt(@Param("listSet") prdListSet listSet);

}
