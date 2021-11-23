package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.disease.model.dto.Disease;

public interface AdminService {


	void insertDisease(Disease disease, List<MultipartFile> mfs);

	List<Map<String, Object>> selectDiseaseList();

	
}
