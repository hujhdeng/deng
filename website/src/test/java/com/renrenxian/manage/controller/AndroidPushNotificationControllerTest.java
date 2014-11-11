package com.renrenxian.manage.controller;

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

import com.renrenxian.controller.AndroidPushNotificationController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:*.xml")
public class AndroidPushNotificationControllerTest {
	
	private static Logger logger = LoggerFactory.getLogger(PartyControllerTest.class);
	protected Model model = new ExtendedModelMap();
	protected MockHttpServletRequest req = new MockHttpServletRequest();
	protected HttpServletResponse res = new MockHttpServletResponse();
	
	@Resource
	private AndroidPushNotificationController androidPushNotificationController;
	
	
	private String uid = "698148930698234752";//百度测试app日志里的userId
	private String pushid = "3874779336278337834";
	
	@Test
	public void apushTest(){
		Map<String,Object> map = androidPushNotificationController.apush(req, uid, "test");
		
		System.out.println("#########"+map);
		
	}
	
}
