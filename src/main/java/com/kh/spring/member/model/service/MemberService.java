package com.kh.spring.member.model.service;

import java.util.Map;

import com.kh.spring.member.model.dto.Member;

public interface MemberService {

	Member authenticateUser(Member member);

	void insertMember (Member member);
	
	int idCheck(String userId);

	int nickNameCheck(String nickName);
	
	Member searchId(Member member);
	
	String searchPw(Map<String, Object> member);

	Member selectMemberById(String userId);

	void insertKakaoMember(Member member);
}
