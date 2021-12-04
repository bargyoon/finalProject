package com.kh.spring.mypage.validator;

import lombok.Data;

@Data
public class UpdateMemberForm {
	
	private int userIdx;
	private String nickName;
	private String password;
	private String password2;
	private String address;
	private String addressDetail;
}
