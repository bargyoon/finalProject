package com.kh.spring.common.code;

public enum Config {

	//DOMAIN("http://www.pclass.com")
	DOMAIN("http://localhost:9393"),
	SMTP_AUTHENTIFICATION_ID(""),
	SMTP_AUTHENTIFICATION_PASSWORD(""),
	COMPANY_EMAIL(""),
	//UPLOAD_PATH("C:\\CODE\\upload\\"); //운영서버
	UPLOAD_PATH("C:\\CODE\\upload\\"); //개발서버
	
	public final String DESC;
	
	private Config(String desc) {
		this.DESC = desc;
	}
	
}
