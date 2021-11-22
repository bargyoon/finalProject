package com.kh.spring.market.model.dto;

import lombok.Data;

@Data
public class Address {

	private int userIdx;
	private String address;
	private int isDefault;	
}
