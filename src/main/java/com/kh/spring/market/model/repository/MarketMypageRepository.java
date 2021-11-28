package com.kh.spring.market.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.QNA;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.SaveHistory;
import com.kh.spring.market.model.dto.prdListSet;
import com.kh.spring.member.model.dto.Member;

@Mapper
public interface MarketMypageRepository {

	//Coupon
	List<Map<String, Object>> selectCouponByIdx(int userIdx);	
	
	@Select("select count(UC_IDX) "
			+ " from user_coupon"
			+ " where user_idx = #{userIdx} and exp_date > sysdate")
	int selectCouponCount(int userIdx);
	
	//Save Money
	List<Map<String, Object>> selectReserveList(@Param("userIdx")int userIdx, @Param("state")String state);
	
	//Order List
	List<Map<String, Object>> selectOrderList(int userIdx);
	
	//reveiwList 구매확정 목록
	List<Map<String, Object>> selectReviewList(int userIdx);
	
	//updateDate 
	@Update("update \"ORDER\""
			+ " set update_date = sysdate, state = 1" //구매 후 일주일이 지나면 구매확정
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
	
	//reviewList
	List<Map<String, Object>> selectMyReviewList(@Param("userIdx")int userIdx, @Param("state")String state);
	
	
	//selectReviewListByState 구매확정 목록(상태별로)*********
		@Select("select r.RV_IDX, r.USER_IDX, PRD_IDX, r.ORDER_IDX, r.STATE, r.RATING, r.TYPE, r.RECOMMAND, r.REG_DATE, RV_CONTENT, p.name, p.brand, d.po_name"
				+ " from REVIEW r"
				+ " inner join product p USING(PRD_IDX)"
				+ " inner join prd_detail d USING(PRD_IDX)"
				+ " where USER_IDX = #{userIdx} and r.STATE = #{state}")
		List<Review> selectMyReviewListByState(int state);
	
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
	
	//문의폼 회원정보 ***********필요없을듯
	List<Map<String, Object>> memberInfoForEnquiry(int userIdx);
	
	//문의 리스트
	List<Map<String, Object>> selectEnquiryList(@Param("userIdx")int userIdx);
}
