package com.kh.spring.mypage.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.spring.mypage.model.repository.MypageRepository;

@Component
public class UpdateFormValidator implements Validator {
	
	private final MypageRepository mypageRepository;
	
	public UpdateFormValidator(MypageRepository mypageRepository) {
		super();
		this.mypageRepository = mypageRepository;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(UpdateForm.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		UpdateForm form = (UpdateForm) target;
		
		if(mypageRepository.selectMemberByNickname(form.getNickname()) != null) {
			errors.rejectValue("nickname", "err-nickname", "이미 존재하는 닉네임입니다.");
		}
		
		if(!Pattern.matches("(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9]).{8,}", form.getPassword())) {
			errors.rejectValue("password", "err-password", "비밀번호는 8글자 이상의 숫자 영문자 특수문자 조합이어야 합니다.");
		}
		
	}
	
}
