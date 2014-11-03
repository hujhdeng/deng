package com.renrenxian.manage.service;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class YzmServiceTest {

	@Resource
	private YzmService yzmService;
	
	@Test
	public void testSend(){
		boolean b = yzmService.send("13488783965");
		System.out.println(b);
	}
	
	@Test
	public void testCheck() {
		boolean b = yzmService.checkYzm("13488783965", "1088");
		System.out.println(b);
	}
}
