package com.kh.spring.mypage.model.service;

import com.kh.spring.mypage.validator.UpdateMemberForm;

public interface MypageService {
	
	int updateMember(int userIdx, UpdateMemberForm form);

}
