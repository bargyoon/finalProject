package com.kh.spring.disease;

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
public class DiseaseControllerTest {


	@Autowired
	WebApplicationContext context;
	
	private MockMvc mockMvc;
	

	@Before
	public void setup() {
		this.mockMvc = webAppContextSetup(context).build();
	}
	
	@Test
	public void index() throws Exception{
		mockMvc.perform(get("/disease/index"))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	@Test
	public void selectDiseaseByIdx() throws Exception{
		mockMvc.perform(get("/disease/disease-spec")
				.param("dsIdx", "50004"))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	@Test
	public void postImgTest() throws Exception{
		MockMultipartFile fileTest = new MockMultipartFile("files", "사진.png", null, "사진".getBytes());
		mockMvc.perform(multipart("/disease/add-price")
				.file(fileTest)
				.param("dsIdx", "5004"))
		.andExpect(status().is3xxRedirection())
		.andDo(print());
		
	}
	
	
}
