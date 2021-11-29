package com.kh.spring.mypage.model.dto;

import lombok.Data;

@Data
public class Pet {
	
	private int petIdx;
	private String name;
	private String gender;
	private String specify;
	private int age;
}
