package com.kh.spring.disease.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class PriceImg {

	private long piIdx;
	private long dsIdx;
	private long userIdx;
	private int price;
	private String allow;
	private String failReason;
	private Date regDate;
	
}
