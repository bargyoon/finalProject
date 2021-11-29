package com.kh.spring.admin;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class AdminControllerTest {

	@Autowired
	WebApplicationContext context;
	
	private MockMvc mockMvc;
	

	@Before
	public void setup() {
		this.mockMvc = webAppContextSetup(context).build();
	}
	
	@Test
	public void insertDisease() throws Exception{
		MockMultipartFile file1 = new MockMultipartFile("diseaseIcon","test.png", null,"photo".getBytes()); 
		
		mockMvc.perform(multipart("/admin/disease/add-disease-spec")
				.file(file1)
				.param("name", "병명입니다")
				.param("price", "100000")
				.param("explain", "설명")
				.param("category", "cat"))
		.andExpect(status().is3xxRedirection())
		.andDo(print());
		
	}
	
	@Test
	public void selectDiseaseListTest() throws Exception{
		mockMvc.perform(get("/admin/disease/disease-list"))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	@Test
	public void selectPriceImgListTest() throws Exception{
		mockMvc.perform(get("/admin/disease/price-img-list"))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	@Test
	public void testParam() throws Exception{
		mockMvc.perform(get("/admin/disease/test")
				.param("test", "test")
				.param("price","10000")
				.param("test", "test122")
				.param("price", "14444"))
		.andDo(print());
	}
	
	
	
}
