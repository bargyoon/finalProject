package com.kh.spring.market.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.SaveHistory;

@Mapper
public interface MarketMypageRepository {

	//Coupon
	@Select("select COUPON_IDX, c.NAME, c.SALE_PER, c.IS_DEL, u.USER_IDX, u.reg_date, u.UC_IDX, u.EXP_DATE"
			+ " from user_coupon u inner join coupon c"
			+ " USING(COUPON_IDX)"
			+ " where u.user_idx = #{userIdx} and u.exp_date>sysdate")
	List<Map<String, Object>> selectCouponByIdx(int userIdx);	
	
	@Select("select count(UC_IDX) "
			+ " from user_coupon"
			+ " where user_idx = #{userIdx}")
	int selectCouponCount(int userIdx);
	
	//Save Money
	@Select("select SH_IDX, USER_IDX, STATE, TYPE, AMOUNT, REG_DATE, SAVEMONEY"
			+ " from SAVE_HISTORY s inner join \"USER\" u"
			+ " USING(USER_IDX)"
			+ " where user_idx = #{userIdx}")
	List<SaveHistory> selectReserveList(int userIdx);
	
	//Order List
	@Select("select ORDER_IDX, UC_IDX, USER_IDX, o.order_date, PRD_IDX, PAYMENT_AMOUNT, o.state, ORDER_CNT, SAVE_MONEY, p.name, p.brand, po_name"
			+ " from \"ORDER\" o"
			+ " inner join product p USING(PRD_IDX)"
			+ " inner join prd_detail d USING(PRD_IDX)"
			+ " where user_idx = #{userIdx}")
	List<Map<String, Object>> selectOrderList(int userIdx);
	
	//reveiwList 구매확정 목록
	@Select("select ORDER_IDX, UC_IDX, USER_IDX, o.order_date, PRD_IDX, PAYMENT_AMOUNT, o.state, ORDER_CNT, SAVE_MONEY, p.name, p.brand, po_name"
			+ " from \"ORDER\" o"
			+ " inner join product p USING(PRD_IDX)"
			+ " inner join prd_detail d USING(PRD_IDX)"
			+ " where user_idx = #{userIdx} and o.state = 1") //구매확정이 1일 때
	List<Map<String, Object>> selectReviewList(int userIdx);
	
}
