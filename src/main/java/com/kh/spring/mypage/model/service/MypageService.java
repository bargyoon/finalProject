package com.kh.spring.mypage.model.service;

import com.kh.spring.mypage.validator.UpdateForm;

public interface MypageService {
	
	String selectMemberByNickname(String nickname);
	
	void updateMember(UpdateForm form);
}
