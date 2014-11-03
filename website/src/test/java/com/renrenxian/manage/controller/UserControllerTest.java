package com.renrenxian.manage.controller;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import com.renrenxian.controller.UserController;
import com.renrenxian.manage.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:*.xml")
public class UserControllerTest {

	private static Logger logger = LoggerFactory.getLogger(UserControllerTest.class);
	protected Model model = new ExtendedModelMap();
	protected MockHttpServletRequest req = new MockHttpServletRequest();
	protected HttpServletResponse res = new MockHttpServletResponse();

	@Resource
	private UserController userController;

	
	@Test 
	public void testReg() throws IOException {
		
		req.setRequestURI("/user/reg");
		Map<String, Object> map = userController.reg(req, "13488783965", "111111", "8520", "3.0", "45");
		logger.debug("/user/reg");
		System.out.println(map);
	}
	
	@Test 
	public void testlogin() throws IOException {
		
		req.setRequestURI("/user/login");
		Map<String, Object> map = userController.login(req, "13488783965", "111111", "43.0", "4.5");
		logger.debug("/user/login");
		System.out.println(map);
	}
	
	@Test 
	public void testreplenish() throws IOException {
		req.setRequestURI("/user/replenish");
		User user = new User();
		user.setId(120);
		user.setAddress("北京。2。");
		user.setSex("1");
		Map<String, Object> map = userController.replenish(req, user);
		logger.debug("/user/replenish");
		System.out.println(map);
	}
	
	
	
}
