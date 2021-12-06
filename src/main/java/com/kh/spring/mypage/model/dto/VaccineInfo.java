package com.kh.spring.mypage.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class VaccineInfo {
	
	private int viIdx;
	private String viName;
	private int cycle;
	private String species;
}
