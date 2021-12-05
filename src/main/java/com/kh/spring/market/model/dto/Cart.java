package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Cart {
	
	private int userIdx;
	private int prdIdx;
	private int count; //상품개수
	private Date regDate;
	private int cartIdx;
	private int dtIdx;
}
