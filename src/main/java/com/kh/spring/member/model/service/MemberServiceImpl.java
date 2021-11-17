package com.kh.spring.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberRepository memberRepository;
	

	public Member loginUser(Member member) {
		
		Member loginUser = memberRepository.loginUser(member);
		if(loginUser != null) {
			return loginUser;
		}
		
		return null;
	}

	/*
	 * @Override public void logout(HttpSession session) { session.invalidate();
	 * //세션 초기화
	 * 
	 * }
	 */
	
}
