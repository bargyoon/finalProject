package com.kh.spring.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberRepository memberRepository;
	

	public Member authenticateUser(Member member) {
		
		Member storedMember = memberRepository.selectMemberByUserId(member);
		if(storedMember != null) {
			return storedMember;
		}
		
		return null;
	}
	

	public void insertMember(Member member) {
		memberRepository.insertMember(member);
		
	}
	
	public int idCheck(String userId) {
		return memberRepository.idCheck(userId);
	}

	public int nickNameCheck(String nickName) {
		return memberRepository.nickNameCheck(nickName);
	}


	/*
	 * @Override public void logout(HttpSession session) { session.invalidate();
	 * //세션 초기화
	 * 
	 * }
	 */
	
}
