package com.kh.spring.mypage.model.service;

import org.springframework.stereotype.Service;

import com.kh.spring.mypage.model.repository.MypageRepository;
import com.kh.spring.mypage.validator.UpdateMemberForm;

import lombok.RequiredArgsConstructor;

@Service("mypageService")
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {
	
	private final MypageRepository mypageRepository;
	
	public void updateMember(int userIdx, UpdateMemberForm form) {
		mypageRepository.dynamicQueryUpdateMember(userIdx, form);
	}
	
	

}
