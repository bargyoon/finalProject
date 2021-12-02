package com.kh.spring.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.dto.BoardComment;
import com.kh.spring.mypage.model.dto.MypageSearchSet;
import com.kh.spring.mypage.model.dto.Pet;
import com.kh.spring.mypage.model.dto.Vaccination;
import com.kh.spring.mypage.model.dto.VaccineInfo;
import com.kh.spring.mypage.validator.UpdateMemberForm;

public interface MypageService {
	
	void updateMemberDynamicQuery(UpdateMemberForm form);
	
	List<Pet> selectPetByUserIdx(int userIdx);

	void insertPet(Pet pet, MultipartFile file);

	List<VaccineInfo> selectAllVaccine();
	
	void insertVaccination(Vaccination vaccination);

	int selectBoardCommentCnt(MypageSearchSet searchSet);

	List<BoardComment> selectBoardComment(Map<String, Object> map);
	
}
