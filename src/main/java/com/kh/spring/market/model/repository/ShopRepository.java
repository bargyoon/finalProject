package com.kh.spring.market.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.market.model.dto.Product;

@Mapper
public interface ShopRepository {

	@Select("select prd_idx, event_idx, sub_img_idx, name, brand, rating, min(price) price, sale_per, reg_date, type"
			+ " from product"
			+ " join prd_detail using (prd_idx)"
			+ " GROUP BY prd_idx, event_idx, sub_img_idx, name, brand, rating, sale_per, reg_date, type"
			+ " ${optionSql}")
	List<Product> selectAllPrd(String optionSql);

	@Select("select prd_idx, event_idx, sub_img_idx, name, brand, rating, min(price) price, sale_per, reg_date, type"
			+ " from product"
			+ " join prd_detail using (prd_idx)"
			+ " where category = #{category}"
			+ " GROUP BY prd_idx, event_idx, sub_img_idx, name, brand, rating, sale_per, reg_date, type"
			+ " ${optionSql}")
	List<Product> selectPrdByCategory(@Param("category") String category, @Param("optionSql") String optionSql);

}
