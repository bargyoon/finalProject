package com.kh.spring.market.batch;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.spring.common.mail.MailSender;
import com.kh.spring.market.model.service.ShopService;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MarketBatch {

	private final ShopService shopService;

	@Scheduled(cron = "0 0 23 * * *")
	public void updateOrderState() throws Exception {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, 7);
		Date afterWeek = new Date(cal.getTimeInMillis());

		shopService.updateOrderState(afterWeek);
	}

}
