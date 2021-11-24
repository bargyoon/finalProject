package com.kh.spring.disease.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.repository.DiseaseRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DiseaseServiceImpl implements DiseaseService{

	private final DiseaseRepository diseaseRepository;
	
	public List<Map<String, Object>> selectDiseaseList() {
		
		List<Map<String, Object>> commandList = new ArrayList<Map<String,Object>>();
		List<Disease> diseaseList = diseaseRepository.selectDiseaseList();
		for (Disease disease : diseaseList) {
			FileDTO files = diseaseRepository.selectIconByIdx(disease.getDsIdx());
			
			commandList.add(Map.of("disease", disease,"files", files));
		}
		
		return commandList;
		
		
	}
}
