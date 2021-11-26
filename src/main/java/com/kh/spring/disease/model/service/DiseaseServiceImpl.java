package com.kh.spring.disease.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.dto.PriceImg;
import com.kh.spring.disease.model.repository.DiseaseRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DiseaseServiceImpl implements DiseaseService{

	private final DiseaseRepository diseaseRepository;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<Map<String, Object>> selectDiseaseList() {
		
		List<Map<String, Object>> commandList = diseaseRepository.selectDiseaseListWithImg();
		for (Map<String, Object> map : commandList) {
			FileDTO files = new FileDTO();
			files.setSavePath((String) map.get("SAVE_PATH"));
			files.setRenameFileName((String) map.get("RENAME_FILE_NAME"));
			map.put("downloadURL", files.getDownloadURL());
		}
		
		
		return commandList;
		
		
	}

	public Disease selectDiseaseByIdx(long dsIdx) {
		return diseaseRepository.selectDiseaseByIdx(dsIdx);
		
	}

	
	public void insertPriceImg(List<MultipartFile> files, PriceImg priceImg) {
		diseaseRepository.insertPriceImg(priceImg);
		
		FileUtil fileUtil = new FileUtil();
		for (MultipartFile multipartFile : files) {
			if (!multipartFile.isEmpty()) {
				diseaseRepository.insertPiFileInfo(fileUtil.fileUpload(multipartFile));
			}

		}

		
	}
}
