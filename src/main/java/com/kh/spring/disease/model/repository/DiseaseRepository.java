package com.kh.spring.disease.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.disease.model.dto.Disease;

@Mapper
public interface DiseaseRepository {

	@Insert("insert into disease(ds_idx, name, price, count, explain, category)"
			+ " values(sc_ds_idx.nextval,#{name},#{price},#{count},#{explain},#{category})")
	void insertDisease(Disease disease);

	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path) "
			+ " values(sc_file_idx.nextval, sc_ds_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertFileInfo(FileDTO fileDTO);

}
