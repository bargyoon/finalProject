package com.kh.spring.market.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	private int rvIdx;
	private int userIdx;
	private int prdIdx; //제품번호
	private	int orderIdx;
	private String state;
	private int rating;
	private String type; //리뷰타입
	private int recommand; //추천수
	private Date regDate;
	private String isDel;
	private String rvContent; //리뷰내용
	
}
