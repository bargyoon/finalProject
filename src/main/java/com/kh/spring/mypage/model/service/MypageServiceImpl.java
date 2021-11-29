package com.kh.spring.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.spring.mypage.model.dto.Pet;
import com.kh.spring.mypage.model.repository.MypageRepository;

import lombok.RequiredArgsConstructor;

@Service("mypageService")
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {
	
	private final MypageRepository mypageRepository;
	
	public void updateMemberDynamicQuery(Map<String, Object> commandMap) {
		mypageRepository.updateMemberDynamicQuery(commandMap);
	}
	
	public List<Pet> selectPetByUserIdx(int userIdx){
		return mypageRepository.selectPetByUserIdx(userIdx);
	}
	
	public void insertPetByUserIdx(Map<String, Object> commandMap) {
		mypageRepository.insertPetByUserIdx(commandMap);
	}
	
//	public List<Board> selectBoardByUserIdx(int userIdx){
//		return mypageRepository.selectBoardByUserIdx(userIdx);
//	}
	
//	public List<Reply> selectReplyByUserIdx(int userIdx){
//		return mypageRepository.selectReplyByUserIdx(userIdx);
//	};
	
//	public List<counseling> selectCounselingByUserIdx(int userIdx){
//		return mypageRepository.selectCounselingByUserIdx(userIdx);
//	};
}
