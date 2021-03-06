package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Order {

	private int orderIdx;
	private int userIdx;
	private int ucIdx;
	private int proIdx;
	private int dtIdx;
	private long orderNum;
	private String paymentMethod;
	private int paymentAmount;
	private Date orderDate; // 주문날짜
	private String state;
	private int orderCnt;
	private int shippingNum;
	private String shippingCompany;
	private int saveMoney;
	private int cpSaveMoney;
	private Date updateDate;
	private int cartIdx;
}
