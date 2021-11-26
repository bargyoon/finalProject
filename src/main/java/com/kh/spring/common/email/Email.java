package com.kh.spring.common.email;

import lombok.Data;

@Data
public class Email {

	private String subject;
    private String content;
    private String receiver;

	
}
