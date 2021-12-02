package com.kh.spring.market.model.repository;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Address;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.QNA;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.SaveHistory;
import com.kh.spring.market.model.dto.prdListSet;
import com.kh.spring.member.model.dto.Member;

import lombok.Delegate;

@Mapper
public interface MarketMypageRepository {

	//Coupon
	List<Map<String, Object>> selectCouponByIdx(int userIdx);	
	
	@Select("select count(UC_IDX) "
			+ " from user_coupon"
			+ " where user_idx = #{userIdx} and exp_date > sysdate")
	int selectCouponCount(int userIdx);
	
	//Save Money 목록
	List<Map<String, Object>> selectReserveList(@Param("userIdx")int userIdx, @Param("state")String state);
	
	//Save Money 등록 - 구입시
	@Insert("INSERT INTO SAVE_HISTORY(SH_IDX, USER_IDX, STATE, TYPE, AMOUNT, order_idx) "
			+ " VALUES(SC_SH_IDX.NEXTVAL, #{userIdx}, #{state}, #{type}, #{amount}, #{orderIdx})")
	void insertSaveMoney(SaveHistory saveHistory);
	//적립금 유형 : 주문(0), 일반후기(2), 사진후기(3), 적립금결제(4), 결제취소(5)
	
	//Order List
	List<Map<String, Object>> selectOrderList(@Param("userIdx")int userIdx, @Param("state")int state);
	
	//reveiwList 구매확정 목록
	List<Map<String, Object>> selectReviewList(int userIdx);
	
	//update state of ORDER
	@Update("update \"ORDER\""
			+ " set update_date = sysdate, state = 4" //구매 후 일주일이 지나면 구매확정(state=4)
			+ " where order_date+7 <= sysdate")
	void updateDateAndState();
	
	//review 작성폼
	List<Map<String, Object>> selectReviewDetail(Order order);
	
	//review 등록
	@Insert("insert into review(rv_idx, user_idx, prd_idx, order_idx, rating, type, rv_content) "
			+ "values(SC_RV_IDX.NEXTVAL, #{userIdx}, #{prdIdx}, #{orderIdx}, #{rating}, #{type}, #{rvContent})")
	void insertReview(Review review);
	
	//review 사진 등록
	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path)"
			+ " values(sc_file_idx.nextval, sc_rv_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertFileInfo(FileDTO fileDTO);
	
	//prdIdx update
	@Update("update REVIEW "
			+ " set PRD_IDX = ( "
			+ "    select PRD_IDX "
			+ "    from \"ORDER\" "
			+ "    where order_idx=#{orderIdx} "
			+ "    ) "
			+ " where order_idx=#{orderIdx}")
	void updatePrdIdx(int orderIdx);
	
	//myReviewList
	List<Map<String, Object>> selectMyReviewList(@Param("userIdx")int userIdx, @Param("state")String state);
	
	//reviewFileList
	@Select("select * "
			+ " from file_info"
			+ " where type_idx in(select rv_idx from review where user_idx = #{userIdx})")
	List<FileDTO> selectFileList(int userIdx);
	
	//memberInfo
	Member selectMemberInfo(int userIdx);
	
	//문의 등록
	@Insert("insert into QNA(QNA_IDX, USER_IDX, prd_idx, ORDER_IDX, TITLE, CONTEXT, TYPE)"
			+ " values(SC_QNA_IDX.NEXTVAL, #{userIdx},"
			+ " ( SELECT prd_idx FROM \"ORDER\" WHERE order_idx = #{orderIdx}), #{orderIdx}, #{title}, #{context}, #{type})")
	void insertEnquiry(QNA qna);
	
	//문의폼 회원정보 
	List<Map<String, Object>> memberInfoForEnquiry(int userIdx);
	
	//문의 리스트
	List<Map<String, Object>> selectEnquiryList(@Param("userIdx")int userIdx, @Param("fromDate")String fromDate, @Param("endDate")String endDate);
	
	//address
	@Insert("insert into \"ADDRESS\"(address_idx,address,user_idx, address_name, address_detail)"
			+ "values(SC_ADDRESS_IDX.NEXTVAL,#{address},#{userIdx},#{addressName},#{addressDetail})")
	void insertAddress(Address address);
	
	void updateAddress(Address address);
	
	@Update("update \"ADDRESS\" "
			+ " set is_default = 'N'"
			+ " where address_idx != #{addressIdx} and user_idx = #{userIdx}") //나머지 배송지 is_default를 N으로
	void updateIsDefault(Address address);
	
	@Delete("DELETE \"ADDRESS\" where  address_idx = #{addressIdx}")
	void deleteAddress(int addressIdx);
	
	@Select("select * from \"ADDRESS\" where user_idx=#{userIdx} order by is_default desc")
	List<Address> selectAddressList(int userIdx);
	
	@Select("select * from \"ADDRESS\" where address_idx=${addressIdx}")
	Address selectAddressDetail(int addressIdx);
	
}
