package com.kh.spring.board.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	private int bdIdx;
	private int userIdx;
	private String bdTitle;
	private Date regDate;
	private int viewCount;
	private int recCount;
	private String content;
	private String category;
	
}

