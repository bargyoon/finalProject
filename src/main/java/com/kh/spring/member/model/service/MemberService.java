package com.kh.spring.member.model.service;

import com.kh.spring.member.model.dto.Member;

public interface MemberService {

	Member authenticateUser(Member member);

	void insertMember (Member member);
}
