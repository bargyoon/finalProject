package com.kh.spring.mypage.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.spring.member.model.repository.MemberRepository;

@Component
public class UpdateMemberFormValidator implements Validator {
	
	private final MemberRepository memberRepository;
	
	public UpdateMemberFormValidator(MemberRepository memberRepository) {
		super();
		this.memberRepository = memberRepository;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(UpdateMemberForm.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		UpdateMemberForm form = (UpdateMemberForm) target;
		
		if(memberRepository.nickNameCheck(form.getNickname()) != 0) {
			errors.rejectValue("nickname", "err-nickname", "이미 존재하는 닉네임입니다.");
		}
		
		if(!Pattern.matches("(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9]).{8,}", form.getPassword())) {
			errors.rejectValue("password", "err-password", "비밀번호는 8글자 이상의 숫자 영문자 특수문자 조합이어야 합니다.");
		}
		
		if(form.getPassword() != form.getPassword2()) {
			errors.rejectValue("password2", "err-password2", "비밀번호 확인이 올바르지 않습니다.");
		}

	}
}