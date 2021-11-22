package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Order {

	private int oIdx;
	private int userIdx;
	private int ucIdx;
	private int pIdx;
	private String paymentMethod;
	private int paymentAmount;
	private int state;
	private int orderCnt;
	private int shippingNum;
	private String shippingCompany;
	private int saveMoney;
	private Date updateDate;
	
}
