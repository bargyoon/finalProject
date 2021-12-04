package com.kh.spring.member.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	
	   private int userIdx;
	   private String password;
	   private String email;
	   private String nickName;
	   private String grade;
	   private String userId;
	   private String address;
	   private String addressDetail;
	   private Date joinDate;
	   private int isLeave;
	   private String userName;
	   private int saveMoney;
	
	   
}
