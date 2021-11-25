package com.kh.spring.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	 
	Logger logger =  LoggerFactory.getLogger(this.getClass());
	
	private MemberService memberService;	
    private JavaMailSender mailSender;
	
	public MemberController(MemberService memberService,JavaMailSender mailSender) {
		super();
		this.memberService = memberService;
		this.mailSender = mailSender;
	}

	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public String loginImpl(Member member, HttpSession session, RedirectAttributes redirectAttr) {
		Member certifiedUser = memberService.authenticateUser(member);
		
		if(certifiedUser == null) {
			redirectAttr.addFlashAttribute("message", "아이디나 비밀번호가 틀렸습니다.");
			return "redirect:/member/login";
		}
		
		session.setAttribute("authentication", certifiedUser);
		return "redirect:/";
	}
	
	@GetMapping("join")
	public void Join() {}
	
	@PostMapping("join")
	public String joinImpl(Member member) {
		
		System.out.println("회원가입 진입" + member);
		
		//member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
		// -> db에 비밀번호 안뜨게돼서 불편하니 시연시에만 키는게 나을듯..?
		
		memberService.insertMember(member);
		
		System.out.println("회원가입 완료" + member);
		
		return "redirect:/";
	}
		
	@PostMapping("idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) {		
		//logger.info("userIdCheck 진입");
        //logger.info("전달받은 id:"+userId);
        int cnt = memberService.idCheck(userId);
        //logger.info("확인 결과:"+cnt);
        return cnt;		
	}
	
	@PostMapping("nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestParam("nickName") String nickName) {	
		//logger.info("userIdCheck 진입");
        //logger.info("전달받은 id:"+nickName);
        int cnt = memberService.nickNameCheck(nickName);
        //logger.info("확인 결과:"+cnt);
        return cnt;		
	}
	
	@GetMapping("mailCheck")
    @ResponseBody
    public String mailCheck(String email) {
        
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
                
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        //111111 ~ 999999 범위의 숫자를 얻기 위해서 nextInt(888888) + 111111를 사용!
        logger.info("인증번호 " + checkNum);
        
        String setFrom = "pclassTeam1@gmail.com";
        String toMail = email;
        String title = "'똑DOG한 집사들' 회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다!" +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        //템플릿 연결 & 코드정리 해야함
        
        try {            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        

        String num = Integer.toString(checkNum);
        
        return num;
    }
	
	/*
	 * @PostMapping("logout") public
	 * ModelAndView logout(HttpSession session, ModelAndView mav) {
	 * memberService.logout(session); mav.setViewName("/");
	 * mav.addObject("message","logout"); return mav; }
	 */
	
	@GetMapping("check-id")
	public void checkId() {}
	
	@GetMapping("check-password")
	public void checkPassword() {}
	
	
	

}
