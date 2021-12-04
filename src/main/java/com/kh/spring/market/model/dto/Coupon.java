package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Coupon {

	  private String couponIdx;
	  private int ucIdx;
	  private int userIdx;
      private String name;
      private int salePer;
      private String type;
      private String isDel;
      private Date regDate;
      private Date ucExpDate;
      private Date expDate;
}
