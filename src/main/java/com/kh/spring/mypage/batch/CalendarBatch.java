package com.kh.spring.mypage.batch;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.spring.common.email.Email;
import com.kh.spring.common.email.EmailSender;
import com.kh.spring.common.mail.MailSender;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class CalendarBatch {
	
    private final MailSender mainSender;
    private final MypageService mypageService;
	
	@Scheduled(cron="0 0 12 * * *")
	public void sendEmail() throws Exception {
		Date today = new Date(Calendar.getInstance().getTimeInMillis());
		
		List<Map<String, Object>> vaccinationList = mypageService.selectVaccinationForBatch();
		
		for (Map<String, Object> map : vaccinationList) {
			
			if(map.get("next_date").equals(today.toString())) {
				int userIdx = Integer.parseInt(String.valueOf(map.get("user_idx")));
				Member member = mypageService.selectMember(userIdx);
				
				String userEmail = member.getEmail();
				String subject = "'똑DOG한 집사들' 예방접종 알림 이메일 입니다.";
				String htmlText = map.get("pet_name") + "의 " + map.get("vi_name") + " 백신 예방접종일 입니다.";
				
				mainSender.sendEmail(userEmail, subject, htmlText);
			}
		}
	}

}
