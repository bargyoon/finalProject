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
	
	int selectBoardCommentCnt(MypageSearchSet searchSet);

	int selectBoardCnt(MypageSearchSet searchSet);

	List<Board> selectBoard(Map<String, Object> map);

	List<Map<String, Object>> selectCommentList(Map<String, Object> commandMap);

	void insertPet(Pet pet, MultipartFile file);

	List<Map<String, Object>> selectPetList(Map<String, Object> commandMap);

	int selectPetCnt(int userIdx);

	List<Pet> selectAllPet(int userIdx);

	List<VaccineInfo> selectVaccineInfoList();

	List<Vaccination> selectVaccinationList(int userIdx);
	
}
