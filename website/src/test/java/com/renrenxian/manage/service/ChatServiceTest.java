package com.renrenxian.manage.service;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Chat;
import com.renrenxian.manage.model.ChatUser;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class ChatServiceTest {

	@Resource
	private ChatService chatService;
	@Resource
	private ChatUserService chatUserService;
	
	@Test
	public void sendTest() {
		Integer seid = 120;
		Integer reid = 121;
		String content = "哈哈";
		chatService.send(seid, reid, content);
	}
	
	@Test
	public void listTest() {
		
		int seid = 73;
		int reid = 70;
		Page<Chat> page = chatService.list(seid, reid, 2, 2);
		System.out.println(page.getTotalCount());
		System.out.println(page.getResult());
	}
	
	@Test
	public void listUserTest() {
		int uid = 70;
		Page<ChatUser> page = chatUserService.findBySeid(uid, 1, 2);
		System.out.println(page.getTotalCount());
		System.out.println(page.getResult());
	}
	
	
 }
