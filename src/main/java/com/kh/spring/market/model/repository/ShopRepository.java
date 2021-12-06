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
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
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

	List<Review> selectReviewByPrdIdx(int prdIdx);
	
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
			+ " values(SC_SH_IDX.nextval, #{userIdx}, , 0, #{saveMoney}, #{orderIdx})")
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

	@Select("select * from file_info where type_idx = ${rvIdx}")
	List<FileDTO> selectFileInfoByIdx(int rvIdx);
	
	@Update("update review set state = #{state} where rv_idx = #{rvIdx}")
	void updateReviewState(Map<String, Object> jsonMap);

	@Insert("insert into save_history(sh_idx, user_idx, state, type, amount, order_idx) values(sc_sh_idx.nextval,#{userIdx},1,#{type},#{price},#{orderIdx})")
	void insertSaveMoney(@Param("type")int type,@Param("userIdx") int userIdx,@Param("price") int price,@Param("orderIdx") int orderIdx);

	List<Map<String, Object>> selectQnAList(@Param("commandMap") Map<String, Object> commandmap,@Param("pageUtil") Paging pageUtil);

	int selectQnAListCnt(Map<String, Object> commandMap);
	
	@Update("update prd_detail set state = #{state} where dt_idx = #{dtIdx}")
	void updateProductState(Map<String, Object> jsonMap);

}
