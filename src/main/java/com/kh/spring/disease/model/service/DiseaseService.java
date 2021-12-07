package com.kh.spring.disease.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.dto.PriceImg;

public interface DiseaseService {

	List<Map<String, Object>> selectDiseaseList(Paging pageUtil);

	Disease selectDiseaseByIdx(long parseInt);

	void insertPriceImg(List<MultipartFile> files, PriceImg priceImg);

	int selectDiseaseListCnt();

}
