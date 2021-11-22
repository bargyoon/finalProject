package com.kh.spring.member.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.member.model.dto.Member;

@Mapper
public interface MemberRepository {

	@Select("select * from member where user_id =#{userId} and password=#{password}")
	Member selectMemberByUserId(Member member);

	@Insert("insert into member(user_idx,user_id,password,nickName,email,address)"
			+ "values(1000,#{userId},#{password},#{nickName},#{email},#{address})")
	void insertMember(Member member);
	//idx 시퀀스 적용 어케하더라.. 일단 중복 허용으로 둠..
	
}
