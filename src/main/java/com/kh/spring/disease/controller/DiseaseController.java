package com.kh.spring.disease.controller;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import com.kh.spring.disease.model.service.DiseaseService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("disease")
public class DiseaseController {
	  
	private final DiseaseService diseaseService;

	
	@GetMapping("index")
	public void index(Model model) {
		List<Map<String, Object>> commandList = diseaseService.selectDiseaseList();
		model.addAttribute("datas",commandList);
	}
	
	@GetMapping("disease-spec")
	public void diseaseSpec() {}
	
	@GetMapping("price-popup")
	public void pricePopup() {}
	
	public void temp() {
		try {
			String imageFilePath = "C:\\\\Users\\\\윤수환\\\\Desktop\\\\다운로드.png"; //여기에는 자신의 로컬 이미지 명이 들어가야합니다.
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
			return;
			}
			
			
			String temp = res.getTextAnnotationsList().get(0).getDescription();
			String[] tempArr = temp.split("청구 금액:");
			System.out.println(Integer.parseInt(tempArr[1]));
			// For full list of available annotations, see http://g.co/cloud/vision/docs
			/*
			* for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
			* System.out.printf("Text: %s\n", annotation.getDescription());
			* System.out.printf("Position : %s\n", annotation.getBoundingPoly()); }
			*/
			}
			}
			} catch(Exception e) {
			e.printStackTrace();
			}

		
		
	}
	
}
