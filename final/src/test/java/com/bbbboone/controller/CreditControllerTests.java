package com.bbbboone.controller;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class CreditControllerTests {
	
	@Setter @Autowired 
	private WebApplicationContext ctx;
	private MockMvc mvc;
	
	@Before
	public void setup(){
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	@Test
	public void testExist(){
		assertNotNull(ctx);
		assertNotNull(mvc);
		log.info(ctx);
		log.info(mvc);
	}
	@Test
	public void testCreate() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/credit/new")
				.param("courname", "테스트트")
				.param("studno", "1234"))
			.andReturn()
			.getModelAndView();
		
		log.info(mav.getViewName());
	}
}