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
import com.kh.spring.market.model.dto.Cart;
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.QNA;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.prdListSet;

@Mapper
public interface ShopRepository {
	
	List<Product> selectPrdListBySet(@Param("listSet") prdListSet listSet, @Param("pageUtil") Paging pageUtil);

	int prdListCnt(@Param("listSet") prdListSet listSet);
	
	@Insert("insert into product(prd_idx, event_idx, sub_img_idx, name, brand, category, coupon_avail, sm_avail,sale_per, type)"
			+ " values(sc_prd_idx.nextval, 1, sc_si_idx.nextval, #{name},#{brand},#{category},#{couponAvail},#{smAvail},#{salePer},#{type})")
	void insertProduct(Product product);

	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path) "
			+ " values(sc_file_idx.nextval, sc_prd_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertPrdFileInfo(FileDTO fileUpload);
	
	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path) "
			+ " values(sc_file_idx.nextval, sc_si_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertSubImgFileInfo(FileDTO fileUpload);

	@Insert("insert into prd_detail(prd_idx, po_name, price, po_stock, dt_idx, sale_price) values(sc_prd_idx.currval,#{map.option}, #{map.price}, #{map.stock}, sc_dt_idx.nextval, ${salePrice})")
	void insertPrdDetail(@Param("map")Map<String, Object> map,@Param("salePrice") int salePrice);

	@Select("select * from product join prd_detail using (prd_idx) where prd_idx = #{prdIdx}")
	List<Product> selectPrdListByIdx(int prdIdx);

	Product selectPrdByIdx(int prdIdx);

	List<Review> selectReviewByPrdIdxWithPaging(@Param("pn") int prdIdx, @Param("listSet") prdListSet listSet, @Param("pageUtil") Paging pageUtil);
	
	int selectReviewCnt(@Param("listSet") prdListSet listSet, @Param("pn") int pn);
	
	List<Coupon> selectCouponByUserIdx(int userIdx);
	

	@Select("select * from prd_detail where dt_idx = #{dtIdx}")
	Product selectPrdByDtIdx(int dtIdx);
	
	@Select("select count(*) from prd_detail")
	int selectAllPrdCnt();
	
	@Select("select count(*) from prd_detail where state = #{state}")
	int selectPrdSpecCnt(String state);
	
	@Select("select count(*) from(select order_num, count(order_num) cnt from \"ORDER\" group by order_num)")
	int selectAllOrderCnt();
	
	@Select("select count(*) from(select order_num, count(order_num) cnt from \"ORDER\" where state = #{state} group by order_num)")
	int selectOrderSpecCnt(String state);

	List<Map<String, Object>> selectPrdList(@Param("commandMap") Map<String, Object> commandmap,@Param("pageUtil") Paging pageUtil);

	
	List<Map<String,Object>> selectOrderList(@Param("commandMap") Map<String, Object> commandmap,@Param("pageUtil") Paging pageUtil);

	List<Map<String, Object>> selectOrderSpec(long orderNum);

	int selectPrdListCnt(Map<String, Object> commandMap);

	@Select("select po_stock from prd_detail where dt_idx = #{dtIdx}")
	int selectPoStackByDtIdx(int dtIdx);
	
	@Insert("insert into \"ORDER\"(ORDER_IDX, DT_IDX, USER_IDX, UC_IDX, PRD_IDX, PAYMENT_AMOUNT, ORDER_CNT, SAVE_MONEY, ORDER_NUM, CP_SAVE_MONEY)"
			+ " values(SC_ORDER_IDX.nextval, #{dtIdx}, #{userIdx}, #{ucIdx}, #{proIdx}, #{paymentAmount}, #{orderCnt}, #{saveMoney}, #{orderNum}, #{cpSaveMoney})")
	boolean insertOrder(Order order);

	@Insert("insert into SAVE_HISTORY(SH_IDX, USER_IDX, STATE, TYPE, AMOUNT, ORDER_IDX)"
			+ " values(SC_SH_IDX.nextval, #{userIdx}, 0, 0, #{saveMoney}, #{orderIdx})")
	boolean insertSmHistory(Order order);

	@Update("update user_coupon set is_del = 1 where uc_idx = #{ucIdx}")
	boolean updateUcIsDel(int ucIdx);

	@Update("update \"USER\" set savemoney = savemoney - #{saveMoney} where user_idx = #{userIdx}")
	boolean updateUserMinusSm(Order order);

	@Update("update \"ORDER\" set state = #{state}, update_date = sysdate  where order_num = #{orderNum}")
	void updateOrderState(Map<String, Object> jsonMap);

	@Update("update \"ORDER\" set shipping_company = #{shippingCompany}, shipping_num = #{shippingNum},update_date = sysdate, state= 'delivering' where order_num = #{orderNum}")
	void updateShipping(Order order);

	int selectOrderListCnt(Map<String, Object> commandMap);

	int selectItemCommentListCnt(Map<String, Object> commandMap);

	List<Map<String,Object>> selectItemCommentList(@Param("commandMap") Map<String, Object> commandmap,@Param("pageUtil") Paging pageUtil);

	List<Review> selectReviewByPrdIdx(int pn);
	
	@Select("select count(*) from \"LIKE\" where board_idx = #{rvIdx} and user_idx = #{userIdx}")
	int selectListForCheck(@Param("userIdx") int userIdx, @Param("rvIdx") int rvIdx);

	@Insert("insert into \"LIKE\" (LIKE_IDX, USER_IDX, BOARD_IDX) values(SC_LIKE_IDX.nextval, #{userIdx}, #{rvIdx})")
	void insertLike(@Param("userIdx") int userIdx, @Param("rvIdx") int rvIdx);

	@Update("update REVIEW set RECOMMAND = RECOMMAND + 1 where RV_IDX = #{rvIdx}")
	void updateRvRecommandPlus(int rvIdx);

	@Delete("delete from \"LIKE\" where user_idx = #{userIdx} and BOARD_IDX = #{rvIdx}")
	void deleteLike(@Param("userIdx") int userIdx, @Param("rvIdx") int rvIdx);

	@Update("update REVIEW set RECOMMAND = RECOMMAND - 1 where RV_IDX = #{rvIdx}")
	void updateRvRecommandMinus(int rvIdx);

	List<QNA> selectQnaListByPrdIdxWithPaging(@Param("pn") int pn, @Param("pageUtil") Paging pageUtilQna);

	@Select("select count(*) from QNA where prd_idx = #{pn} and type = 0")
	int selectQnaCnt(int pn);

	@Insert("insert into cart (CART_IDX, USER_IDX, PRD_IDX, COUNT, DT_IDX) values(SC_CART_IDX.nextval, #{userIdx}, #{prdIdx}, #{count}, #{dtIdx})")
	void insertCart(Cart cartInfos);
	
	@Select("select * from cart where USER_IDX = #{userIdx} and DT_IDX = #{dtIdx}")
	Cart selectCartforCheck(Cart cart);

}
