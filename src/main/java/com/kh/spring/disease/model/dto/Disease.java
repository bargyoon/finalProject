package com.kh.spring.disease.model.dto;

import lombok.Data;

@Data
public class Disease {
	
	private long dsIdx;
	private String name;
	private int price;
	private String category;
	private int count;
	private String explain;
	
	
}
