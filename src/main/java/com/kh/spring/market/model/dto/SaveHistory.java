package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class SaveHistory {

	private int shIdx;
	private int userIdx;
	private int state; //적립유형
	private int type; //적립타입
	private int amount; //적립금액
	private Date regDate;
}
