package com.kh.spring.admin.model.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.repository.DiseaseRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	private final DiseaseRepository diseaseRepository;

	public void insertDisease(Disease disease, List<MultipartFile> mfs) {
		FileUtil fileUtil = new FileUtil();
		if (disease.getPrice() != 0) {
			disease.setCount(1);
		}
		diseaseRepository.insertDisease(disease);
		for (MultipartFile multipartFile : mfs) {
			if (!multipartFile.isEmpty()) {
				diseaseRepository.insertFileInfo(fileUtil.fileUpload(multipartFile));
			}

		}

	}

	
	
	

}
