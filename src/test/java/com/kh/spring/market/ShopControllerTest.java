package com.kh.spring.market;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
		//order.setState(0);
		String orderJson = mapper.writeValueAsString(order);
		
		mockMvc.perform(post("/market/shop/buy-test")
				.contentType(MediaType.APPLICATION_JSON)
				.content(orderJson))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	@Test
	public void prdListTest() throws Exception {
		String category = "all";
		String option = "low";
		
		mockMvc.perform(get("/market/shop/prd-list")
				.param("category", category)
				.param("option", option))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	@Test
	public void prdDetailTest() throws Exception {
		String prdIdx = "100002";
		mockMvc.perform(get("/market/shop/prd-detail")
				.param("pn", prdIdx))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	
	@Test
	public void prdOptionTest() throws Exception {
		String dtIdx = "100000";
		mockMvc.perform(get("/market/shop/prd-option")
				.param("dt_idx", dtIdx))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	
	@Test
	public void registOrderTest() throws Exception {
		Order order = new Order();
		order.setDtIdx(123);
		order.setProIdx(0);
		order.setUserIdx(1234);
		order.setUcIdx(1111);
		order.setOrderCnt(3);
		order.setOrderNum(123144);
		order.setSaveMoney(11111);
		order.setProIdx(9999);

		ObjectMapper mapper = new ObjectMapper();
		String orderJson = mapper.writeValueAsString(order);
		
		
		mockMvc.perform(post("/market/shop/regist-order")
	            	.contentType(MediaType.APPLICATION_JSON) 
					.content(orderJson))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	
	
	
	
	
	
	
}
