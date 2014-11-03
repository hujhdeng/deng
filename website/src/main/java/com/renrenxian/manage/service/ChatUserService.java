package com.renrenxian.manage.service;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.ChatUser;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface ChatUserService extends BaseServiceMybatis<ChatUser,Integer> {

	public ChatUser findBySeidAndReid(Integer seid, Integer reid);
	
	public void updateByReid(Integer reid);
	
	public void updateByReid2(Integer reid);
	
	public Page<ChatUser> findBySeid(Integer seid, int pageNo, int pageSize);
}
