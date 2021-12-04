package com.kh.spring.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.dto.BoardComment;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.mypage.model.dto.MypageSearchSet;
import com.kh.spring.mypage.model.dto.Pet;
import com.kh.spring.mypage.model.dto.Vaccination;
import com.kh.spring.mypage.model.dto.VaccineInfo;
import com.kh.spring.mypage.model.repository.MypageRepository;
import com.kh.spring.mypage.validator.UpdateMemberForm;

import lombok.RequiredArgsConstructor;

@Service("mypageService")
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {
	
	private final MypageRepository mypageRepository;
	
	public void updateMemberDynamicQuery(UpdateMemberForm form) {
		mypageRepository.updateMemberDynamicQuery(form);
	}
	
	public List<Pet> selectPetByUserIdx(int userIdx){
		return mypageRepository.selectPetByUserIdx(userIdx);
	}
	
	public void insertPet(Pet pet, MultipartFile file) {
		mypageRepository.insertPet(pet);
		
		FileUtil fileUtil = new FileUtil();
		mypageRepository.insertFile(fileUtil.fileUpload(file));
	}

	public List<VaccineInfo> selectAllVaccine() {
		return mypageRepository.selectAllVaccineInfo();
	}
	
	public void insertVaccination(Vaccination vaccination) {
		mypageRepository.insertVaccination(vaccination);
	}

	public int selectBoardCommentCnt(MypageSearchSet searchSet) {
		return mypageRepository.selectBoardCommentCnt(searchSet);
	}

	public List<BoardComment> selectBoardComment(Map<String, Object> map){
		return mypageRepository.selectBoardComment(map);
	};
	
	public int selectBoardCnt(MypageSearchSet searchSet) {
		return mypageRepository.selectBoardCnt(searchSet);
	}

	public List<Board> selectBoard(Map<String, Object> map){
		return mypageRepository.selectBoard(map);
	};
	
	
}
