package com.renrenxian.manage.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

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

import com.renrenxian.common.util.Page;
import com.renrenxian.controller.SdanController;
import com.renrenxian.manage.model.Sdan;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:*.xml")
public class SdanControllerTest {

	private static Logger logger = LoggerFactory.getLogger(SdanControllerTest.class);
	protected Model model = new ExtendedModelMap();
	protected MockHttpServletRequest req = new MockHttpServletRequest();
	protected HttpServletResponse res = new MockHttpServletResponse();

	@Resource
	private SdanController sdanController;
	
	@Test
	public void createTest() throws Exception {
		Map<String,Object> map = sdanController.add(req,77, "测试用例", "测试", "测试用例", "10万", "40", "40", "直户，看过房产，无贷款足值，谁能做报个底点");
		System.out.println(JSONObject.fromObject(map));
	}
	
	@Test
	public void listTest() {
		
		Map<String,Object> map = sdanController.list(req,77, null, null, null, 1, 2);
		System.out.println(map);
	}
	
	
	@Test
	public void getSdanInfoTest(){
		Integer pid = 126;
		Integer uid = 77;
		Map<String,Object> map1 = sdanController.info(req,pid, uid);
		Map<String,Object> map2 = sdanController.info(req,59, 77);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
	}
	
	@Test
	public void joinTest(){
		//Map<String,Object> map1 = sdanController.join(req,126, 77,"测试用例");
		//Map<String,Object> map2 = sdanController.join(req,126, 77,"测试用例");
		//Map<String,Object> map3 = sdanController.join(req,54, 77,"测试用例");
		System.out.println("1####:"+sdanController.join(req,126, 77,"测试用例"));
		//System.out.println("2####:"+map2);
		//System.out.println("3####:"+map3);
	}
	
	
	
	@Test
	public void joinUsersListTest(){
		Map<String,Object> map1 = sdanController.joinUsersList(req,126, 1,2);
		//Map<String,Object> map2 = sdanController.joinUsersList(req,126, 1,2);
		//Map<String,Object> map3 = sdanController.joinUsersList(req,54, 1,2);
		System.out.println("1####:"+map1);
		//System.out.println("2####:"+map2);
		//System.out.println("3####:"+map3);
	}
	
	
	@Test
	public void sdanConnectTest(){
		sdanController.join(req,126, 83,"测试用例");
		Map<String,Object> map1 = sdanController.sdanConnect(req,126, 77, 83);
		Map<String,Object> map2 = sdanController.sdanConnect(req,126, 88, 83);
		Map<String,Object> map3 = sdanController.sdanConnect(req,1, 88, 83);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	
	@Test
	public void disConnectTest(){
		Map<String,Object> map1 = sdanController.disConnect(req,126, 88);
		Map<String,Object> map2 = sdanController.disConnect(req,1, 88);
		Map<String,Object> map3 = sdanController.disConnect(req,126, 77);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	
	@Test
	public void addChatTest(){
		Map<String,Object> map1 = sdanController.chatAdd(req,126, 77, 88, "测试用例1");
		Map<String,Object> map2 = sdanController.chatAdd(req,126, 88, 77, "测试用例2");
		Map<String,Object> map3 = sdanController.chatAdd(req,126, 1, 77, "测试用例3");
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	@Test
	public void chatListTest(){
		Map<String,Object> map1 = sdanController.chatList(req,126, 77, 1, 20);
		Map<String,Object> map2 = sdanController.chatList(req,126, 88, 1, 20);
		Map<String,Object> map3 = sdanController.chatList(req,126, 1, 1, 20);
		Map<String,Object> map4 = sdanController.chatList(req,1,77, 1, 20);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
		System.out.println("4####:"+map4);
	}
	
	
	@Test
	public void assessTest(){
		Map<String,Object> map1 = sdanController.assess(req,126, 77, 3, "测试用例");
		Map<String,Object> map2 = sdanController.assess(req,126, 88, 3, "测试用例");
		Map<String,Object> map3 = sdanController.assess(req,1, 77, 3, "测试用例");
		Map<String,Object> map4 = sdanController.assess(req,126, 77, 1, "测试用例");
		Map<String,Object> map5 = sdanController.assess(req,126, 77, 2, "测试用例");
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
		System.out.println("4####:"+map4);
		System.out.println("5####:"+map5);
	}
	
	
 }
