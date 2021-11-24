package com.kh.spring.disease.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
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

	@Select("select * from price_img")
	List<PriceImg> selectPriceImgList();

}
