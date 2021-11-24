package com.kh.spring.market.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.market.model.dto.Product;

@Mapper
public interface ShopRepository {

	@Select("select prd_idx, event_idx, sub_img_idx, name, brand, rating, min(price) price, sale_per, reg_date"
			+ " from product"
			+ " join prd_detail using (prd_idx)"
			+ " GROUP BY prd_idx, event_idx, sub_img_idx, name, brand, rating, sale_per, reg_date")
	List<Product> selectAllPrd();

	@Select("select prd_idx, event_idx, sub_img_idx, name, brand, rating, min(price) price, sale_per, reg_date"
			+ " from product"
			+ " join prd_detail using (prd_idx)"
			+ " where category = #{category}"
			+ " GROUP BY prd_idx, event_idx, sub_img_idx, name, brand, rating, sale_per, reg_date")
	List<Product> selectPrdByCategory(String category);

}
