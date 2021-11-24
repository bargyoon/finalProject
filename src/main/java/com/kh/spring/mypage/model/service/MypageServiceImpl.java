package com.kh.spring.mypage.model.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.spring.member.model.dto.Member;
import com.kh.spring.mypage.model.repository.MypageRepository;
import com.kh.spring.mypage.validator.UpdateForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl {
	
	private final RestTemplate template;
	private final MypageRepository mypageRepository;
	private final PasswordEncoder passwordEncoder;
	
	public Member selectMemberByNickname(String nickname) {
		return mypageRepository.selectMemberByNickname(nickname);
	}
	
	public void updateMember(UpdateForm form) {
		mypageRepository.updateMember(form);
	}
}
