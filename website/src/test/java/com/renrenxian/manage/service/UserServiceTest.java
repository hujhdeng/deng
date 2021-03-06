package com.renrenxian.manage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.renrenxian.common.util.Page;
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
		user.setId(132);
		// user.setAddress("北京。。。");
		// user.setSex("1");
		user.setLat(39.910184);
		user.setLng(116.556775);
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
	
	
	@Test
	public void testFollow() {
		Page<User> page = userService.follows(120, 1, 20);
		if(page != null ) {
			System.out.println(page.getTotalCount());
			System.out.println(page.getPageCount());
			System.out.println(page.getResult());
		}
	}
	
	
	@Test
	public void testFollowme() {
		Page<User> page = userService.followme(116, 1, 10);
		if(page != null ) {
			System.out.println(page.getTotalCount());
			System.out.println(page.getPageCount());
			System.out.println(page.getResult());
		}
	}
	
	@Test
	public void testFollowBoth() {
		List<User> list = userService.followBoth(120);
		System.out.println(list);
	}
	
	@Test
	public void testSearch() {
		// userService.search(uid, whereList, sortList, pageno, pagesize);
	}
	
	@Test
	public void testnear() {
		
		int uid = 120;
		Double minlng = 110.0;
		Double maxlng = 130.0;
		Double minlat = 30.0;
		Double maxlat = 50.0;
		String starttime = "2010-01-01 00:00:00";
		int pageno = 1;
		int pagesize = 20;
		
		Map<String, Object> map = userService.near(uid, minlng, maxlng, minlat, maxlat, starttime, pageno, pagesize);
		System.out.println(map);
		
	}
	
	@Test
	public void testfindByIdCount() {
		Integer i = userService.findByIdCount(120);
		System.out.println(i);
		
	}
	
	@Test
	public void testkwsearch(){
		Map<String, Object> map = userService.kwsearch(122, "资源", 1, 20);
		System.out.println(map);
	}
	
	
}
