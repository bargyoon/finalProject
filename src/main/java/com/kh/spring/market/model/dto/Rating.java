package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Rating {
	
	private int rateIdx;
    private int proIdx;
    private int userIDx;
    private int grade;
    private String content;
    private Date regDate;
    private String isDel;
}
