package com.renrenxian.manage.service;

import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.renrenxian.manage.model.Jccpush;
import com.renrenxian.manage.service.impl.JccpushServiceImpl;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class JccpushServiceTest {

	
	private static Logger logger = LoggerFactory.getLogger(JccpushServiceImpl.class);

	@Resource
	private JccpushService jccpushService;
	
	@Test
	public void test1() throws JSONException {
		
		JSONObject message = new JSONObject();
		
		int seid = 132;
		int reid = 138;
		message.put("uid", seid);
		message.put("uname", "23"); 
		message.put("avatar", ""); 
		message.put("content", "2311111");
		
		JSONObject json = new JSONObject();
		json.put("type", 1); // 聊天
		json.put("message", message);
		
		logger.info("json:{}", json);
		
		Map<String,Object> map = jccpushService.sendMessage(seid, reid, json.toString());
		logger.info("return map:{}", map);
		
		
	}
	
	@Test
	public void testgetId() {
		
		Jccpush jcc = jccpushService.getById(133);
		logger.info("jcc:{}", jcc);
	}

}
