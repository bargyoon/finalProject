package com.kh.spring.mypage.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Vaccination {
	
	private int vcIdx;
	private int userIdx;
	private int petIdx;
	private int viIdx;
	private Date criterionDate;
	private Date nextDate;

}
