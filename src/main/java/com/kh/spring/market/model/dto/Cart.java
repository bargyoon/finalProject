package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Cart {
	
	private int userIdx;
	private int proIdx;
	private int count; //상품개수
	private Date regDate;
	
}
