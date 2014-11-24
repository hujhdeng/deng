package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.renrenxian.manage.service.PartyService;
import com.renrenxian.manage.service.TaskService;

@Component
public class TaskServiceImpl implements TaskService {
	
	
	@Resource
	private PartyService partyService;
	
	
	@Scheduled(cron="0/5 * * * * ?")
	public void taskParty(){
		System.out.println("1");
		partyService.task();
	}
	
}
