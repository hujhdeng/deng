package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.dao.ChatUserDao;
import com.renrenxian.manage.model.ChatUser;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.ChatUserService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


@Service("chatUserService")
@Transactional
public class ChatUserServiceImpl extends BaseServiceMybatisImpl<ChatUser,Integer> implements ChatUserService{

	private static Logger logger = LoggerFactory.getLogger(ChatUserServiceImpl.class);

	@Resource
	private ChatUserDao chatUserDao;

	@Override
	protected EntityDao<ChatUser, Integer> getEntityDao() {
		return chatUserDao;
	}

	@Override
	public ChatUser findBySeidAndReid(Integer seid, Integer reid) {
		return chatUserDao.findBySeidAndReid(seid, reid);
	}

	@Override
	public void updateByReid(Integer reid) {
		chatUserDao.updateByReid(reid);
	}
	
	@Override
	public void updateByReid2(Integer reid) {
		chatUserDao.updateByReid2(reid);
	}
	
	@Override
	public Page<ChatUser> findBySeid(Integer seid, int pageNo, int pageSize){
		return chatUserDao.findBySeid(seid, pageNo, pageSize);
	}
	
}
