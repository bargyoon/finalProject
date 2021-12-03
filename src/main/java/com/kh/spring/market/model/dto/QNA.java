package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QNA {

	   private int qnaIdx;
	   private int userIdx;
	   private int prdIdx;
	   private int orderIdx;
	   private String title;
	   private String context;
	   private String type;
	   private Date regDate;
	   private String isAnswer;
	   private String awContext;
	   private Date awRegDate;

}
