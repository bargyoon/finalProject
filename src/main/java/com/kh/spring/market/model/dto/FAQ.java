package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class FAQ {

	   private int qIdx;
	   private int userIdx;
	   private int pIdx;
	   private int olIdx;
	   private String title;
	   private String context;
	   private String type;
	   private Date regDate;
	   private String isAnswer;
	   private String aContext;
	   private Date aRegDate;

}
