package com.kh.spring.board;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
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
import org.springframework.web.multipart.MultipartFile;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class BoardContollerTest {

	@Autowired
	WebApplicationContext context;
	
	private MockMvc mockMvc;
	

	@Before
	public void setup() {
		this.mockMvc = webAppContextSetup(context).build();
	}
	
	@Test
	public void insertBoardTest() throws Exception {
		MockMultipartFile file1 = new MockMultipartFile("files","test.png", null,"photo".getBytes()); 		
		MockMultipartFile file2 = new MockMultipartFile("files","test1.png", null,"photo".getBytes()); 		
		
			
			mockMvc.perform(multipart("/board/board-form")
					.file(file1)
					.file(file2)
					.param("bdTitle", "제목")
					.param("content", "내용")
					.param("category", "info"))
			.andDo(print());
			
		
		
	
	}
	
	
}
