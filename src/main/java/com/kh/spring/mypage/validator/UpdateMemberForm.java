package com.kh.spring.mypage.validator;

import lombok.Data;

@Data
public class UpdateMemberForm {
	
	private String nickname;
	private String password;
	private String address;
	private String address2;
	private String introduce;
}
