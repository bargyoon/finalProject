package com.kh.spring.admin.model.service;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.dto.PriceImg;
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
				diseaseRepository.insertDsFileInfo(fileUtil.fileUpload(multipartFile));
				
			}

		}

	}

	
	public List<Map<String, Object>> selectPriceImgList() {
		List<Map<String, Object>> commandList = new ArrayList<Map<String,Object>>();
		List<PriceImg> piList = diseaseRepository.selectPriceImgList();
		for (PriceImg priceImg : piList) {
			FileDTO fileDTO = diseaseRepository.selectFileByIdx(priceImg.getPiIdx());
			Disease disease = diseaseRepository.selectDiseaseByIdx(priceImg.getDsIdx());
			int price = convertImgToPrice(fileDTO.getSavePath()+fileDTO.getRenameFileName());
			priceImg.setPrice(price);
			commandList.add(Map.of("priceImg", priceImg, "disease", disease, "files", fileDTO));
		}
		return commandList;

		
	}

	public int convertImgToPrice(String savePath) {
		int price = 0;
		try {
			
			String imageFilePath = "C:\\CODE\\UPLOAD\\"+savePath; // 여기에는 자신의 로컬 이미지 명이 들어가야합니다.
			List<AnnotateImageRequest> requests = new ArrayList<>();
			ByteString imgBytes = ByteString.readFrom(new FileInputStream(imageFilePath));
			Image img = Image.newBuilder().setContent(imgBytes).build();
			Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
			AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
			requests.add(request);
			try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
				BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
				List<AnnotateImageResponse> responses = response.getResponsesList();
				for (AnnotateImageResponse res : responses) {
					if (res.hasError()) {
						System.out.printf("Error: %s\n", res.getError().getMessage());
						return price;
					}

					String temp = res.getTextAnnotationsList().get(0).getDescription();
					String[] tempArr = temp.split("청구 금액:");
					temp = tempArr[1].substring(0, 8);
					price = Integer.parseInt(temp.replaceAll("[^\\d]", ""));
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return price;
	}
	
	

}
