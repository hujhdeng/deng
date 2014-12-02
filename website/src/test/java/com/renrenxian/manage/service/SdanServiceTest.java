package com.renrenxian.manage.service;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Sdan;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class SdanServiceTest {

	@Resource
	private SdanService sdanService;
	
	@Test
	public void createTest() throws Exception {
		Map<String,Object> map = sdanService.create(77, "测试用例", "测试", "测试用例", "10万", "40", "40", "直户，看过房产，无贷款足值，谁能做报个底点");
		System.out.println(JSONObject.fromObject(map));
	}
	
	@Test
	public void listTest() {
		
		Page<Sdan> page1 = sdanService.list(77, null, null, null, 1, 2);
		System.out.println(page1.getTotalCount());
	}
	
	
	@Test
	public void getSdanInfoTest(){
		Integer pid = 126;
		Integer uid = 70;
		Map<String,Object> map1 = sdanService.getSdanInfo(pid, uid);
		Map<String,Object> map2 = sdanService.getSdanInfo(59, 77);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
	}
	
	@Test
	public void joinTest(){
		Map<String,Object> map1 = sdanService.join(126, 77,"测试用例");
		Map<String,Object> map2 = sdanService.join(126, 77,"测试用例");
		Map<String,Object> map3 = sdanService.join(54, 77,"测试用例");
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	
	
	@Test
	public void joinUsersListTest(){
		Map<String,Object> map1 = sdanService.joinUsersList(126, 1,2);
		Map<String,Object> map2 = sdanService.joinUsersList(126, 1,2);
		Map<String,Object> map3 = sdanService.joinUsersList(54, 1,2);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	
	@Test
	public void sdanConnectTest(){
		sdanService.join(126, 83,"测试用例");
		Map<String,Object> map1 = sdanService.sdanConnect(126, 77, 83);
		Map<String,Object> map2 = sdanService.sdanConnect(126, 88, 83);
		Map<String,Object> map3 = sdanService.sdanConnect(1, 88, 83);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	
	@Test
	public void disConnectTest(){
		Map<String,Object> map1 = sdanService.disConnect(126, 88);
		Map<String,Object> map2 = sdanService.disConnect(1, 88);
		Map<String,Object> map3 = sdanService.disConnect(126, 77);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	
	@Test
	public void addChatTest(){
		Map<String,Object> map1 = sdanService.addChat(126, 77, 88, "测试用例1");
		Map<String,Object> map2 = sdanService.addChat(126, 88, 77, "测试用例2");
		Map<String,Object> map3 = sdanService.addChat(126, 1, 77, "测试用例3");
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
	}
	
	@Test
	public void chatListTest(){
		/**
		Map<String,Object> map1 = sdanService.chatList(126, 77, 1, 20);
		Map<String,Object> map2 = sdanService.chatList(126, 88, 1, 20);
		Map<String,Object> map3 = sdanService.chatList(126, 1, 1, 20);
		Map<String,Object> map4 = sdanService.chatList(1,77, 1, 20);
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
		System.out.println("4####:"+map4);
		**/
	}
	
	
	@Test
	public void assessTest(){
		Map<String,Object> map1 = sdanService.assess(126, 77, 3, "测试用例");
		Map<String,Object> map2 = sdanService.assess(126, 88, 3, "测试用例");
		Map<String,Object> map3 = sdanService.assess(1, 77, 3, "测试用例");
		Map<String,Object> map4 = sdanService.assess(126, 77, 1, "测试用例");
		Map<String,Object> map5 = sdanService.assess(126, 77, 2, "测试用例");
		System.out.println("1####:"+map1);
		System.out.println("2####:"+map2);
		System.out.println("3####:"+map3);
		System.out.println("4####:"+map4);
		System.out.println("5####:"+map5);
	}
	
	
 }
