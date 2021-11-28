package com.kh.spring.mypage.model.repository;

import org.apache.ibatis.annotations.Mapper;

import com.kh.spring.mypage.validator.UpdateMemberForm;

@Mapper
public interface MypageRepository {
	
	int dynamicQueryUpdateMember(int userIdx, UpdateMemberForm form);
	
		

}
