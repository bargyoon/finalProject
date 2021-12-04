package com.kh.spring.mypage.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class VaccineInfo {
	
	private int viIdx;
	private String name;
	private int cycle;
	private String species;
}
