package com.kh.spring.market.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Coupon;
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
	int selectAllCnt();
	
	@Select("select count(*) from prd_detail where state = #{state}")
	int selectSpecCnt(String state);

	List<Map<String, Object>> selectPrdList(@Param("commandMap") Map<String, Object> commandmap,@Param("pageUtil") Paging pageUtil);

	
	List<Map<String,Object>> selectOrderList();

	List<Map<String, Object>> selectOrderSpec(int dtIdx);

	int selectPrdListCnt(Map<String, Object> commandMap);

	@Select("select po_stock from prd_detail where dt_idx = #{dtIdx}")
	int selectPoStackByDtIdx(int dtIdx);

}
