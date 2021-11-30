package com.kh.spring.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.util.FileUtil;
import com.kh.spring.mypage.model.dto.Pet;
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
