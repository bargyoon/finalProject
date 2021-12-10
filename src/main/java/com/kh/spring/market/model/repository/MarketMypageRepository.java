package com.kh.spring.market.model.repository;

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
import com.kh.spring.market.model.dto.Like;
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
			+ " where user_idx = #{userIdx} and exp_date > sysdate and is_del=0")
	int selectCouponCount(int userIdx);
	
	//Save Money 목록
	List<Map<String, Object>> selectReserveList(@Param("userIdx")int userIdx, @Param("state")String state);
	
	//Save Money 등록 - 리뷰작성시
	@Insert("INSERT INTO SAVE_HISTORY(SH_IDX, USER_IDX, STATE, TYPE, AMOUNT) "
			+ " VALUES(SC_SH_IDX.NEXTVAL, #{userIdx}, 0, #{type}, #{amount})")
	void insertSaveMoney(SaveHistory saveHistory);
	//적립방법 type : 주문(0), 일반후기(1), 사진후기(2)
	
	@Update("update SAVE_HISTORY set order_num = (select order_num from \"ORDER\" where order_idx =#{orderIdx})")
	void updateOrderNum(int orderIdx);
	
	//Order List
	List<Map<String, Object>> selectOrderList(@Param("userIdx")int userIdx, @Param("state")String state, @Param("fromDate")String fromDate, @Param("endDate")String endDate);
	
	//reveiwList 구매확정 목록
	List<Map<String, Object>> selectReviewList(@Param("userIdx")int userIdx, @Param("fromDate")String fromDate, @Param("endDate")String endDate);
	
	//update state of ORDER
	@Update("update \"ORDER\""
			+ " set update_date = sysdate, state = 'orderCompelte'" //구매 후 일주일이 지나면 구매확정
			+ " where order_date+7 <= sysdate")
	void updateDateAndState();
	
	//review 작성폼
	List<Map<String, Object>> selectReviewDetail(Order order);
	
	//review 등록
	void insertReview(Review review);

	@Update("update \"ORDER\" set is_review =1 where order_idx=#{orderIdx}")
	void updateIsReview(int orderIdx);
	
	@Update("update \"USER\" set savemoney = savemoney + #{saveMoney} where user_idx = #{userIdx}")
	void updateReserveByReview(Member member);
	
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
	List<Map<String, Object>> selectMyReviewList(Map<String, Object> commandMap);
	
	//reviewFileList
	@Select("select * "
			+ " from file_info"
			+ " where type_idx in(select rv_idx from review where user_idx = #{userIdx})")
	List<FileDTO> selectFileList(int userIdx);
	
	//memberInfo
	Member selectMemberInfo(int userIdx);
	
	//문의 등록
	@Insert("insert into QNA(QNA_IDX, USER_IDX, prd_idx, ORDER_IDX, TITLE, CONTEXT, TYPE, TELL)"
			+ " values(SC_QNA_IDX.NEXTVAL, #{userIdx},"
			+ " ( SELECT prd_idx FROM \"ORDER\" WHERE order_idx = #{orderIdx}), "
			+ " #{orderIdx}, #{title}, #{context}, #{type}, #{tell})")
	void insertEnquiry(QNA qna);
	
	//문의폼 회원정보 
	List<Map<String, Object>> memberInfoForEnquiry(int userIdx);
	
	//문의 리스트
	List<Map<String, Object>> selectEnquiryList(@Param("userIdx")int userIdx, @Param("fromDate")String fromDate, @Param("endDate")String endDate);
	
	//FAQ 리스트
	List<QNA> selectFAQList(@Param("type")String type,@Param("keyword")String keyword);
	
	//address
	void insertAddress(Address address);
	
	void updateAddress(Address address);
	
	void updateAddressIsDefault(Address address);
	
	@Delete("DELETE \"ADDRESS\" where  address_idx = #{addressIdx}")
	void deleteAddress(int addressIdx);
	
	@Select("select * from \"ADDRESS\" where user_idx=#{userIdx} order by is_default desc")
	List<Address> selectAddressList(int userIdx);
	
	@Select("select * from \"ADDRESS\" where address_idx=${addressIdx}")
	Address selectAddressDetail(int addressIdx);
	
	//좋아요 like
	@Insert("insert into \"LIKE\" (LIKE_IDX, user_idx, board_idx) values(sc_like_idx.nextval, #{userIdx}, #{boardIdx})")
	void insertLike(Like like);
	@Update("update review set RECOMMAND = RECOMMAND+1 where rv_idx=${rvIdx}")
	void plusRecommand(int rvIdx);	
	
	//좋아요 취소
	@Delete("delete \"LIKE\" where like_idx=${likeIdx}")
	void deleteLike(int likeIdx);
	@Update("update review set RECOMMAND = RECOMMAND-1 where rv_idx=${rvIdx}")
	void minusRecommand(int rvIdx);
	
	//좋아요여부
	@Select("select LIKE_IDX from \"LIKE\" where board_idx=#{boardIdx} and user_idx=#{userIdx}")
	int selectisLike(int rvIdx);
	
	
	//장바구니
	List<Map<String, Object>> selectCartList(Member member);
	
	@Select("select count(cart_idx) from cart where user_idx=#{userIdx}")
	int selectCartCnt(int userIdx);
	
	@Delete("delete cart where cart_idx=#{cartIdx}")
	void deleteCart(int cartIdx);
	@Delete("delete cart where user_idx=#{userIdx}")
	void deleteAllCart(int userIdx);
	
	@Update("update cart set count = #{count} where cart_idx= #{cartIdx}")
	void updateCart(int count, int cartIdx);

	@Select("select PO_STOCK from PRD_DETAIL where DT_IDX = #{dtIdx}")
	int checkStock(Map<String, Object> checkInfo);

	@Update("update cart set count = #{prdCnt} where CART_IDX = #{cartIdx}")
	void updateCartCnt(Map<String, Object> checkInfo);

	@Select("select * from file_info where type_idx = #{object} and is_del = 0")
	FileDTO selectFileByIdx(Object object);

	@Select("select * from file_info where type_idx = ${rvIdx}")
	List<FileDTO> selectFileInfoByIdx(int rvIdx);
	
}
