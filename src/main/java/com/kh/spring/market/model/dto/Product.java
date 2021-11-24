package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Product {

	 private int prdIdx;
     private int eventIdx;
     private int subImgIdx;
     private String name;
     private String brand;
     private int price;
     private int poStock;
     private int rating;
     private String category;
     private String poName;
     private int salePer;
     private String couponAvail;
     private String smAvail;
     private String state;
     private Date regDate;

}
