package com.kh.spring.admin.model.service;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
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
import com.kh.spring.board.model.repository.BoardRepository;
import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.disease.model.dto.Disease;
import com.kh.spring.disease.model.dto.PriceImg;
import com.kh.spring.disease.model.repository.DiseaseRepository;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.QNA;
import com.kh.spring.market.model.repository.ShopRepository;
import com.kh.spring.member.model.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	private final DiseaseRepository diseaseRepository;
	private final ShopRepository shopRepository;
	private final MemberRepository memberRepository;
	private final BoardRepository boardRepository;
	
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

	
	public Map<String, Object> selectPriceImgList(String state, Paging pageUtil) {
		Map<String,Object> viewMap = new LinkedHashMap<String, Object>();
		List<Map<String, Object>> piList = diseaseRepository.selectPriceImgList(state,pageUtil);
		int totalCnt = diseaseRepository.selectAllCnt();
		int noCnt = diseaseRepository.selectSpecCnt("N");
		int yesCnt = diseaseRepository.selectSpecCnt("Y");
		
		for (Map<String, Object> map : piList) {
			int price = Integer.parseInt(map.get("PRICE").toString());
			if(price == 0) {
				System.out.println();
				price = convertImgToPrice((String)map.get("SAVE_PATH")+map.get("RENAME_FILE_NAME"));
				map.remove("PRICE");
				map.put("PRICE", price);
			}
			
			System.out.println(map.get("PRICE").toString());
			FileDTO files = new FileDTO();
			files.setSavePath((String) map.get("SAVE_PATH"));
			files.setRenameFileName((String) map.get("RENAME_FILE_NAME"));
			map.put("downloadURL", files.getDownloadURL());
		}
		viewMap.put("piList", piList);
		viewMap.put("totalCnt", totalCnt);
		viewMap.put("noCnt", noCnt);
		viewMap.put("yesCnt", yesCnt);
		
	
		return viewMap;

		
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
	
	public void updatePrice(Map<String, Object> jsonMap) {
		diseaseRepository.updatePrice(jsonMap);
		int dsIdx = (int) jsonMap.get("dsIdx");
		int newPrice = (int) jsonMap.get("price");
		Disease disease = diseaseRepository.selectDiseaseByIdx(dsIdx);
		
		int cnt = disease.getCount();
		int price = disease.getPrice();
		price = (int) Math.round((price*cnt+newPrice)/(cnt+1));
		System.out.println(price);
		cnt = cnt+1;
		disease.setCount(cnt);
		disease.setPrice(price);
		diseaseRepository.updateDiseasePriceAndCount(disease);
		
	}
	
	
	public void updateOrderState(Map<String, Object> jsonMap) {
		shopRepository.updateOrderState(jsonMap);
		
		
	}
	
	public void updateShipping(Order order) {
		shopRepository.updateShipping(order);
		
	}
	@Override
	public int selectPriceImgListCnt(String state) {
		
		return diseaseRepository.selectPriceImgListCnt(state);
	}
	
	@Override
	public void updateReviewState(Map<String, Object> jsonMap) {
		shopRepository.updateReviewState(jsonMap);
		int userIdx = Integer.parseInt(jsonMap.get("userIdx").toString());
		long orderNum = Long.parseLong(jsonMap.get("orderNum").toString());
		if(jsonMap.get("state").equals("1")) {
			if(jsonMap.get("type").equals("0")) {
				memberRepository.updateSaveMoney(userIdx, 300);
				shopRepository.insertSaveMoney(1,userIdx, 300,orderNum);
			}else {
				memberRepository.updateSaveMoney(userIdx, 600);
				shopRepository.insertSaveMoney(2,userIdx, 600,orderNum);
			}
			
		}
	}
	
	public void updateProductState(Map<String, Object> jsonMap) {
		shopRepository.updateProductState(jsonMap);
		
	}
	
	public void deleteOneBaord(int bdIdx) {
		boardRepository.deleteBoardByIdx(bdIdx);
		
	}

	public void deletePrd(List<Integer> dtIdxs) {
		for (Integer dtIdx : dtIdxs) {
			shopRepository.deleteProductDetail(dtIdx);
		}
		
		
	}
	
	@Override
	public void deletePriceImg(List<Integer> piIdxs) {
		for (Integer piIdx : piIdxs) {
			diseaseRepository.deletePriceImg(piIdx);
		}
		
	}
	
	@Override
	public void updateQnaAnswer(QNA qna) {
		shopRepository.updateQnaAnswer(qna);
		
	}
	
	@Override
	public void deleteQna(List<Integer> qnaIdxs) {
		for (Integer qnaIdx : qnaIdxs) {
			shopRepository.deleteQna(qnaIdx);
		}
		
		
	}
	
	@Override
	public void deleteComments(List<Integer> rvIdxs) {
		for (Integer rvIdx : rvIdxs) {
			shopRepository.deleteComments(rvIdx);
		}
		
		
	}
	
	@Override
	public void deleteBoardComments(List<Integer> cmIdxs) {
		for (Integer cmIdx : cmIdxs) {
			boardRepository.deleteBoardCommentByIdx(cmIdx);
		}
	}
	
	@Override
	public void deleteBoards(List<Integer> bdIdxs) {
		for (Integer bdIdx : bdIdxs) {
			boardRepository.deleteBoardByIdx(bdIdx);
		}
		
	}
	
	@Override
	public void deleteOneComment(int cmIdx) {
		boardRepository.deleteBoardCommentByIdx(cmIdx);
		
	}
}
