package com.kh.spring.market.model.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.prdListSet;
import com.kh.spring.market.model.repository.ShopRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShopServiceImpl implements ShopService{

	private final ShopRepository shopRepository;

	public List<Product> selectPrdListBySet(prdListSet listSet, Paging pageUtil) {
		
		List<Product> prdList = shopRepository.selectPrdListBySet(listSet, pageUtil);
		
		return prdList;
	}
	

	private String makeOrderSql(String option) {
		String optionSql = "order by ";
		if(option == null) {
			return "";
		} else if(option.equals("pop")) {
			optionSql += "rating desc";
		} else if(option.equals("new")) {
			optionSql += "reg_date desc";
		} else if(option.equals("high")) {
			optionSql += "price desc";
		} else if(option.equals("low")) {
			optionSql += "price asc";
		}
		
		return optionSql;
	}


	public String categoryToKor(String category) {
		if(category.equals("feed")) {
			return "사료";
		} else if(category.equals("snack")) {
			return "간식";
		} else if(category.equals("health")) {
			return "건강관리";
		} else if(category.equals("potty")) {
			return "위생/배변";
		} else if(category.equals("beauty")) {
			return "미용/목욕";
		} else if(category.equals("feeder")) {
			return "급수기/급식기";
		} else if(category.equals("kennel")) {
			return "하우스/울타리";
		} else if(category.equals("vari-kennel")) {
			return "이동장";
		} else if(category.equals("clothes")) {
			return "의류/악세서리";
		} else if(category.equals("toy")) {
			return "장난감";
		}
		return "전체";
	}


	public int prdListCnt(prdListSet listSet) {
		int res = 0;
		res = shopRepository.prdListCnt(listSet);
		
		return res;
	}


	public List<Product> selectPrdListByIdx(int prdIdx) {
		
		List<Product> prdList = shopRepository.selectPrdListByIdx(prdIdx);
		return prdList;
	}


	public Product selectPrdByIdx(int prdIdx) {
		Product prd = shopRepository.selectPrdByIdx(prdIdx);
		return prd;
	}


	public List<Review> selectReviewByPrdIdx(int prdIdx) {
		List<Review> reviews = shopRepository.selectReviewByPrdIdx(prdIdx);
		return reviews;
	}

	public Product selectPrdByDtIdx(int dtIdx) {
		Product prdOption = shopRepository.selectPrdByDtIdx(dtIdx);
		return prdOption;
	}
	

	public List<Coupon> selectCouponByUserIdx(int userIdx) {
		List<Coupon> couponList = shopRepository.selectCouponByUserIdx(userIdx);
		return couponList;
	}
	
	public void insertProduct(List<MultipartFile> mainImg, List<MultipartFile> specImg,
			List<Map<String, Object>> commandList, Product product) {
		shopRepository.insertProduct(product);
		FileUtil fileUtil = new FileUtil();
		for (MultipartFile multipartFile : mainImg) {
			if (!multipartFile.isEmpty()) {
				shopRepository.insertPrdFileInfo(fileUtil.fileUpload(multipartFile));
			}

		}
		for (MultipartFile multipartFile : specImg) {
			if (!multipartFile.isEmpty()) {
				shopRepository.insertSubImgFileInfo(fileUtil.fileUpload(multipartFile));
			}

		}
		for (Map<String, Object> map : commandList) {
			int price = (int) map.get("price");
			int salePrice = price *(100 - product.getSalePer()) /100;
			 
			shopRepository.insertPrdDetail(map,salePrice);
		}
		
		
	}
	
	public Map<String,Object> selectPrdList(Map<String, Object> commandmap, Paging pageUtil) {
		Map<String,Object> viewMap = new LinkedHashMap<String, Object>();
		List<Map<String, Object>> prdList = shopRepository.selectPrdList(commandmap,pageUtil);
		int totalCnt = shopRepository.selectAllCnt();
		int saleCnt = shopRepository.selectSpecCnt("sale");
		int soldoutCnt = shopRepository.selectSpecCnt("soldout");
		int hiddenCnt = shopRepository.selectSpecCnt("hidden");
		for (Map<String, Object> map : prdList) {
			FileDTO files = new FileDTO();
			files.setSavePath((String) map.get("SAVE_PATH"));
			files.setRenameFileName((String) map.get("RENAME_FILE_NAME"));
			map.put("downloadURL", files.getDownloadURL());
		}
		
		viewMap.put("prdList", prdList);
		viewMap.put("totalCnt", totalCnt);
		viewMap.put("saleCnt", saleCnt);
		viewMap.put("soldoutCnt", soldoutCnt);
		viewMap.put("hiddenCnt", hiddenCnt);
		return viewMap;
		
		
		
	}

	public int selectPoStackByDtIdx(int dtIdx) {
		int res = shopRepository.selectPoStackByDtIdx(dtIdx);
		return res;
	}

	public int selectPrdListCnt(Map<String, Object> commandMap) {
		
		return shopRepository.selectPrdListCnt(commandMap);
	}
	
	public List<Map<String, Object>> selectOrderList() {
		List<Map<String, Object>> orderList = shopRepository.selectOrderList();
		for (Map<String, Object> map : orderList) {
			List<Map<String,Object>> specList = shopRepository.selectOrderSpec(Integer.parseInt(map.get("DT_IDX").toString()));
			map.put("specList", specList);
		}
		return orderList;
	}


	public boolean insertOrder(List<Order> orderInfos) {
		for (Order order : orderInfos) {
			if(!shopRepository.insertOrder(order)) {
				return false;
			}
		}
		if(!shopRepository.insertSmHistory(orderInfos.get(0))||!shopRepository.updateUserMinusSm(orderInfos.get(0))) {
			return false;
		}
		
		if(orderInfos.get(0).getUcIdx() != 0) {
			if(!shopRepository.updateUcIsDel(orderInfos.get(0).getUcIdx())) {
				return false;
			}
		}

		return true;
	}

	public Map<String, Object> getCntByType(List<Review> reviews) {
		int photoReviewCnt = 0;
		int normalReviewCnt = 0;
		
		for (Review review : reviews) {
			if(review.getType().equals("0")) {
				normalReviewCnt++;
			} else {
				photoReviewCnt++;
			}
		}
		
		
		return Map.of("photoReviewCnt", photoReviewCnt, "normalReviewCnt", normalReviewCnt);
	}
	
}
