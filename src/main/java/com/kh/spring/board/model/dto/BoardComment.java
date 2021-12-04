package com.kh.spring.board.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardComment {
	private int cmIdx;
	private int bdIdx;
	private String cmContent;
	private Date regDate;
	private int cmRecCount;
	private int userIdx;
	private String nickname;
	private int cmType;
	private int prIdx;
}
