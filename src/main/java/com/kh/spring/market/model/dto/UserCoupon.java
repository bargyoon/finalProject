package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class UserCoupon {

	 private int ucIdx;
     private int userIdx;
     private String couponIdx;
     private Date expDate;

}
