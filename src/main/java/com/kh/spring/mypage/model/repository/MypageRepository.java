package com.kh.spring.mypage.model.repository;

import org.apache.ibatis.annotations.Mapper;

import com.kh.spring.mypage.validator.UpdateMemberForm;

@Mapper
public interface MypageRepository {
	
	void dynamicQueryUpdateMember(int userIdx, UpdateMemberForm form);
	
		

}
