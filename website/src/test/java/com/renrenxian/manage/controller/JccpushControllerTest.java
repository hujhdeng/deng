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

import com.renrenxian.common.util.PushMessageUtil;
import com.renrenxian.controller.JccpushController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:*.xml")
public class JccpushControllerTest {
	
	
	protected Model model = new ExtendedModelMap();
	protected MockHttpServletRequest req = new MockHttpServletRequest();
	protected HttpServletResponse res = new MockHttpServletResponse();
	
	@Resource
	private JccpushController jccpushController;
	
	
	private String pushid = "698148930698234752";//百度测试app日志里的userId
	private String channelId = "3874779336278337834";
	
	/**
	 * 绑定账号
	 */
	@Test
	public void bindTest(){
		Map<String,Object> map = jccpushController.bind(req, "77", pushid, "3");
		
		System.out.println("#########"+map);
		
	}
	
	/**
	 * 往指定发送消息
	 */
	@Test
	public void pushTest(){
		//Map<String,Object> map = jccpushController.push(req, 83, 77, "testnew");
		
		System.out.println("#########"+PushMessageUtil.push(pushid, "tttttt", PushMessageUtil.MES_TYPE_MS, Integer.valueOf(4)));
		
	}
	
}
