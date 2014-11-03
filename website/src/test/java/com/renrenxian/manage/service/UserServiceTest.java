package com.renrenxian.manage.service;

import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.renrenxian.manage.model.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class UserServiceTest {

	@Resource
	private UserService userService;
	
	@Test
	public void testgetByPhone(){
		User user = userService.getByPhone("13466754325");
		System.out.println(user);
	}
	
	
	@Test
	public void testUpdateKV(){
		userService.updateKV(120, "address", "address111", "30.0", "30.0");
		System.out.println("...");
	}
	
	@Test
	public void testupdateReplenish() {
		User user = new User();
		user.setId(120);
		user.setAddress("北京。。。");
		user.setSex("1");
		Map<String, Object> map = userService.updateReplenish(user);
		System.out.println(map);
	}
	
	@Test
	public void testaddFollow(){
		// Map<String, Object> map = userService.addFollow(120, "18910888402");
		// 
		Map<String, Object> map = userService.addFollow(121, "13488783965");
		System.out.println(map);
	}
	
	
	@Test
	public void testdeteleFollow(){
		Map<String, Object> map = userService.deleteFollow(120, "18910888402");
		// 
		// Map<String, Object> map = userService.deleteFollow(121, "13488783965");
		System.out.println(map);
	}
	
	
}
