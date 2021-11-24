package com.kh.spring.market.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	private int rvIdx;
	private int userIdx;
	private	int orderIdx;
	private int state;
	private int rating;
	private int type; //리뷰타입
	private int recommand; //추천수
	private Date regDate;
	private int isDel;
	
}
