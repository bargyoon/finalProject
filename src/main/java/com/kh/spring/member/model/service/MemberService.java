package com.kh.spring.member.model.service;

import com.kh.spring.member.model.dto.Member;

public interface MemberService {

	Member authenticateUser(Member member);

	void insertMember (Member member);
	
	int idCheck(String userId);

	int nickNameCheck(String nickName);
	
	Member searchId(Member member);
	
	Member searchPw(Member member);

	void updatePw(Member member);
	
	Member selectMemberById(String userId);

	void insertKakaoMember(Member member);

	void authenticateByEmail(Member member, String token);

}
