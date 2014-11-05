package com.renrenxian.manage.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Chat;
import com.renrenxian.manage.model.ChatUser;
import com.renrenxian.manage.model.Party;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class PartyServiceTest {

	@Resource
	private PartyService partyService;
	
	@Test
	public void createTest() throws Exception {
		Date patytime = new Date();
		Map<String,Object> map = partyService.createParty(70, "测试用例", "测试用例", "郊游",patytime , "测试城市", "测试地域", "测试地址", "20");
		System.out.println(JSONObject.fromObject(map));
	}
	
	@Test
	public void listTest() {
		
		Page<Party> page1 = partyService.list(70, null,null,null, 1, 2);
		Page<Party> page2 = partyService.list(null, 70,null,null, 1, 2);
		System.out.println(page1.getTotalCount());
		System.out.println(page2.getTotalCount());
	}
	
	@Test
	public void stringTest() {
		//测试一下从joinlist里移除指定id的算法，需要分id在结尾和在非结尾2种情况进行截取移除
		String jlist = "|77|71|76|75|78";
		String juid = "|71";
		
		int in = jlist.indexOf(juid+"|");
		int len = juid.length()+1;
		if(in>-1){//不在结尾
			jlist = jlist.substring(0, in)+jlist.substring(in+len-1);
		}else{
			in = jlist.lastIndexOf(juid);
			jlist = jlist.substring(0, in);
		}
		
		
		
		System.out.println(jlist);
	}
	
	
 }
