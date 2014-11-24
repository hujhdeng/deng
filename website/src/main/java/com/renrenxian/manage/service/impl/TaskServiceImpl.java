package com.renrenxian.manage.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.renrenxian.manage.service.PartyService;
import com.renrenxian.manage.service.TaskService;

@Component("taskService")
public class TaskServiceImpl implements TaskService {
	
	private static Logger logger = LoggerFactory.getLogger(TaskServiceImpl.class);
	
	@Resource
	private PartyService partyService;
	
	
	// @Scheduled(cron="0/5 * * * * ?")
	public void taskParty(){
		Date date=new Date();  
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
		logger.info("time:{}",  sdf.format(date));
		partyService.task();
	}
	
}
