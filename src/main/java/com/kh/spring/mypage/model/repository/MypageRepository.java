package com.kh.spring.mypage.model.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.spring.member.model.dto.Member;
import com.kh.spring.mypage.validator.UpdateForm;

@Mapper
public interface MypageRepository {
	
	@Select(value= {"select nickname from member where nickname = #{nickname}"})
	Member selectMemberByNickname(String nickname);
	
	@Update("update member set nickname = #{nickname} where userId = #{userIdx}")
	void updateMember(UpdateForm form);

}
