package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class SaveHistory {

	private String shIdx;
	private int userIdx;
	private String state; //적립유형
	private String type; //적립타입
	private int amount; //적립금액
	private Date regDate;
}
