package com.kh.spring.market.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	private int rvIdx;
	private int userIdx;
	private int prdIdx; //제품번호
	private	int orderIdx;
	private int dtIdx; //제품옵션번호
	private String state;
	private String userName; //리뷰유저이름
	private String prdName; //제품이름
	private String dtName; //제품옵션이름
	private int rating;
	private String type; //리뷰타입
	private int recommand; //추천수
	private Date regDate;
	private String isDel;
	private String rvContent; //리뷰내용
	
}
