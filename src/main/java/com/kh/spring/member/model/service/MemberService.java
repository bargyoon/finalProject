package com.kh.spring.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.common.util.pagination.Paging;
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

	int selectMemberListCnt(Map<String, Object> commandMap);

	List<Member> selectMemberList(Map<String, Object> commandMap, Paging pageUtil);

}
