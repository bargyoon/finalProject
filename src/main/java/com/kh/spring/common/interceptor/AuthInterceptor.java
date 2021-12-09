package com.kh.spring.common.interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.spring.common.code.ErrorCode;
import com.kh.spring.common.exception.HandlableException;
import com.kh.spring.member.model.dto.Member;

public class AuthInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String[] uriArr = request.getRequestURI().split("/");
		Member member = (Member) request.getSession().getAttribute("authentication");
		if (uriArr.length != 0) {

			switch (uriArr[1]) {
			case "member":
				memberAuthorize(request, response, uriArr);
				break;
			case "admin":
				
				if(member == null|| !member.getGrade().equals("AD00") ) {
					throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE);
				}
				break;
			case "board":
				boardAuthorize(request, response, uriArr);
				break;
			case "market":
				marketAuthorize(request, response, uriArr);
				break;
			case "mypage":
				mypageAuthorize(request);
				break;
			default:
				break;
			}

		}

		
		return true;
	}
	
	private void marketAuthorize(HttpServletRequest request, HttpServletResponse response, String[] uriArr) {

		Member member = (Member) request.getSession().getAttribute("authentication");
		if(uriArr.length >2) {
			switch (uriArr[2]) {
			case "mypage":
				if(member == null) {
					throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE);
				}
				break;
			case "shop":
				shopAuthorize(request, response, uriArr);
				break;
			default:
				break;
			}
		}
	}

	private void shopAuthorize(HttpServletRequest request, HttpServletResponse response, String[] uriArr) {

		Member member = (Member) request.getSession().getAttribute("authentication");
		if(uriArr.length >3) {
			switch (uriArr[3]) {
			case "buy":
				if(member == null) {
					throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE);
				}
				break;
			case "cart":
				if(member == null) {
					throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE);
				}
				break;
			case "review":
				if(member == null) {
					throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE);
				}
				break;
			case "qna":
				if(member == null) {
					throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE);
				}
				break;
			default:
				break;
			}
		}
	}

	private void boardAuthorize(HttpServletRequest request, HttpServletResponse response, String[] uriArr) throws IOException, ServletException{
		
		Member member = (Member) request.getSession().getAttribute("authentication");
		if(uriArr.length >3) {
		switch (uriArr[3]) {
		case "form":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE);
			}
			break;
		case "modify":
			System.out.println("찍히나" + request.getSession().getAttribute("modi-bdIdx"));
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE);
			}
			break;
		default:
			break;
		}
		
		
		}
	}



	private void memberAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr)
			throws IOException, ServletException {

		



	}
	
	private void mypageAuthorize(HttpServletRequest request) 
			throws IOException, ServletException {
		
		Member member = (Member) request.getSession().getAttribute("authentication");
		
		if(member == null) {
			throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE);
		}
		
	}

}
