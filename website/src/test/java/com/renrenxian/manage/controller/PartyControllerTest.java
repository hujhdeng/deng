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

import com.renrenxian.controller.PartyController;
import com.renrenxian.manage.model.Party;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:*.xml")
public class PartyControllerTest {

	private static Logger logger = LoggerFactory.getLogger(PartyControllerTest.class);
	protected Model model = new ExtendedModelMap();
	protected MockHttpServletRequest req = new MockHttpServletRequest();
	protected HttpServletResponse res = new MockHttpServletResponse();

	@Resource
	private PartyController partyController;

	
	@Test 
	public void addTest() throws IOException {
		
		req.setRequestURI("/party/add");
		Map<String, Object> map = partyController.add(req, 70, "请求层测试用例", "请求层测试用例", "测试用例", 
				"20140823","北京昌平","北七家","物美","45");
		logger.debug("/party/add");
		System.out.println(map);
	}
	
	
	@Test
	public void listTest() {
		req.setRequestURI("/party/list");
		Map<String, Object> map1 = partyController.list(req,70, null,null,null, 1, 2);
		Map<String, Object> map2 = partyController.list(req,null, 70,null,null, 1, 2);
		System.out.println(map1);
		System.out.println(map2);
	}
	
	
	
	@Test
	public void getPartyInfoTest(){
		req.setRequestURI("/party/info");
		Integer pid = 83;
		Integer uid = 70;
		Map<String,Object> map1 = partyController.info(req,pid, uid);
		Map<String,Object> map2 = partyController.info(req,59, 77);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
	}
	
	@Test
	public void joinTest(){
		req.setRequestURI("/party/join");
		Map<String,Object> map1 = partyController.join(req,81, 77);
		Map<String,Object> map2 = partyController.join(req,81, 77);
		Map<String,Object> map3 = partyController.join(req,54, 77);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	@Test
	public void unjoinTest(){
		req.setRequestURI("/party/unjoin");
		Map<String,Object> map1 = partyController.unjoin(req,81, 77);
		Map<String,Object> map2 = partyController.unjoin(req,81, 77);
		Map<String,Object> map3 = partyController.unjoin(req,54, 77);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	@Test
	public void joinUsersListTest(){
		req.setRequestURI("/party/joinUserList");
		Map<String,Object> map1 = partyController.joinUsersList(req,80, 1,2);
		Map<String,Object> map2 = partyController.joinUsersList(req,55, 1,2);
		Map<String,Object> map3 = partyController.joinUsersList(req,54, 1,2);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	@Test
	public void cancelPartyTest() throws Exception{
		req.setRequestURI("/party/cancel");
		Map<String, Object> map = partyController.add(req, 70, "请求层测试用例", "请求层测试用例", "测试用例", 
				"20140823","北京昌平","北七家","物美","45");
		Party p = (Party)map.get("data");
		Integer pid = p.getId();
		Map<String,Object> map1 = partyController.cancelParty(req,pid, 77);
		Map<String,Object> map2 = partyController.cancelParty(req,pid, 1);
		Map<String,Object> map3 = partyController.cancelParty(req,54,  77);
		Map<String,Object> map4 = partyController.cancelParty(req,pid, p.getUid());
		Map<String,Object> map5 = partyController.cancelParty(req,pid, p.getUid());
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
		System.out.println("4####:"+map4);
		System.out.println("5####:"+map5);
	}
	
	
}
