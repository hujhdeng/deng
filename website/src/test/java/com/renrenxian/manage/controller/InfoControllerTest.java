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

import com.renrenxian.controller.InfoController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:*.xml")
public class InfoControllerTest {

	private static Logger logger = LoggerFactory.getLogger(InfoControllerTest.class);
	protected Model model = new ExtendedModelMap();
	protected MockHttpServletRequest req = new MockHttpServletRequest();
	protected HttpServletResponse res = new MockHttpServletResponse();

	@Resource
	private InfoController infoController;
	
	@Test
	public void testVer(){
		req.setRequestURI("/info/ver");
		Map<String,Object> map = infoController.ver(req);
		logger.info("return map:{}", map);

	}
	
}
