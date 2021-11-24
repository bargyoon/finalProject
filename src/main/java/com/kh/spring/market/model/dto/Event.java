package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Event {

	private int eventIdx;
	private String title;
	private String subTitle;
	private int contentImg; // 상세이미지 번호
	private Date regDate;
	private Date expDate; // 종료일
	
}
