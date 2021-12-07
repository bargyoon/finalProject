package com.kh.spring.disease.model.repository;

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
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.dto.PriceImg;

@Mapper
public interface DiseaseRepository {

	@Insert("insert into disease(ds_idx, name, price, count, explain, category)"
			+ " values(sc_ds_idx.nextval,#{name},#{price},#{count},#{explain},#{category})")
	void insertDisease(Disease disease);

	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path) "
			+ " values(sc_file_idx.nextval, sc_ds_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertDsFileInfo(FileDTO fileDTO);
	
	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path) "
			+ " values(sc_file_idx.nextval, sc_pi_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertPiFileInfo(FileDTO fileDTO);

	@Select("select * from disease")
	List<Disease> selectDiseaseList();
	
	@Select("select * from file_info where type_idx = #{typeIdx}")
	FileDTO selectFileByIdx(long typeIdx);

	@Select("select * from disease where ds_idx = #{dsIdx}")
	Disease selectDiseaseByIdx(long dsIdx);

	@Insert("insert into price_img(pi_idx, ds_idx, user_idx)"
			+ " values(sc_pi_idx.nextval,#{dsIdx},#{userIdx})")
	void insertPriceImg(PriceImg priceImg);

	List<Map<String, Object>> selectPriceImgList(@Param("state") String state, @Param("pageUtil")Paging pageUtil);
	
	@Select("select * from (select rownum rnum, ds_idx, name, explain, "
			+ "category, count,price, rename_file_name, save_path from "
			+ "(select d.ds_idx, d.name, d.explain, d.category, d.count, d.price,"
			+ "f.rename_file_name, f.save_path from disease d left join file_info f "
			+ "on(d.ds_idx = f.type_idx))) where rnum between ${((curPage-1) * cntPerPage) + 1}"
			+ "	and ${curPage * cntPerPage} ")
	List<Map<String, Object>> selectDiseaseListWithImg(Paging pageUtil);

	@Select("select count(*) from price_img")
	int selectAllCnt();
	
	@Select("select count(*) from price_img where state = #{keyword}")
	int selectSpecCnt(String keyword);

	@Update("update price_img set price = #{price}, state = 'Y' where pi_idx = #{piIdx}")
	void updatePrice(Map<String, Object> jsonMap);

	@Update("update disease set count = #{count}, price = round(#{price},-2) where ds_idx = #{dsIdx}")
	void updateDiseasePriceAndCount(Disease disease);

	@Select("select count(*) from disease")
	int selectDiseaseListCnt();

	
	int selectPriceImgListCnt(String state);

	@Delete("delete from price_img where pi_idx = #{piIdx}")
	void deletePriceImg(Integer piIdx);
	
	

}
