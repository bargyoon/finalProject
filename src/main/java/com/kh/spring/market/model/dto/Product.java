package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Product {

	 private int pIdx;
     private int eIdx;
     private int subImgIdx;
     private String name;
     private String brand;
     private int price;
     private int stock;
     private int rating;
     private String category;
     private String productOption;
     private int discountPrice;
     private String isDiscount;
     private String couponAvail;
     private String smAvail;
     private String state;
     private Date regDate;

}
