package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Coupon {

	  private String couponIdx;
      private String name;
      private int salePer;
      private String isDel;
      private Date expDate;
      
      private UserCoupon userCoupon;
}
