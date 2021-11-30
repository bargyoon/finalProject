package com.kh.spring.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.mypage.model.dto.Pet;

public interface MypageService {
	
	void updateMemberDynamicQuery(Map<String, Object> commandMap);
	
	List<Pet> selectPetByUserIdx(int userIdx);

	void insertPetByUserIdx(Map<String, Object> commandMap);
	
//	List<Board> selectBoardByUserIdx(int userIdx);
	
//	List<Reply> selectReplyByUserIdx(int userIdx);
	
//	List<counseling> selectCounselingByUserIdx(int userIdx);
}
