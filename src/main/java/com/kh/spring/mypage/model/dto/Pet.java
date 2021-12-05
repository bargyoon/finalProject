package com.kh.spring.mypage.model.dto;

import lombok.Data;

@Data
public class Pet {
	
	private int petIdx;
	private String petName;
	private String gender;
	private String species;
	private int petAge;
	private int userIdx;
}
