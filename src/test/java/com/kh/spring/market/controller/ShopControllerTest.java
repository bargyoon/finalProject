package com.kh.spring.market.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.market.model.dto.Order;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class ShopControllerTest {
	
	@Autowired
	WebApplicationContext context;
	
	private MockMvc mockMvc;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	
	@Test
	public void buyTest() throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		
		Order order = new Order();
		order.setOrderIdx(123124124);
		order.setOrderCnt(5);
		order.setPaymentAmount(1000);
		order.setPaymentMethod("card");
		order.setState(0);
		String orderJson = mapper.writeValueAsString(order);
		
		mockMvc.perform(post("/market/shop/buy-test")
				.contentType(MediaType.APPLICATION_JSON)
				.content(orderJson))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	
	
	
	
	
	
	
	
}
