package com.renrenxian.manage.service;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.SdanMessage;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class SdanMessageServiceTest {

	@Resource
	private SdanMessageService sdanMessageService;
	
	@Test
	public void test1(){
		// Page<SdanMessage> page = sdanMessageService.getBySid(111, 1, 20);
		// System.out.println(page.getResult());
	}
	
}
