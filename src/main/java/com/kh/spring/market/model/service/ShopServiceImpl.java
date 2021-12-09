package com.kh.spring.market.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.market.model.dto.Cart;
import com.kh.spring.market.model.dto.Coupon;
import com.kh.spring.market.model.dto.Order;
import com.kh.spring.market.model.dto.Product;
import com.kh.spring.market.model.dto.QNA;
import com.kh.spring.market.model.dto.Review;
import com.kh.spring.market.model.dto.prdListSet;
import com.kh.spring.market.model.repository.ShopRepository;
import com.kh.spring.member.model.dto.Member;

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


	public List<Product> selectPrdDetailListByIdx(int prdIdx) {
		List<Product> prdList = shopRepository.selectPrdDetailListByIdx(prdIdx);
		
		return prdList;
	}


	public Product selectPrdByIdx(int prdIdx) {
		Product prd = shopRepository.selectPrdByIdx(prdIdx);
		return prd;
	}


	public List<Review> selectReviewByPrdIdxWithPaging(int prdIdx, prdListSet listSet, Paging pageUtil) {
		List<Review> reviews = shopRepository.selectReviewByPrdIdxWithPaging(prdIdx, listSet, pageUtil);
		return reviews;
	}

	public int selectReviewCnt(prdListSet listSet, int pn) {
		return shopRepository.selectReviewCnt(listSet, pn);
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
		product.setCouponAvail((product.getCouponAvail() == null)? "n" : product.getCouponAvail());
		product.setSmAvail((product.getSmAvail() == null)? "n" : product.getSmAvail());
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
		int totalCnt = shopRepository.selectAllPrdCnt();
		int saleCnt = shopRepository.selectPrdSpecCnt("sale");
		int soldoutCnt = shopRepository.selectPrdSpecCnt("soldout");
		int hiddenCnt = shopRepository.selectPrdSpecCnt("hidden");
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
	
	public Map<String, Object> selectOrderList(Map<String, Object> commandMap, Paging pageUtil) {
		List<Map<String, Object>> orderList = shopRepository.selectOrderList(commandMap,pageUtil);
		Map<String, Object> tempMap = new LinkedHashMap<String, Object>();
		int totalCnt = shopRepository.selectAllOrderCnt();
		int newOrderCnt = shopRepository.selectOrderSpecCnt("newOrder");
		int deliveringCnt = shopRepository.selectOrderSpecCnt("delivering");
		int deliverCompleteCnt = shopRepository.selectOrderSpecCnt("deliverComplete");
		int newRefundCnt = shopRepository.selectOrderSpecCnt("newRefund");
		int refundCompleteCnt = shopRepository.selectOrderSpecCnt("refundComplete");
		int newCancelCnt = shopRepository.selectOrderSpecCnt("newCancel");
		int cancelCompleteCnt = shopRepository.selectOrderSpecCnt("cancelComplete");
		
		for (Map<String, Object> map : orderList) {
			List<Map<String,Object>> specList = shopRepository.selectOrderSpec(Long.parseLong(map.get("ORDER_NUM").toString()));
			for (Map<String, Object> map2 : specList) {
				FileDTO files = new FileDTO();
				files.setSavePath((String) map.get("SAVE_PATH"));
				files.setRenameFileName((String) map.get("RENAME_FILE_NAME"));
				map2.put("downloadURL", files.getDownloadURL());
			}
			map.put("specList", specList);
		}
		
		tempMap.put("orderList", orderList);
		tempMap.put("totalCnt", totalCnt);
		tempMap.put("newOrderCnt", newOrderCnt);
		tempMap.put("deliveringCnt", deliveringCnt);
		tempMap.put("deliverCompleteCnt", deliverCompleteCnt);
		tempMap.put("newRefundCnt", newRefundCnt);
		tempMap.put("refundCompleteCnt", refundCompleteCnt);
		tempMap.put("newCancelCnt", newCancelCnt);
		tempMap.put("cancelCompleteCnt", cancelCompleteCnt);
		
		return tempMap;
	}
	
	public int selectOrderListCnt(Map<String, Object> commandMap) {
		
		return shopRepository.selectOrderListCnt(commandMap);
	}
	
	public int selectItemCommentListCnt(Map<String, Object> commandMap) {
		
		return shopRepository.selectItemCommentListCnt(commandMap);
	}
	
	public List<Map<String,Object>> selectItemCommentList(Map<String, Object> commandMap, Paging pageUtil) {
		List<Map<String,Object>> commandList = shopRepository.selectItemCommentList(commandMap,pageUtil);
		for (Map<String, Object> map : commandList) {
			if(Integer.parseInt(map.get("TYPE").toString()) == 1) {
				List<FileDTO> files = shopRepository.selectFileInfoByIdx(Integer.parseInt(map.get("RV_IDX").toString()));
				
				map.put("files", files);
				
			}
		}
		
		return commandList;
	}


	public boolean insertOrder(List<Order> orderInfos) {
		for (Order order : orderInfos) {
			if(order.getCartIdx() != 0) {
				shopRepository.deleteCartByIdx(order.getCartIdx());
			}
			if(shopRepository.insertOrder(order) != -1) {
				return false;
			}
		}

		if(shopRepository.updateSmAndCp(orderInfos.get(0)) != -1) {
			return false;
		}
		
		return true;
	}

	public Map<String, Object> getCntByType(int pn) {
		int photoReviewCnt = 0;
		int normalReviewCnt = 0;
		
		List<Review> reviews = shopRepository.selectReviewByPrdIdx(pn);
		
		for (Review review : reviews) {
			if(review.getType().equals("0")) {
				normalReviewCnt++;
			} else {
				photoReviewCnt++;
			}
		}
		
		return Map.of("photoReviewCnt", photoReviewCnt, "normalReviewCnt", normalReviewCnt);
	}

	public boolean updateLike(int userIdx, int rvIdx) {
		
		if(shopRepository.selectListForCheck(userIdx, rvIdx) == 0) {
			shopRepository.insertLike(userIdx, rvIdx);
			shopRepository.updateRvRecommandPlus(rvIdx);
			return true;
		} else {
			shopRepository.deleteLike(userIdx, rvIdx);
			shopRepository.updateRvRecommandMinus(rvIdx);
			return false;
		}
		
	}

	public List<Integer> checkLike(List<Review> reviews, int userIdx) {
		List<Integer> checkLikeList = new ArrayList<Integer>();
		
		for (Review review : reviews) {
			if(shopRepository.selectListForCheck(userIdx, review.getRvIdx()) != 0){
				checkLikeList.add(1);
			} else {
				checkLikeList.add(0);
			}
		}
		
		return checkLikeList;
	}


	public List<QNA> selectQnaListByPrdIdxWithPaging(int pn, Paging pageUtilQna) {
		List<QNA> qnaList = shopRepository.selectQnaListByPrdIdxWithPaging(pn, pageUtilQna);
		return qnaList;
	}

	public int selectQnaCnt(int pn) {
		return shopRepository.selectQnaCnt(pn);
	}

	public boolean insertCart(List<Cart> cartInfos, Member certifiedUser) {
		for (Cart cart : cartInfos) {
			cart.setUserIdx(certifiedUser.getUserIdx());
			if(shopRepository.selectCartforCheck(cart) != null) {
				return false;
			}
			shopRepository.insertCart(cart);
		}
		return true;
	}

	public Map<String, Object> selectQnAList(Map<String, Object> commandMap, Paging pageUtil) {
		
		List<Map<String,Object>> commandList = shopRepository.selectQnAList(commandMap,pageUtil);
		
		int totalCnt = shopRepository.selectAllQnaCnt();
		int answerCnt = shopRepository.selectQnaSpecCnt(1);
		int noAnswerCnt = shopRepository.selectQnaSpecCnt(0);
		
		return Map.of("qnaList", commandList, "totalCnt", totalCnt, "answerCnt", answerCnt, "noAnswerCnt", noAnswerCnt);
	}
	
	public int selectQnAListCnt(Map<String, Object> commandMap) {
		return shopRepository.selectQnAListCnt(commandMap);
	}

	public List<FileDTO> selectFileList(List<Product> prdList) {
		List<FileDTO> files = new ArrayList<FileDTO>();
		for (Product product : prdList) {
			files.add(shopRepository.selectFileByIdx(product.getPrdIdx()));
		}
		return files;
	}

	public Map<String, FileDTO> selectFileInfoByPrdIdx(Product product) {
		Map<String, FileDTO> commandMap = new HashMap<String, FileDTO>();
		commandMap.put("prdImage", shopRepository.selectFileByIdx(product.getPrdIdx()));
		commandMap.put("subImage", shopRepository.selectFileByIdx(product.getSubImgIdx()));
		System.out.println(shopRepository.selectFileByIdx(product.getPrdIdx()));
		System.out.println(shopRepository.selectFileByIdx(product.getSubImgIdx()));
		
		return commandMap;
	}

	public List<List<FileDTO>> selectReviewFiles(List<Review> reviews) {
		List<List<FileDTO>> reviewFiles = new ArrayList<List<FileDTO>>();
		List<FileDTO> files = new ArrayList<FileDTO>();
		for (Review review : reviews) {
			files = shopRepository.selectReviewFiles(review.getRvIdx());
			reviewFiles.add(files);
		}
		return reviewFiles;
	}

	public Map<String, Object> selectAllByPrd(Product product) {
	
		List<FileDTO> files = shopRepository.selectFileInfoByIdx(product.getPrdIdx());
		List<FileDTO> subFiles = shopRepository.selectFileInfoByIdx(product.getSubImgIdx());
		
		return Map.of("files", files, "subFiles", subFiles);
		
		
		
	}

	public List<Map<String, Object>> selectPrdListMain(String condition, int maxNum) {
		List<Map<String, Object>> prdList = new ArrayList<Map<String,Object>>();
		prdList = shopRepository.selectPrdListMain(condition, maxNum);
		
		for (Map<String, Object> map : prdList) {
			FileDTO files = new FileDTO();
			files.setSavePath((String) map.get("SAVE_PATH"));
			files.setRenameFileName((String) map.get("RENAME_FILE_NAME"));
			map.put("downloadURL", files.getDownloadURL());
		}
		
		
		for (Map<String, Object> map : prdList) {
			System.out.println(map);
		}
		
		return prdList;
	}


	public void updateOrderState(Date afterWeek) {
		List<Order> orderList = shopRepository.selectOrderAll();
		for (Order order : orderList) {
			if(order.getOrderDate().toString().equals(afterWeek.toString())) {
				Map<String, Object> commandMap = Map.of("state", "orderComplete", "orderNum", order.getOrderNum());
				shopRepository.updateOrderState(commandMap);
				shopRepository.updateSM(order);
			}
		}
	}
	
}
