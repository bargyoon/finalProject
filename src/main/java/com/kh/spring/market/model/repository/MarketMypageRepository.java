package com.kh.spring.market.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.market.model.dto.Coupon;

@Mapper
public interface MarketMypageRepository {

	@Select("select COUPON_IDX, NAME, SALE_PER, IS_DEL, USER_IDX, u.reg_date, UC_IDX"
			+ " from user_coupon u inner join coupon c"
			+ " USING(COUPON_IDX)"
			+ " where u.user_idx = #{userIdx}")
	List<Coupon> selectCouponByIdx(int userIdx);
	
	//List<Map<String, Object>> selectRentAndMemberById(String userId);
}
